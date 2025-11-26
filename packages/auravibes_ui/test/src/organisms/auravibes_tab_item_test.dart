import 'package:auravibes_ui/src/atoms/auravibes_icon.dart';
import 'package:auravibes_ui/src/atoms/auravibes_text.dart';
import 'package:auravibes_ui/src/molecules/auravibes_badge.dart';
import 'package:auravibes_ui/src/organisms/auravibes_tab_item.dart';
import 'package:auravibes_ui/src/tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuraTabItem', () {
    testWidgets('renders tab item with icon and text correctly', (
      tester,
    ) async {
      const testText = 'Chat';
      const testIcon = Icons.chat;
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
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
      expect(find.byType(Column), findsOneWidget);

      await tester.tap(find.byType(AuraTabItem));
      expect(wasTapped, isTrue);
    });

    testWidgets('renders tab item with only icon correctly', (tester) async {
      const testIcon = Icons.chat;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: () {},
              icon: testIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(AuraIcon), findsOneWidget);
      expect(find.byType(AuraText), findsNothing);
      expect(find.byType(Column), findsNothing);
    });

    testWidgets('renders tab item with only text correctly', (tester) async {
      const testText = 'Chat';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: () {},
              text: testText,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(AuraText), findsOneWidget);
      expect(find.byType(AuraIcon), findsNothing);
      expect(find.byType(Column), findsNothing);
    });

    testWidgets('displays badge when provided', (tester) async {
      const testText = 'Messages';
      const testIcon = Icons.message;
      final testBadge = AuraBadge.count(count: 3);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
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
      expect(find.text('3'), findsOneWidget);
      expect(find.byType(AuraBadge), findsOneWidget);
    });

    testWidgets('applies active state styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: () {},
              icon: Icons.chat,
              text: 'Chat',
              isActive: true,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AuraTabItem),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border, isA<Border>());

      final border = decoration.border! as Border;
      expect(border.bottom.width, 2.0);
      expect(border.bottom.color, DesignColors.primaryBase);
    });

    testWidgets('applies inactive state styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: () {},
              icon: Icons.chat,
              text: 'Chat',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AuraTabItem),
          matching: find.byType(Container),
        ),
      );

      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border, isA<Border>());

      final border = decoration.border! as Border;
      expect(border.bottom.width, 0.0);
      expect(border.bottom.color, Colors.transparent);
    });

    testWidgets('handles null onTap correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: null,
              icon: Icons.chat,
              text: 'Chat',
            ),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.onTap, isNull);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Chat tab';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: () {},
              icon: Icons.chat,
              text: 'Chat',
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find
            .descendant(
              of: find.byType(AuraTabItem),
              matching: find.byType(Semantics),
            )
            .first,
      );

      expect(semantics.properties.label, semanticLabel);
      expect(semantics.properties.button, isTrue);
      expect(semantics.properties.selected, isFalse);
    });

    testWidgets('applies selected semantic property when active', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: () {},
              icon: Icons.chat,
              text: 'Chat',
              isActive: true,
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find
            .descendant(
              of: find.byType(AuraTabItem),
              matching: find.byType(Semantics),
            )
            .first,
      );

      expect(semantics.properties.selected, isTrue);
    });

    testWidgets('uses text as semantic label when no explicit label provided', (
      tester,
    ) async {
      const testText = 'Chat';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuraTabItem(
              onTap: () {},
              text: testText,
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find
            .descendant(
              of: find.byType(AuraTabItem),
              matching: find.byType(Semantics),
            )
            .first,
      );

      expect(semantics.properties.label, testText);
    });
  });
}
