import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/atoms/tina_badge.dart';
import 'package:ui/src/atoms/tina_text.dart';
import 'package:ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaBadge', () {
    testWidgets('renders badge with custom child correctly', (tester) async {
      const childText = 'Custom';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              child: Text(childText),
            ),
          ),
        ),
      );

      expect(find.text(childText), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('applies primary variant styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              variant: TinaBadgeVariant.primary,
              child: Text('Primary'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.primaryBase);
    });

    testWidgets('applies secondary variant styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              variant: TinaBadgeVariant.secondary,
              child: Text('Secondary'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.secondaryBase);
    });

    testWidgets('applies success variant styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              variant: TinaBadgeVariant.success,
              child: Text('Success'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.success);
    });

    testWidgets('applies warning variant styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              variant: TinaBadgeVariant.warning,
              child: Text('Warning'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.warning);
    });

    testWidgets('applies error variant styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              variant: TinaBadgeVariant.error,
              child: Text('Error'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.error);
    });

    testWidgets('applies outlined variant styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              variant: TinaBadgeVariant.outlined,
              child: Text('Outlined'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.transparent);
      expect(decoration.border, isNotNull);
    });

    testWidgets('applies soft variant styling correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              variant: TinaBadgeVariant.soft,
              child: Text('Soft'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, DesignColors.primaryBase.withOpacity(0.1));
    });

    testWidgets('applies small size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              size: TinaBadgeSize.small,
              child: Text('Small'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, const EdgeInsets.symmetric(
        horizontal: DesignSpacing.xs,
        vertical: 2.0,
      ));
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              size: TinaBadgeSize.medium,
              child: Text('Medium'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, const EdgeInsets.symmetric(
        horizontal: DesignSpacing.sm,
        vertical: DesignSpacing.xs,
      ));
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Status badge';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaBadge(
              semanticLabel: semanticLabel,
              child: Text('Status'),
            ),
          ),
        ),
      );

      final semanticsWidgets = find.byType(Semantics);
      final targetSemantics = semanticsWidgets.evaluate().firstWhere(
        (element) => (element.widget as Semantics).properties.label == semanticLabel,
        orElse: () => throw StateError('No Semantics widget found with label: $semanticLabel'),
      );
      expect(targetSemantics, isNotNull);
    });

    group('TinaBadge.text constructor', () {
      testWidgets('renders text badge correctly', (tester) async {
        const badgeText = 'New';
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaBadge.text(
                text: badgeText,
              ),
            ),
          ),
        );

        expect(find.text(badgeText), findsOneWidget);
        expect(find.byType(TinaText), findsOneWidget);
      });
    });

    group('TinaBadge.count constructor', () {
      testWidgets('renders count badge correctly', (tester) async {
        const count = 5;
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaBadge.count(
                count: count,
              ),
            ),
          ),
        );

        expect(find.text(count.toString()), findsOneWidget);
        expect(find.byType(TinaText), findsOneWidget);
      });

      testWidgets('shows max count with plus when exceeding maxCount', (tester) async {
        const count = 150;
        const maxCount = 99;
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaBadge.count(
                count: count,
                maxCount: maxCount,
              ),
            ),
          ),
        );

        expect(find.text('$maxCount+'), findsOneWidget);
      });

      testWidgets('applies default semantic label for count', (tester) async {
        const count = 3;
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaBadge.count(
                count: count,
              ),
            ),
          ),
        );

        final semanticsWidgets = find.byType(Semantics);
        final targetSemantics = semanticsWidgets.evaluate().firstWhere(
          (element) => (element.widget as Semantics).properties.label == '$count notifications',
          orElse: () => throw StateError('No Semantics widget found with label: $count notifications'),
        );
        expect(targetSemantics, isNotNull);
      });
    });

    group('TinaBadge.dot constructor', () {
      testWidgets('renders dot badge correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaBadge.dot(),
            ),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
        expect(sizedBox.width, 6);
        expect(sizedBox.height, 6);
      });

      testWidgets('applies default semantic label for dot', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaBadge.dot(),
            ),
          ),
        );

        expect(find.bySemanticsLabel('notification indicator'), findsOneWidget);
      });
    });

    group('TinaBadgeVariant enum', () {
      test('has all expected values', () {
        expect(TinaBadgeVariant.values, hasLength(9));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.primary));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.secondary));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.success));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.warning));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.error));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.info));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.neutral));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.outlined));
        expect(TinaBadgeVariant.values, contains(TinaBadgeVariant.soft));
      });
    });

    group('TinaBadgeSize enum', () {
      test('has all expected values', () {
        expect(TinaBadgeSize.values, hasLength(3));
        expect(TinaBadgeSize.values, contains(TinaBadgeSize.small));
        expect(TinaBadgeSize.values, contains(TinaBadgeSize.medium));
        expect(TinaBadgeSize.values, contains(TinaBadgeSize.large));
      });
    });
  });

  group('TinaPositionedBadge', () {
    testWidgets('renders positioned badge correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaPositionedBadge(
              badge: TinaBadge.dot(),
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.descendant(
        of: find.byType(TinaPositionedBadge),
        matching: find.byType(Stack),
      ), findsOneWidget);
      expect(find.byType(Positioned), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byType(TinaBadge), findsOneWidget);
    });

    testWidgets('positions badge at top-right by default', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaPositionedBadge(
              badge: TinaBadge.dot(),
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      final positioned = tester.widget<Positioned>(find.byType(Positioned));
      expect(positioned.top, -8.0);
      expect(positioned.right, -8.0);
      expect(positioned.bottom, isNull);
      expect(positioned.left, isNull);
    });

    testWidgets('positions badge at top-left correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaPositionedBadge(
              badge: TinaBadge.dot(),
              position: TinaBadgePosition.topLeft,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      final positioned = tester.widget<Positioned>(find.byType(Positioned));
      expect(positioned.top, -8.0);
      expect(positioned.left, -8.0);
      expect(positioned.bottom, isNull);
      expect(positioned.right, isNull);
    });

    testWidgets('positions badge at bottom-right correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaPositionedBadge(
              badge: TinaBadge.dot(),
              position: TinaBadgePosition.bottomRight,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      final positioned = tester.widget<Positioned>(find.byType(Positioned));
      expect(positioned.bottom, -8.0);
      expect(positioned.right, -8.0);
      expect(positioned.top, isNull);
      expect(positioned.left, isNull);
    });

    testWidgets('positions badge at bottom-left correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaPositionedBadge(
              badge: TinaBadge.dot(),
              position: TinaBadgePosition.bottomLeft,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      final positioned = tester.widget<Positioned>(find.byType(Positioned));
      expect(positioned.bottom, -8.0);
      expect(positioned.left, -8.0);
      expect(positioned.top, isNull);
      expect(positioned.right, isNull);
    });

    testWidgets('applies custom offset correctly', (tester) async {
      const customOffset = Offset(5.0, 10.0);
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaPositionedBadge(
              badge: TinaBadge.dot(),
              offset: customOffset,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      final positioned = tester.widget<Positioned>(find.byType(Positioned));
      expect(positioned.top, -8.0 + customOffset.dy);
      expect(positioned.right, -8.0 + customOffset.dx);
    });

    group('TinaBadgePosition enum', () {
      test('has all expected values', () {
        expect(TinaBadgePosition.values, hasLength(4));
        expect(TinaBadgePosition.values, contains(TinaBadgePosition.topLeft));
        expect(TinaBadgePosition.values, contains(TinaBadgePosition.topRight));
        expect(TinaBadgePosition.values, contains(TinaBadgePosition.bottomLeft));
        expect(TinaBadgePosition.values, contains(TinaBadgePosition.bottomRight));
      });
    });
  });
}