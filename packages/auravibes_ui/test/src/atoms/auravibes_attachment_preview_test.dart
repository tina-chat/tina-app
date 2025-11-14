import 'package:auravibes_ui/src/atoms/auravibes_attachment_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuraAttachmentPreview', () {
    testWidgets('renders file name and type correctly', (tester) async {
      const fileName = 'document.pdf';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: fileName,
              fileType: AuraAttachmentType.pdf,
            ),
          ),
        ),
      );

      expect(find.text(fileName), findsOneWidget);
      expect(find.byIcon(Icons.picture_as_pdf), findsOneWidget);
    });

    testWidgets('displays file size when provided', (tester) async {
      const fileSize = 1024 * 1024; // 1 MB

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'large_file.pdf',
              fileType: AuraAttachmentType.pdf,
              fileSize: fileSize,
            ),
          ),
        ),
      );

      expect(find.text('1.0 MB'), findsOneWidget);
    });

    testWidgets('shows thumbnail for image type with URL', (tester) async {
      const thumbnailUrl = 'https://example.com/image.jpg';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'image.jpg',
              fileType: AuraAttachmentType.image,
              thumbnailUrl: thumbnailUrl,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(AspectRatio), findsOneWidget);
    });

    testWidgets('shows download button when onDownload is provided', (
      tester,
    ) async {
      var downloadCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
              onDownload: () => downloadCalled = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.download), findsOneWidget);

      await tester.tap(find.byIcon(Icons.download));
      expect(downloadCalled, isTrue);
    });

    testWidgets('shows remove button when onRemove is provided', (
      tester,
    ) async {
      var removeCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
              onRemove: () => removeCalled = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      expect(removeCalled, isTrue);
    });

    testWidgets('shows downloading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
              isDownloading: true,
              downloadProgress: 0.5,
              onDownload: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.downloading), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.text('50%'), findsOneWidget);

      // Download button should be disabled
      final downloadButton = tester.widget<IconButton>(
        find.widgetWithIcon(IconButton, Icons.downloading),
      );
      expect(downloadButton.onPressed, isNull);
    });

    testWidgets('applies small size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
              size: AuraAttachmentPreviewSize.small,
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final mainContainer = containers.firstWhere(
        (container) =>
            container.constraints != null &&
            container.constraints!.maxWidth == 200.0,
      );
      final constraints = mainContainer.constraints!;
      expect(constraints.maxWidth, 200.0);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final mainContainer = containers.firstWhere(
        (container) =>
            container.constraints != null &&
            container.constraints!.maxWidth == 280.0,
      );
      final constraints = mainContainer.constraints!;
      expect(constraints.maxWidth, 280.0);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
              size: AuraAttachmentPreviewSize.large,
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final mainContainer = containers.firstWhere(
        (container) =>
            container.constraints != null &&
            container.constraints!.maxWidth == 360.0,
      );
      final constraints = mainContainer.constraints!;
      expect(constraints.maxWidth, 360.0);
    });

    testWidgets('shows correct icons for different file types', (tester) async {
      final testCases = [
        (AuraAttachmentType.image, Icons.image),
        (AuraAttachmentType.video, Icons.videocam),
        (AuraAttachmentType.audio, Icons.audiotrack),
        (AuraAttachmentType.document, Icons.description),
        (AuraAttachmentType.pdf, Icons.picture_as_pdf),
        (AuraAttachmentType.spreadsheet, Icons.table_chart),
        (AuraAttachmentType.presentation, Icons.slideshow),
        (AuraAttachmentType.archive, Icons.archive),
        (AuraAttachmentType.code, Icons.code),
        (AuraAttachmentType.other, Icons.attach_file),
      ];

      for (final (fileType, expectedIcon) in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AuraAttachmentPreview(
                fileName: 'test_file',
                fileType: fileType,
              ),
            ),
          ),
        );

        expect(find.byIcon(expectedIcon), findsOneWidget);
      }
    });

    testWidgets('formats file sizes correctly', (tester) async {
      final testCases = [
        (512, '512 B'),
        (1024, '1.0 KB'),
        (1024 * 1024, '1.0 MB'),
        (1024 * 1024 * 1024, '1.0 GB'),
      ];

      for (final (size, expectedText) in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AuraAttachmentPreview(
                fileName: 'test_file',
                fileType: AuraAttachmentType.pdf,
                fileSize: size,
              ),
            ),
          ),
        );

        expect(find.text(expectedText), findsOneWidget);
      }
    });

    testWidgets('handles image loading error gracefully', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'broken_image.jpg',
              fileType: AuraAttachmentType.image,
              thumbnailUrl: 'https://invalid-url.com/image.jpg',
            ),
          ),
        ),
      );

      // Should fallback to file icon when image fails to load
      await tester.pump();
      expect(find.byIcon(Icons.image), findsOneWidget);
    });

    testWidgets('truncates long file names', (tester) async {
      const longFileName =
          'This_is_a_very_long_file_name_that_should_be_truncated_properly.pdf';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: longFileName,
              fileType: AuraAttachmentType.pdf,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text(longFileName));
      expect(text.maxLines, 2);
      expect(text.overflow, TextOverflow.ellipsis);
    });

    testWidgets('has proper semantic labels for icons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'document.pdf',
              fileType: AuraAttachmentType.pdf,
            ),
          ),
        ),
      );

      expect(find.bySemanticsLabel('pdf file'), findsOneWidget);
    });

    testWidgets('shows progress without percentage when progress is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
              isDownloading: true,
              onDownload: () {},
            ),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.textContaining('%'), findsNothing);
    });

    group('AuraAttachmentType enum', () {
      test('has all expected values', () {
        expect(AuraAttachmentType.values, hasLength(10));
        expect(AuraAttachmentType.values, contains(AuraAttachmentType.image));
        expect(AuraAttachmentType.values, contains(AuraAttachmentType.video));
        expect(AuraAttachmentType.values, contains(AuraAttachmentType.audio));
        expect(
          AuraAttachmentType.values,
          contains(AuraAttachmentType.document),
        );
        expect(AuraAttachmentType.values, contains(AuraAttachmentType.pdf));
        expect(
          AuraAttachmentType.values,
          contains(AuraAttachmentType.spreadsheet),
        );
        expect(
          AuraAttachmentType.values,
          contains(AuraAttachmentType.presentation),
        );
        expect(AuraAttachmentType.values, contains(AuraAttachmentType.archive));
        expect(AuraAttachmentType.values, contains(AuraAttachmentType.code));
        expect(AuraAttachmentType.values, contains(AuraAttachmentType.other));
      });
    });

    group('AuraAttachmentPreviewSize enum', () {
      test('has all expected values', () {
        expect(AuraAttachmentPreviewSize.values, hasLength(3));
        expect(
          AuraAttachmentPreviewSize.values,
          contains(AuraAttachmentPreviewSize.small),
        );
        expect(
          AuraAttachmentPreviewSize.values,
          contains(AuraAttachmentPreviewSize.medium),
        );
        expect(
          AuraAttachmentPreviewSize.values,
          contains(AuraAttachmentPreviewSize.large),
        );
      });
    });
  });
}
