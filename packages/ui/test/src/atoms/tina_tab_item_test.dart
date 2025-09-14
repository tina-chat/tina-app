import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_badge.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_tab_item.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaTabItem', () {
    testWidgets('renders tab item with icon and text correctly', (
      tester,
    ) async {
      const testText = 'Chat';
      const testIcon = Icons.chat;
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
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
      expect(find.byType(Column), findsOneWidget);

      await tester.tap(find.byType(TinaTabItem));
      expect(wasTapped, isTrue);
    });

    testWidgets('renders tab item with only icon correctly', (tester) async {
      const testIcon = Icons.chat;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
              onTap: () {},
              icon: testIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(TinaIcon), findsOneWidget);
      expect(find.byType(TinaText), findsNothing);
      expect(find.byType(Column), findsNothing);
    });

    testWidgets('renders tab item with only text correctly', (tester) async {
      const testText = 'Chat';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
              onTap: () {},
              text: testText,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(TinaText), findsOneWidget);
      expect(find.byType(TinaIcon), findsNothing);
      expect(find.byType(Column), findsNothing);
    });

    testWidgets('displays badge when provided', (tester) async {
      const testText = 'Messages';
      const testIcon = Icons.message;
      final testBadge = TinaBadge.count(count: 3);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
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
      expect(find.byType(TinaBadge), findsOneWidget);
    });

    testWidgets('applies active state styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
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
          of: find.byType(TinaTabItem),
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
            body: TinaTabItem(
              onTap: () {},
              icon: Icons.chat,
              text: 'Chat',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(TinaTabItem),
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

    testWidgets('applies medium font weight when active', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
              onTap: () {},
              text: 'Chat',
              isActive: true,
            ),
          ),
        ),
      );

      final tinaText = tester.widget<TinaText>(find.byType(TinaText));
      expect(tinaText.fontWeight, DesignTypography.fontWeightMedium);
    });

    testWidgets('applies regular font weight when inactive', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
              onTap: () {},
              text: 'Chat',
            ),
          ),
        ),
      );

      final tinaText = tester.widget<TinaText>(find.byType(TinaText));
      expect(tinaText.fontWeight, DesignTypography.fontWeightRegular);
    });

    testWidgets('handles null onTap correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaTabItem(
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
            body: TinaTabItem(
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
              of: find.byType(TinaTabItem),
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
            body: TinaTabItem(
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
              of: find.byType(TinaTabItem),
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
            body: TinaTabItem(
              onTap: () {},
              text: testText,
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find
            .descendant(
              of: find.byType(TinaTabItem),
              matching: find.byType(Semantics),
            )
            .first,
      );

      expect(semantics.properties.label, testText);
    });
  });
}
