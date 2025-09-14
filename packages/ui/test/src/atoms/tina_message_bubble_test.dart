import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_message_bubble.dart';
import 'package:tina_ui/src/atoms/tina_message_status.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaMessageBubble', () {
    testWidgets('renders text message correctly', (tester) async {
      const messageContent = 'Hello, this is a test message';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: messageContent,
              isUser: true,
            ),
          ),
        ),
      );

      expect(find.text(messageContent), findsOneWidget);
      expect(find.byType(SelectableText), findsOneWidget);
    });

    testWidgets('applies user message styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'User message',
              isUser: true,
            ),
          ),
        ),
      );

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.centerRight);

      // Find the message container with decoration
      final containers = tester.widgetList<Container>(find.byType(Container));
      final messageContainer = containers.firstWhere(
        (container) =>
            container.decoration != null &&
            container.decoration is BoxDecoration &&
            (container.decoration! as BoxDecoration).color ==
                DesignColors.primaryBase,
      );

      final decoration = messageContainer.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.primaryBase);
    });

    testWidgets('applies AI message styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'AI message',
              isUser: false,
            ),
          ),
        ),
      );

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.centerLeft);

      // Find the message container with decoration
      final containers = tester.widgetList<Container>(find.byType(Container));
      final messageContainer = containers.firstWhere(
        (container) =>
            container.decoration != null &&
            container.decoration is BoxDecoration &&
            (container.decoration! as BoxDecoration).color ==
                DesignColors.neutral100,
      );

      final decoration = messageContainer.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.neutral100);
    });

    testWidgets('displays timestamp when provided', (tester) async {
      final timestamp = DateTime.now().subtract(const Duration(minutes: 5));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'Message with timestamp',
              isUser: true,
              timestamp: timestamp,
            ),
          ),
        ),
      );

      expect(find.text('5m ago'), findsOneWidget);
    });

    testWidgets('shows status indicator for user messages', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'User message',
              isUser: true,
              status: TinaMessageDeliveryStatus.delivered,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.done_all), findsOneWidget);
    });

    testWidgets('does not show status indicator for AI messages', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'AI message',
              isUser: false,
              status: TinaMessageDeliveryStatus.delivered,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.done_all), findsNothing);
    });

    testWidgets('applies error styling for error status', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'Error message',
              isUser: true,
              status: TinaMessageDeliveryStatus.error,
            ),
          ),
        ),
      );

      // Find the message container with error styling
      final containers = tester.widgetList<Container>(find.byType(Container));
      final messageContainer = containers.firstWhere(
        (container) =>
            container.decoration != null &&
            container.decoration is BoxDecoration &&
            (container.decoration! as BoxDecoration).border != null,
      );

      final decoration = messageContainer.decoration! as BoxDecoration;
      expect(decoration.border?.top.color, DesignColors.error);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('handles image content type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'https://example.com/image.jpg',
              isUser: true,
              contentType: TinaMessageContentType.image,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('handles file content type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'document.pdf',
              isUser: true,
              contentType: TinaMessageContentType.file,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.attach_file), findsOneWidget);
      expect(find.text('document.pdf'), findsOneWidget);
    });

    testWidgets('has GestureDetector when onTap is provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'Tappable message',
              isUser: true,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('has GestureDetector when onLongPress is provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'Long pressable message',
              isUser: true,
              onLongPress: () {},
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('respects maxWidth constraint', (tester) async {
      const customMaxWidth = 200.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageBubble(
              content: 'Message with custom max width',
              isUser: true,
              maxWidth: customMaxWidth,
            ),
          ),
        ),
      );

      // Find the container with constraints
      final containers = tester.widgetList<Container>(find.byType(Container));
      final constrainedContainer = containers.firstWhere(
        (container) =>
            container.constraints != null &&
            container.constraints!.maxWidth == customMaxWidth,
      );

      final constraints = constrainedContainer.constraints!;
      expect(constraints.maxWidth, customMaxWidth);
    });

    group('TinaMessageDeliveryStatus enum', () {
      test('has all expected values', () {
        expect(TinaMessageDeliveryStatus.values, hasLength(5));
        expect(
          TinaMessageDeliveryStatus.values,
          contains(TinaMessageDeliveryStatus.sending),
        );
        expect(
          TinaMessageDeliveryStatus.values,
          contains(TinaMessageDeliveryStatus.sent),
        );
        expect(
          TinaMessageDeliveryStatus.values,
          contains(TinaMessageDeliveryStatus.delivered),
        );
        expect(
          TinaMessageDeliveryStatus.values,
          contains(TinaMessageDeliveryStatus.read),
        );
        expect(
          TinaMessageDeliveryStatus.values,
          contains(TinaMessageDeliveryStatus.error),
        );
      });
    });

    group('TinaMessageContentType enum', () {
      test('has all expected values', () {
        expect(TinaMessageContentType.values, hasLength(3));
        expect(
          TinaMessageContentType.values,
          contains(TinaMessageContentType.text),
        );
        expect(
          TinaMessageContentType.values,
          contains(TinaMessageContentType.image),
        );
        expect(
          TinaMessageContentType.values,
          contains(TinaMessageContentType.file),
        );
      });
    });

    group('timestamp formatting', () {
      testWidgets('shows "Just now" for recent messages', (tester) async {
        final timestamp = DateTime.now().subtract(const Duration(seconds: 30));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaMessageBubble(
                content: 'Recent message',
                isUser: true,
                timestamp: timestamp,
              ),
            ),
          ),
        );

        expect(find.text('Just now'), findsOneWidget);
      });

      testWidgets('shows minutes for messages under an hour', (tester) async {
        final timestamp = DateTime.now().subtract(const Duration(minutes: 30));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaMessageBubble(
                content: 'Half hour old message',
                isUser: true,
                timestamp: timestamp,
              ),
            ),
          ),
        );

        expect(find.text('30m ago'), findsOneWidget);
      });

      testWidgets('shows hours for messages under a day', (tester) async {
        final timestamp = DateTime.now().subtract(const Duration(hours: 3));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaMessageBubble(
                content: 'Three hours old message',
                isUser: true,
                timestamp: timestamp,
              ),
            ),
          ),
        );

        expect(find.text('3h ago'), findsOneWidget);
      });
    });
  });
}
