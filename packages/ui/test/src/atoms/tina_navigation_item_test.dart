import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_badge.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_navigation_item.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';

void main() {
  group('TinaNavigationItem', () {
    testWidgets('renders navigation item with icon and text correctly', (
      tester,
    ) async {
      const testText = 'Home';
      const testIcon = Icons.home;
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () => wasTapped = true,
              icon: testIcon,
              text: testText,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(TinaIcon), findsOneWidget);
      expect(find.byType(TinaText), findsOneWidget);

      await tester.tap(find.byType(TinaNavigationItem));
      expect(wasTapped, isTrue);
    });

    testWidgets('renders navigation item with only icon correctly', (
      tester,
    ) async {
      const testIcon = Icons.home;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: testIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(TinaIcon), findsOneWidget);
      expect(find.byType(TinaText), findsNothing);
    });

    testWidgets('renders navigation item with only text correctly', (
      tester,
    ) async {
      const testText = 'Home';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              text: testText,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(TinaText), findsOneWidget);
      expect(find.byType(TinaIcon), findsNothing);
    });

    testWidgets('displays badge when provided', (tester) async {
      const testText = 'Messages';
      const testIcon = Icons.message;
      final testBadge = TinaBadge.count(count: 5);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: testIcon,
              text: testText,
              badge: testBadge,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.byType(TinaBadge), findsOneWidget);
    });

    testWidgets('applies active state styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
              isActive: true,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(TinaNavigationItem),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, isNotNull);
      expect(decoration.color!.alpha, greaterThan(0));
    });

    testWidgets('applies inactive state styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(TinaNavigationItem),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, Colors.transparent);
    });

    testWidgets('applies compact size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: Icons.home,
              size: TinaNavigationItemSize.compact,
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.size, TinaIconSize.small);
    });

    testWidgets('applies normal size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.size, TinaIconSize.medium);

      // Should have Column layout for normal size with icon and text
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('applies expanded size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
              size: TinaNavigationItemSize.expanded,
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.size, TinaIconSize.medium);

      // Should have Row layout for expanded size with icon and text
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('handles null onTap correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: null,
              icon: Icons.home,
              text: 'Home',
            ),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.onTap, isNull);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Navigate to home';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find
            .descendant(
              of: find.byType(TinaNavigationItem),
              matching: find.byType(Semantics),
            )
            .first,
      );

      expect(semantics.properties.label, semanticLabel);
      expect(semantics.properties.button, isTrue);
    });

    group('TinaNavigationItemSize enum', () {
      test('has all expected values', () {
        expect(TinaNavigationItemSize.values, hasLength(3));
        expect(
          TinaNavigationItemSize.values,
          contains(TinaNavigationItemSize.compact),
        );
        expect(
          TinaNavigationItemSize.values,
          contains(TinaNavigationItemSize.normal),
        );
        expect(
          TinaNavigationItemSize.values,
          contains(TinaNavigationItemSize.expanded),
        );
      });
    });
  });
}
