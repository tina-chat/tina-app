import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/atoms/tina_card.dart';
import 'package:ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaCard', () {
    testWidgets('renders card with child correctly', (tester) async {
      const testText = 'Card Content';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              child: Text(testText),
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('applies default styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.decoration, isA<BoxDecoration>());
      
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(DesignBorderRadius.lg));
      expect(decoration.boxShadow, isNotEmpty);
      expect(decoration.boxShadow!.first, DesignShadows.sm);
    });

    testWidgets('applies medium padding by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, const EdgeInsets.all(DesignSpacing.md));
    });

    testWidgets('applies no padding variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard.noPadding(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, EdgeInsets.zero);
    });

    testWidgets('applies compact padding variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard.compact(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, const EdgeInsets.all(DesignSpacing.sm));
    });

    testWidgets('applies spacious padding variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard.spacious(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, const EdgeInsets.all(DesignSpacing.lg));
    });

    testWidgets('applies no elevation correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              elevation: TinaCardElevation.none,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, isEmpty);
    });

    testWidgets('applies small elevation correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              elevation: TinaCardElevation.sm,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.sm]);
    });

    testWidgets('applies medium elevation correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              elevation: TinaCardElevation.md,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.md]);
    });

    testWidgets('applies large elevation correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              elevation: TinaCardElevation.lg,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.lg]);
    });

    testWidgets('applies extra large elevation correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              elevation: TinaCardElevation.xl,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.xl]);
    });

    testWidgets('applies custom background color correctly', (tester) async {
      const customColor = Colors.red;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              backgroundColor: customColor,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, customColor);
    });

    testWidgets('applies default background color in light theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.neutral50);
    });

    testWidgets('applies default background color in dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.neutral800);
    });

    testWidgets('applies border color correctly', (tester) async {
      const borderColor = Colors.blue;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              borderColor: borderColor,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isA<Border>());
      
      final border = decoration.border as Border;
      expect(border.top.color, borderColor);
      expect(border.top.width, DesignBorderWidth.thin);
    });

    testWidgets('handles tap correctly', (tester) async {
      bool wasTapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              onTap: () => wasTapped = true,
              child: Text('Tappable Card'),
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
      
      await tester.tap(find.byType(TinaCard));
      expect(wasTapped, isTrue);
    });

    testWidgets('does not show InkWell when onTap is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              child: Text('Non-tappable Card'),
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsNothing);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Product card';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              semanticLabel: semanticLabel,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find.descendant(
          of: find.byType(TinaCard),
          matching: find.byType(Semantics),
        ),
      );

      expect(semantics.properties.label, semanticLabel);
    });

    group('TinaCardElevation enum', () {
      test('has all expected values', () {
        expect(TinaCardElevation.values, hasLength(5));
        expect(TinaCardElevation.values, contains(TinaCardElevation.none));
        expect(TinaCardElevation.values, contains(TinaCardElevation.sm));
        expect(TinaCardElevation.values, contains(TinaCardElevation.md));
        expect(TinaCardElevation.values, contains(TinaCardElevation.lg));
        expect(TinaCardElevation.values, contains(TinaCardElevation.xl));
      });
    });

    group('TinaCardPadding enum', () {
      test('has all expected values', () {
        expect(TinaCardPadding.values, hasLength(4));
        expect(TinaCardPadding.values, contains(TinaCardPadding.none));
        expect(TinaCardPadding.values, contains(TinaCardPadding.small));
        expect(TinaCardPadding.values, contains(TinaCardPadding.medium));
        expect(TinaCardPadding.values, contains(TinaCardPadding.large));
      });
    });
  });
}