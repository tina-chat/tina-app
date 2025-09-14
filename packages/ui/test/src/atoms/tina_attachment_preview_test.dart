import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/atoms/tina_attachment_preview.dart';
import 'package:ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaAttachmentPreview', () {
    testWidgets('renders file name and type correctly', (tester) async {
      const fileName = 'document.pdf';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaAttachmentPreview(
              fileName: fileName,
              fileType: TinaAttachmentType.pdf,
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
            body: TinaAttachmentPreview(
              fileName: 'large_file.pdf',
              fileType: TinaAttachmentType.pdf,
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
            body: TinaAttachmentPreview(
              fileName: 'image.jpg',
              fileType: TinaAttachmentType.image,
              thumbnailUrl: thumbnailUrl,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(AspectRatio), findsOneWidget);
    });

    testWidgets('shows download button when onDownload is provided', (tester) async {
      bool downloadCalled = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
              onDownload: () => downloadCalled = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.download), findsOneWidget);
      
      await tester.tap(find.byIcon(Icons.download));
      expect(downloadCalled, isTrue);
    });

    testWidgets('shows remove button when onRemove is provided', (tester) async {
      bool removeCalled = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
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
            body: TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
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
            body: TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
              size: TinaAttachmentPreviewSize.small,
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final mainContainer = containers.firstWhere(
        (container) => container.constraints != null &&
            container.constraints!.maxWidth == 200.0,
      );
      final constraints = mainContainer.constraints as BoxConstraints;
      expect(constraints.maxWidth, 200.0);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
              size: TinaAttachmentPreviewSize.medium,
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final mainContainer = containers.firstWhere(
        (container) => container.constraints != null &&
            container.constraints!.maxWidth == 280.0,
      );
      final constraints = mainContainer.constraints as BoxConstraints;
      expect(constraints.maxWidth, 280.0);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
              size: TinaAttachmentPreviewSize.large,
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final mainContainer = containers.firstWhere(
        (container) => container.constraints != null &&
            container.constraints!.maxWidth == 360.0,
      );
      final constraints = mainContainer.constraints as BoxConstraints;
      expect(constraints.maxWidth, 360.0);
    });

    testWidgets('shows correct icons for different file types', (tester) async {
      final testCases = [
        (TinaAttachmentType.image, Icons.image),
        (TinaAttachmentType.video, Icons.videocam),
        (TinaAttachmentType.audio, Icons.audiotrack),
        (TinaAttachmentType.document, Icons.description),
        (TinaAttachmentType.pdf, Icons.picture_as_pdf),
        (TinaAttachmentType.spreadsheet, Icons.table_chart),
        (TinaAttachmentType.presentation, Icons.slideshow),
        (TinaAttachmentType.archive, Icons.archive),
        (TinaAttachmentType.code, Icons.code),
        (TinaAttachmentType.other, Icons.attach_file),
      ];

      for (final (fileType, expectedIcon) in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaAttachmentPreview(
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
              body: TinaAttachmentPreview(
                fileName: 'test_file',
                fileType: TinaAttachmentType.pdf,
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
            body: TinaAttachmentPreview(
              fileName: 'broken_image.jpg',
              fileType: TinaAttachmentType.image,
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
      const longFileName = 'This_is_a_very_long_file_name_that_should_be_truncated_properly.pdf';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaAttachmentPreview(
              fileName: longFileName,
              fileType: TinaAttachmentType.pdf,
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
            body: TinaAttachmentPreview(
              fileName: 'document.pdf',
              fileType: TinaAttachmentType.pdf,
            ),
          ),
        ),
      );

      expect(find.bySemanticsLabel('pdf file'), findsOneWidget);
    });

    testWidgets('shows progress without percentage when progress is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
              isDownloading: true,
              onDownload: () {},
            ),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.textContaining('%'), findsNothing);
    });

    group('TinaAttachmentType enum', () {
      test('has all expected values', () {
        expect(TinaAttachmentType.values, hasLength(10));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.image));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.video));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.audio));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.document));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.pdf));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.spreadsheet));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.presentation));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.archive));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.code));
        expect(TinaAttachmentType.values, contains(TinaAttachmentType.other));
      });
    });

    group('TinaAttachmentPreviewSize enum', () {
      test('has all expected values', () {
        expect(TinaAttachmentPreviewSize.values, hasLength(3));
        expect(TinaAttachmentPreviewSize.values, contains(TinaAttachmentPreviewSize.small));
        expect(TinaAttachmentPreviewSize.values, contains(TinaAttachmentPreviewSize.medium));
        expect(TinaAttachmentPreviewSize.values, contains(TinaAttachmentPreviewSize.large));
      });
    });
  });
}