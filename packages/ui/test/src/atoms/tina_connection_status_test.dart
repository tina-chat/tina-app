import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_connection_status.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaConnectionStatus', () {
    testWidgets('renders online status correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(TinaConnectionStatus),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.success);
    });

    testWidgets('renders offline status correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.offline,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(TinaConnectionStatus),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.error);
    });

    testWidgets('renders connecting status with animation', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.connecting,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(TinaConnectionStatus),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.warning);

      // Should have AnimatedBuilder for pulsing animation
      // Find AnimatedBuilder specifically within TinaConnectionStatus
      final connectionStatusFinder = find.byType(TinaConnectionStatus);
      final animatedBuilderInStatus = find.descendant(
        of: connectionStatusFinder,
        matching: find.byType(AnimatedBuilder),
      );
      expect(animatedBuilderInStatus, findsOneWidget);
    });

    testWidgets('shows label when showLabel is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
              showLabel: true,
            ),
          ),
        ),
      );

      expect(find.text('Online'), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('hides label when showLabel is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
            ),
          ),
        ),
      );

      expect(find.text('Online'), findsNothing);
      expect(
        find.byType(Row),
        findsOneWidget,
      ); // Row still exists but only has indicator
    });

    testWidgets('uses custom label when provided', (tester) async {
      const customLabel = 'Custom Status';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
              showLabel: true,
              customLabel: customLabel,
            ),
          ),
        ),
      );

      expect(find.text(customLabel), findsOneWidget);
      expect(find.text('Online'), findsNothing);
    });

    testWidgets('applies small size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
              size: TinaConnectionStatusSize.small,
            ),
          ),
        ),
      );

      // Check that the component renders correctly with small size
      expect(find.byType(TinaConnectionStatus), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
            ),
          ),
        ),
      );

      // Check that the component renders correctly with medium size
      expect(find.byType(TinaConnectionStatus), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
              size: TinaConnectionStatusSize.large,
            ),
          ),
        ),
      );

      // Check that the component renders correctly with large size
      expect(find.byType(TinaConnectionStatus), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('has proper semantic labels', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TinaConnectionStatus(status: TinaConnectionState.online),
                TinaConnectionStatus(status: TinaConnectionState.offline),
                TinaConnectionStatus(status: TinaConnectionState.connecting),
              ],
            ),
          ),
        ),
      );

      expect(
        find.bySemanticsLabel('Connection status: Online'),
        findsOneWidget,
      );
      expect(
        find.bySemanticsLabel('Connection status: Offline'),
        findsOneWidget,
      );
      expect(
        find.bySemanticsLabel('Connection status: Connecting'),
        findsOneWidget,
      );
    });

    testWidgets('updates animation when status changes', (tester) async {
      const widget = MaterialApp(
        home: Scaffold(
          body: TinaConnectionStatus(
            status: TinaConnectionState.online,
          ),
        ),
      );

      await tester.pumpWidget(widget);

      // Initially no animation for online status (look within TinaConnectionStatus only)
      final connectionStatusFinder = find.byType(TinaConnectionStatus);
      final animatedBuilderInStatus = find.descendant(
        of: connectionStatusFinder,
        matching: find.byType(AnimatedBuilder),
      );
      expect(animatedBuilderInStatus, findsNothing);

      // Change to connecting status
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.connecting,
            ),
          ),
        ),
      );

      // Should now have animation (look within TinaConnectionStatus only)
      final connectionStatusFinder2 = find.byType(TinaConnectionStatus);
      final animatedBuilderInStatus2 = find.descendant(
        of: connectionStatusFinder2,
        matching: find.byType(AnimatedBuilder),
      );
      expect(animatedBuilderInStatus2, findsOneWidget);
    });

    testWidgets('label color matches status color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaConnectionStatus(
              status: TinaConnectionState.online,
              showLabel: true,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Online'));
      expect(text.style?.color, DesignColors.success);
    });

    group('TinaConnectionState enum', () {
      test('has all expected values', () {
        expect(TinaConnectionState.values, hasLength(3));
        expect(
          TinaConnectionState.values,
          contains(TinaConnectionState.online),
        );
        expect(
          TinaConnectionState.values,
          contains(TinaConnectionState.offline),
        );
        expect(
          TinaConnectionState.values,
          contains(TinaConnectionState.connecting),
        );
      });
    });

    group('TinaConnectionStatusSize enum', () {
      test('has all expected values', () {
        expect(TinaConnectionStatusSize.values, hasLength(3));
        expect(
          TinaConnectionStatusSize.values,
          contains(TinaConnectionStatusSize.small),
        );
        expect(
          TinaConnectionStatusSize.values,
          contains(TinaConnectionStatusSize.medium),
        );
        expect(
          TinaConnectionStatusSize.values,
          contains(TinaConnectionStatusSize.large),
        );
      });
    });

    group('default labels', () {
      testWidgets('shows correct default labels for each status', (
        tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  TinaConnectionStatus(
                    status: TinaConnectionState.online,
                    showLabel: true,
                  ),
                  TinaConnectionStatus(
                    status: TinaConnectionState.offline,
                    showLabel: true,
                  ),
                  TinaConnectionStatus(
                    status: TinaConnectionState.connecting,
                    showLabel: true,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Online'), findsOneWidget);
        expect(find.text('Offline'), findsOneWidget);
        expect(find.text('Connecting...'), findsOneWidget);
      });
    });
  });
}
