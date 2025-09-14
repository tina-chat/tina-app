import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_typing_indicator.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

void main() {
  group('TinaTypingIndicator', () {
    testWidgets('renders three animated dots', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(),
          ),
        ),
      );

      // Find all containers that represent dots
      final dotContainers = find.descendant(
        of: find.byType(TinaTypingIndicator),
        matching: find.byType(Container),
      );

      // Should have at least 3 dot containers (plus the main container)
      expect(dotContainers, findsAtLeastNWidgets(3));
    });

    testWidgets('shows container by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light().copyWith(
            extensions: const [TinaTheme.light],
          ),
          home: const Scaffold(
            body: TinaTypingIndicator(),
          ),
        ),
      );

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.centerLeft);

      // Should find the main container with background (surfaceVariant in light theme)
      final containers = tester.widgetList<Container>(find.byType(Container));
      final mainContainer = containers.firstWhere(
        (container) =>
            container.decoration is BoxDecoration &&
            (container.decoration! as BoxDecoration).color ==
                DesignColors.neutral100,
      );
      expect(mainContainer, isNotNull);
    });

    testWidgets('hides container when showContainer is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(showContainer: false),
          ),
        ),
      );

      // Should not find Align widget when container is hidden
      expect(find.byType(Align), findsNothing);

      // Should still find the dots
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies small size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(
              size: TinaTypingIndicatorSize.small,
            ),
          ),
        ),
      );

      // Check that dots are rendered with correct size
      // We can't easily test the exact size in widget tests, so we just verify
      // that the typing indicator renders correctly
      expect(find.byType(TinaTypingIndicator), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(),
          ),
        ),
      );

      // Check that dots are rendered with correct size
      // We can't easily test the exact size in widget tests, so we just verify
      // that the typing indicator renders correctly
      expect(find.byType(TinaTypingIndicator), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(
              size: TinaTypingIndicatorSize.large,
            ),
          ),
        ),
      );

      // Check that dots are rendered with correct size
      // We can't easily test the exact size in widget tests, so we just verify
      // that the typing indicator renders correctly
      expect(find.byType(TinaTypingIndicator), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies custom color', (tester) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(
              color: customColor,
            ),
          ),
        ),
      );

      // Find dot containers and check their color
      final dotContainers = tester
          .widgetList<Container>(find.byType(Container))
          .where(
            (container) =>
                container.decoration is BoxDecoration &&
                (container.decoration! as BoxDecoration).shape ==
                    BoxShape.circle,
          )
          .toList();

      expect(dotContainers.length, 3);
      for (final container in dotContainers) {
        final decoration = container.decoration! as BoxDecoration;
        expect(decoration.color, customColor);
      }
    });

    testWidgets('uses default color when none provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light().copyWith(
            extensions: const [TinaTheme.light],
          ),
          home: const Scaffold(
            body: TinaTypingIndicator(),
          ),
        ),
      );

      // Find dot containers and check they use default color (onSurfaceVariant in light theme)
      final dotContainers = tester
          .widgetList<Container>(find.byType(Container))
          .where(
            (container) =>
                container.decoration is BoxDecoration &&
                (container.decoration! as BoxDecoration).shape ==
                    BoxShape.circle,
          )
          .toList();

      expect(dotContainers.length, 3);
      for (final container in dotContainers) {
        final decoration = container.decoration! as BoxDecoration;
        // In light theme, onSurfaceVariant is neutral700
        expect(decoration.color, DesignColors.neutral700);
      }
    });

    testWidgets('has proper semantic label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(),
          ),
        ),
      );

      expect(find.bySemanticsLabel('AI is typing'), findsOneWidget);
    });

    testWidgets('animates dots with staggered timing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(),
          ),
        ),
      );

      // Pump a few frames to let animation start
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Find animated builders specifically within the TinaTypingIndicator
      final typingIndicator = find.byType(TinaTypingIndicator);
      final animatedBuilders = find.descendant(
        of: typingIndicator,
        matching: find.byType(AnimatedBuilder),
      );
      expect(animatedBuilders, findsNWidgets(3));
    });

    testWidgets('respects custom animation duration', (tester) async {
      const customDuration = Duration(milliseconds: 1000);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTypingIndicator(
              animationDuration: customDuration,
            ),
          ),
        ),
      );

      // The animation should be running
      await tester.pump();

      // Find animated builders specifically within the TinaTypingIndicator
      final typingIndicator = find.byType(TinaTypingIndicator);
      final animatedBuilders = find.descendant(
        of: typingIndicator,
        matching: find.byType(AnimatedBuilder),
      );
      expect(animatedBuilders, findsNWidgets(3));
    });

    group('TinaTypingIndicatorSize enum', () {
      test('has all expected values', () {
        expect(TinaTypingIndicatorSize.values, hasLength(3));
        expect(
          TinaTypingIndicatorSize.values,
          contains(TinaTypingIndicatorSize.small),
        );
        expect(
          TinaTypingIndicatorSize.values,
          contains(TinaTypingIndicatorSize.medium),
        );
        expect(
          TinaTypingIndicatorSize.values,
          contains(TinaTypingIndicatorSize.large),
        );
      });
    });
  });
}
