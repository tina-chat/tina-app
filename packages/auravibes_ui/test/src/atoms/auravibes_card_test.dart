import 'package:auravibes_ui/src/atoms/auravibes_card.dart';
import 'package:auravibes_ui/src/internal/auravibes_pressable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuraCard', () {
    testWidgets('renders card with child correctly', (tester) async {
      const testText = 'Card Content';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraCard(
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
            body: AuraCard(
              onTap: () => wasTapped = true,
              child: const Text('Tappable Card'),
            ),
          ),
        ),
      );

      expect(find.byType(AuraPressable), findsOneWidget);

      await tester.tap(find.byType(AuraCard));
      expect(wasTapped, isTrue);
    });

    testWidgets('does not show InkWell when onTap is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraCard(
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
            body: AuraCard(
              semanticLabel: semanticLabel,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find.descendant(
          of: find.byType(AuraCard),
          matching: find.byType(Semantics),
        ),
      );

      expect(semantics.properties.label, semanticLabel);
    });

    group('AuraCardPadding enum', () {
      test('has all expected values', () {
        expect(AuraCardPadding.values, hasLength(4));
        expect(AuraCardPadding.values, contains(AuraCardPadding.none));
        expect(AuraCardPadding.values, contains(AuraCardPadding.small));
        expect(AuraCardPadding.values, contains(AuraCardPadding.medium));
        expect(AuraCardPadding.values, contains(AuraCardPadding.large));
      });
    });
  });
}
