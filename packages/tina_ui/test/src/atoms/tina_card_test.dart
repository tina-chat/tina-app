import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_card.dart';
import 'package:tina_ui/src/internal/tina_pressable.dart';

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

      expect(find.byType(TinaPressable), findsOneWidget);

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
