import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_card.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

void main() {
  group('TinaCard', () {
    testWidgets('renders card with child correctly', (tester) async {
      const testText = 'Card Content';

      await tester.pumpWidget(
        const MaterialApp(
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
        const MaterialApp(
          home: Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.decoration, isA<BoxDecoration>());

      final decoration = container.decoration! as BoxDecoration;
      expect(
        decoration.borderRadius,
        BorderRadius.circular(DesignBorderRadius.lg),
      );
      expect(decoration.boxShadow, isNotEmpty);
      expect(decoration.boxShadow!.first, DesignShadows.sm);
    });

    testWidgets('applies medium padding by default', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
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
        const MaterialApp(
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
        const MaterialApp(
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
        const MaterialApp(
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
        const MaterialApp(
          home: Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, isEmpty);
    });

    testWidgets('applies default background color in light theme', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.neutral50);
    });

    testWidgets('applies default background color in dark theme', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark().copyWith(
            extensions: const [TinaTheme.dark],
          ),
          home: const Scaffold(
            body: TinaCard(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      // In dark theme, surface color should be neutral800
      expect(decoration.color, DesignColors.neutral800);
    });

    testWidgets('handles tap correctly', (tester) async {
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaCard(
              onTap: () => wasTapped = true,
              child: const Text('Tappable Card'),
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
        const MaterialApp(
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
        const MaterialApp(
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
