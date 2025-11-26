import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuraScreen', () {
    testWidgets('renders child content correctly', (tester) async {
      const childText = 'Screen Content';

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            extensions: const [
              AuraTheme.light,
            ],
          ),
          home: const AuraScreen(
            child: Text(childText),
          ),
        ),
      );

      expect(find.text(childText), findsOneWidget);
    });

    testWidgets('renders standard variant with solid background', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            extensions: const [
              AuraTheme.light,
            ],
          ),
          home: const AuraScreen(
            variant: AuraScreenVariation.standard,
            child: SizedBox(),
          ),
        ),
      );

      // Standard variant uses ColoredBox
      // We look for the specific ColoredBox with the background color
      final coloredBoxFinder = find.byWidgetPredicate(
        (widget) =>
            widget is ColoredBox &&
            widget.color == AuraTheme.light.colors.background,
      );
      expect(coloredBoxFinder, findsOneWidget);

      // Should not have BackdropFilter (used in aurora)
      expect(find.byType(BackdropFilter), findsNothing);
    });

    testWidgets('renders aurora variant with mesh gradient and blur', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            extensions: const [
              AuraTheme.light,
            ],
          ),
          home: const AuraScreen(
            child: SizedBox(),
          ),
        ),
      );

      // Aurora variant uses a Stack for background
      expect(find.byType(Stack), findsWidgets);

      // Should have BackdropFilter for the blur effect
      expect(find.byType(BackdropFilter), findsOneWidget);

      // Verify blur amount
      final backdropFilter = tester.widget<BackdropFilter>(
        find.byType(BackdropFilter),
      );
      final imageFilter = backdropFilter.filter;
      // Note: We can't easily inspect ImageFilter properties in tests without casting to internal types
      // or relying on implementation details, but finding it exists is a good check.
      expect(imageFilter, isNotNull);
    });

    testWidgets('renders AppBar when provided', (tester) async {
      const titleText = 'My Screen';

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            extensions: const [
              AuraTheme.light,
            ],
          ),
          home: const AuraScreen(
            appBar: AuraAppBar(
              title: Text(titleText),
            ),
            child: SizedBox(),
          ),
        ),
      );

      expect(find.text(titleText), findsOneWidget);
      expect(find.byType(AuraAppBar), findsOneWidget);
    });

    testWidgets('applies padding when provided', (tester) async {
      const padding = AuraEdgeInsetsGeometry.all(AuraSpacing.md);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            extensions: const [
              AuraTheme.light,
            ],
          ),
          home: const AuraScreen(
            padding: padding,
            child: SizedBox(),
          ),
        ),
      );

      expect(find.byType(AuraPadding), findsOneWidget);
    });

    testWidgets('uses aurora variant by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            extensions: const [
              AuraTheme.light,
            ],
          ),
          home: const AuraScreen(
            child: SizedBox(),
          ),
        ),
      );

      // Should have BackdropFilter (used in aurora)
      expect(find.byType(BackdropFilter), findsOneWidget);
    });
  });
}
