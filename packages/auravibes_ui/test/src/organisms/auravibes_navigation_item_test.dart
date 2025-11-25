import 'package:auravibes_ui/src/atoms/auravibes_icon.dart';
import 'package:auravibes_ui/src/atoms/auravibes_text.dart';
import 'package:auravibes_ui/src/molecules/auravibes_badge.dart';
import 'package:auravibes_ui/src/organisms/auravibes_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuraNavigationItem', () {
    testWidgets('renders navigation item with icon and text correctly', (
      tester,
    ) async {
      const testText = 'Home';
      const testIcon = Icons.home;
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
              onTap: () => wasTapped = true,
              icon: testIcon,
              text: testText,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(AuraIcon), findsOneWidget);
      expect(find.byType(AuraText), findsOneWidget);

      await tester.tap(find.byType(AuraNavigationItem));
      expect(wasTapped, isTrue);
    });

    testWidgets('renders navigation item with only icon correctly', (
      tester,
    ) async {
      const testIcon = Icons.home;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
              onTap: () {},
              icon: testIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(AuraIcon), findsOneWidget);
      expect(find.byType(AuraText), findsNothing);
    });

    testWidgets('renders navigation item with only text correctly', (
      tester,
    ) async {
      const testText = 'Home';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
              onTap: () {},
              text: testText,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(AuraText), findsOneWidget);
      expect(find.byType(AuraIcon), findsNothing);
    });

    testWidgets('displays badge when provided', (tester) async {
      const testText = 'Messages';
      const testIcon = Icons.message;
      final testBadge = AuraBadge.count(count: 5);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
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
      expect(find.byType(AuraBadge), findsOneWidget);
    });

    testWidgets('applies active state styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
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
          of: find.byType(AuraNavigationItem),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, isNotNull);
      expect(decoration.color!.a, greaterThan(0));
    });

    testWidgets('applies inactive state styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AuraNavigationItem),
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
            body: AuraNavigationItem(
              onTap: () {},
              icon: Icons.home,
              size: AuraNavigationItemSize.compact,
            ),
          ),
        ),
      );

      final auraIcon = tester.widget<AuraIcon>(find.byType(AuraIcon));
      expect(auraIcon.size, AuraIconSize.small);
    });

    testWidgets('applies normal size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
            ),
          ),
        ),
      );

      final auraIcon = tester.widget<AuraIcon>(find.byType(AuraIcon));
      expect(auraIcon.size, AuraIconSize.medium);

      // Should have Column layout for normal size with icon and text
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('applies expanded size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
              onTap: () {},
              icon: Icons.home,
              text: 'Home',
              size: AuraNavigationItemSize.expanded,
            ),
          ),
        ),
      );

      final auraIcon = tester.widget<AuraIcon>(find.byType(AuraIcon));
      expect(auraIcon.size, AuraIconSize.medium);

      // Should have Row layout for expanded size with icon and text
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('handles null onTap correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraNavigationItem(
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
            body: AuraNavigationItem(
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
              of: find.byType(AuraNavigationItem),
              matching: find.byType(Semantics),
            )
            .first,
      );

      expect(semantics.properties.label, semanticLabel);
      expect(semantics.properties.button, isTrue);
    });

    group('AuraNavigationItemSize enum', () {
      test('has all expected values', () {
        expect(AuraNavigationItemSize.values, hasLength(3));
        expect(
          AuraNavigationItemSize.values,
          contains(AuraNavigationItemSize.compact),
        );
        expect(
          AuraNavigationItemSize.values,
          contains(AuraNavigationItemSize.normal),
        );
        expect(
          AuraNavigationItemSize.values,
          contains(AuraNavigationItemSize.expanded),
        );
      });
    });
  });
}
