import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_floating_action_button.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaFloatingActionButton', () {
    testWidgets('renders regular FAB correctly', (tester) async {
      const testIcon = Icons.add;
      var wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () => wasPressed = true,
              icon: testIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(TinaIcon), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      expect(wasPressed, isTrue);
    });

    testWidgets('renders extended FAB correctly', (tester) async {
      const testIcon = Icons.add;
      const testText = 'Add Item';
      var wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton.extended(
              onPressed: () => wasPressed = true,
              icon: testIcon,
              text: testText,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.text(testText), findsOneWidget);
      expect(find.byType(TinaIcon), findsOneWidget);
      expect(find.byType(TinaText), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      expect(wasPressed, isTrue);
    });

    testWidgets('applies mini size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
              size: TinaFABSize.mini,
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(FloatingActionButton),
          matching: find.byType(SizedBox),
        ),
      );

      expect(sizedBox.width, 40.0);
      expect(sizedBox.height, 40.0);

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.size, TinaIconSize.small);
    });

    testWidgets('applies regular size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.size, TinaIconSize.medium);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
              size: TinaFABSize.large,
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(FloatingActionButton),
          matching: find.byType(SizedBox),
        ),
      );

      expect(sizedBox.width, 72.0);
      expect(sizedBox.height, 72.0);

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.size, TinaIconSize.large);
    });

    testWidgets('applies custom background color correctly', (tester) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
              backgroundColor: customColor,
            ),
          ),
        ),
      );

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.backgroundColor, customColor);
    });

    testWidgets('applies custom foreground color correctly', (tester) async {
      const customColor = Colors.black;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
              foregroundColor: customColor,
            ),
          ),
        ),
      );

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.foregroundColor, customColor);

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.color, customColor);
    });

    testWidgets('applies default colors correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
        ),
      );

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.backgroundColor, DesignColors.primaryBase);
      expect(fab.foregroundColor, DesignColors.primaryContrast);

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.color, DesignColors.primaryContrast);
    });

    testWidgets('handles null onPressed correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: null,
              icon: Icons.add,
            ),
          ),
        ),
      );

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.onPressed, isNull);
    });

    testWidgets('applies tooltip correctly', (tester) async {
      const tooltipMessage = 'Add new item';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
              tooltip: tooltipMessage,
            ),
          ),
        ),
      );

      expect(find.byType(Tooltip), findsOneWidget);

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
      expect(tooltip.message, tooltipMessage);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Add new item';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      final semanticsWidgets = tester.widgetList<Semantics>(
        find.descendant(
          of: find.byType(TinaFloatingActionButton),
          matching: find.byType(Semantics),
        ),
      );

      // Find the Semantics widget with the correct label
      final semantics = semanticsWidgets.firstWhere(
        (s) => s.properties.label == semanticLabel,
      );

      expect(semantics.properties.label, semanticLabel);
      expect(semantics.properties.button, isTrue);
    });

    testWidgets('applies proper elevation values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaFloatingActionButton(
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
        ),
      );

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.elevation, DesignElevation.md);
      expect(fab.focusElevation, DesignElevation.lg);
      expect(fab.hoverElevation, DesignElevation.lg);
      expect(fab.highlightElevation, DesignElevation.xl);
    });

    group('TinaFABSize enum', () {
      test('has all expected values', () {
        expect(TinaFABSize.values, hasLength(4));
        expect(TinaFABSize.values, contains(TinaFABSize.mini));
        expect(TinaFABSize.values, contains(TinaFABSize.regular));
        expect(TinaFABSize.values, contains(TinaFABSize.large));
        expect(TinaFABSize.values, contains(TinaFABSize.extended));
      });
    });
  });
}
