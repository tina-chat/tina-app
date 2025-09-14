import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_message_status.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

void main() {
  group('TinaMessageStatus', () {
    testWidgets('renders sending status with correct icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light().copyWith(
            extensions: const [TinaTheme.light],
          ),
          home: const Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sending,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.access_time), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.access_time));
      // In light theme, sending status uses onSurfaceVariant with 60% opacity
      final expectedColor = DesignColors.neutral700.withValues(alpha: 0.6);
      expect(icon.color, expectedColor);
    });

    testWidgets('renders sent status with correct icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light().copyWith(
            extensions: const [TinaTheme.light],
          ),
          home: const Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.done), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.done));
      // In light theme, sent status uses onSurfaceVariant (neutral700)
      expect(icon.color, DesignColors.neutral700);
    });

    testWidgets('renders delivered status with correct icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.delivered,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.done_all), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.done_all));
      expect(icon.color, DesignColors.info);
    });

    testWidgets('renders read status with correct icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.read,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.done_all), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.done_all));
      expect(icon.color, DesignColors.success);
    });

    testWidgets('renders error status with correct icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.error,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.error_outline), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.error_outline));
      expect(icon.color, DesignColors.error);
    });

    testWidgets('applies small size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              size: TinaMessageStatusSize.small,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.done));
      expect(icon.size, 12.0);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.done));
      expect(icon.size, 16.0);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              size: TinaMessageStatusSize.large,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.done));
      expect(icon.size, 20.0);
    });

    testWidgets('applies custom color when provided', (tester) async {
      const customColor = Colors.purple;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              color: customColor,
              showAnimation: false, // Disable animation for stable testing
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.done));
      expect(icon.color, customColor);
    });

    testWidgets('has proper semantic labels', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.sending,
                  showAnimation: false, // Disable animation for stable testing
                ),
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.sent,
                  showAnimation: false,
                ),
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.delivered,
                  showAnimation: false,
                ),
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.read,
                  showAnimation: false,
                ),
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.error,
                  showAnimation: false,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.bySemanticsLabel('Message is being sent'), findsOneWidget);
      expect(
        find.bySemanticsLabel('Message sent successfully'),
        findsOneWidget,
      );
      expect(find.bySemanticsLabel('Message delivered'), findsOneWidget);
      expect(
        find.bySemanticsLabel('Message read by recipient'),
        findsOneWidget,
      );
      expect(find.bySemanticsLabel('Message failed to send'), findsOneWidget);
    });

    testWidgets('shows animation when enabled', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
            ),
          ),
        ),
      );

      // Should find the widget with animation enabled
      final widget = tester.widget<TinaMessageStatus>(
        find.byType(TinaMessageStatus),
      );
      expect(widget.showAnimation, true);

      // Wait for animation to complete to avoid hanging
      await tester.pumpAndSettle();
    });

    testWidgets('hides animation when disabled', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              showAnimation: false,
            ),
          ),
        ),
      );

      // Should find the widget with animation disabled
      final widget = tester.widget<TinaMessageStatus>(
        find.byType(TinaMessageStatus),
      );
      expect(widget.showAnimation, false);

      // Icon should be directly visible without animation wrapper
      expect(find.byIcon(Icons.done), findsOneWidget);
    });

    testWidgets('shows rotation animation for sending status', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sending,
            ),
          ),
        ),
      );

      // Should find the widget with sending status and animation enabled
      final widget = tester.widget<TinaMessageStatus>(
        find.byType(TinaMessageStatus),
      );
      expect(widget.status, TinaMessageDeliveryStatus.sending);
      expect(widget.showAnimation, true);
      expect(find.byIcon(Icons.access_time), findsOneWidget);

      // Pump some frames to let animation run briefly
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      // Immediately clean up by disabling animation
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sending,
              showAnimation: false,
            ),
          ),
        ),
      );

      // Wait for widget update
      await tester.pump();
    });

    testWidgets('updates animation when status changes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sending,
            ),
          ),
        ),
      );

      // Initial state should be sending
      var widget = tester.widget<TinaMessageStatus>(
        find.byType(TinaMessageStatus),
      );
      expect(widget.status, TinaMessageDeliveryStatus.sending);
      expect(find.byIcon(Icons.access_time), findsOneWidget);

      // Change status to stop the repeating animation
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
            ),
          ),
        ),
      );

      // Status should have changed
      widget = tester.widget<TinaMessageStatus>(find.byType(TinaMessageStatus));
      expect(widget.status, TinaMessageDeliveryStatus.sent);
      expect(find.byIcon(Icons.done), findsOneWidget);

      // Wait for animation to complete
      await tester.pumpAndSettle();
    });

    testWidgets('applies correct padding for different sizes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.sent,
                  size: TinaMessageStatusSize.small,
                  showAnimation: false,
                ),
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.sent,
                  showAnimation: false,
                ),
                TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.sent,
                  size: TinaMessageStatusSize.large,
                  showAnimation: false,
                ),
              ],
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));

      // Check padding for each size
      expect(containers.elementAt(0).padding, const EdgeInsets.all(2));
      expect(containers.elementAt(1).padding, const EdgeInsets.all(4));
      expect(containers.elementAt(2).padding, const EdgeInsets.all(6));
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

    group('TinaMessageStatusSize enum', () {
      test('has all expected values', () {
        expect(TinaMessageStatusSize.values, hasLength(3));
        expect(
          TinaMessageStatusSize.values,
          contains(TinaMessageStatusSize.small),
        );
        expect(
          TinaMessageStatusSize.values,
          contains(TinaMessageStatusSize.medium),
        );
        expect(
          TinaMessageStatusSize.values,
          contains(TinaMessageStatusSize.large),
        );
      });
    });
  });
}
