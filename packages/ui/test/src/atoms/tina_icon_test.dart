import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/atoms/tina_icon.dart';
import 'package:ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaIcon', () {
    testWidgets('renders icon correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaIcon(Icons.star),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('applies custom color correctly', (tester) async {
      const customColor = Colors.red;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaIcon(
              Icons.star,
              color: customColor,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.star));
      expect(iconWidget.color, customColor);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaIcon(
              Icons.star,
              size: TinaIconSize.medium,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.star));
      expect(iconWidget.size, 20.0);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaIcon(
              Icons.star,
              size: TinaIconSize.large,
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.star));
      expect(iconWidget.size, 24.0);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Favorite star';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaIcon(
              Icons.star,
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      expect(find.bySemanticsLabel(semanticLabel), findsOneWidget);
    });

    group('TinaIconSize enum', () {
      test('has all expected values', () {
        expect(TinaIconSize.values, hasLength(6));
        expect(TinaIconSize.values, contains(TinaIconSize.extraSmall));
        expect(TinaIconSize.values, contains(TinaIconSize.small));
        expect(TinaIconSize.values, contains(TinaIconSize.medium));
        expect(TinaIconSize.values, contains(TinaIconSize.large));
        expect(TinaIconSize.values, contains(TinaIconSize.extraLarge));
        expect(TinaIconSize.values, contains(TinaIconSize.huge));
      });
    });
  });

  group('TinaIconButton', () {
    testWidgets('renders icon button correctly', (tester) async {
      bool wasPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      
      await tester.tap(find.byType(TinaIconButton));
      expect(wasPressed, isTrue);
    });

    testWidgets('applies ghost variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              variant: TinaIconButtonVariant.ghost,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.style?.backgroundColor?.resolve({}), Colors.transparent);
    });

    testWidgets('applies filled variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              variant: TinaIconButtonVariant.filled,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.style?.backgroundColor?.resolve({}), 
             DesignColors.primaryBase);
    });

    testWidgets('applies outlined variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              variant: TinaIconButtonVariant.outlined,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.style?.backgroundColor?.resolve({}), Colors.transparent);
    });

    testWidgets('applies elevated variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              variant: TinaIconButtonVariant.elevated,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.style?.backgroundColor?.resolve({}), 
             DesignColors.primaryBase);
      expect(iconButton.style?.elevation?.resolve({}), 2);
    });

    testWidgets('applies custom color correctly', (tester) async {
      const customColor = Colors.red;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              color: customColor,
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.color, customColor);
    });

    testWidgets('applies custom background color correctly', (tester) async {
      const customBackgroundColor = Colors.blue;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              backgroundColor: customBackgroundColor,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.style?.backgroundColor?.resolve({}), 
             customBackgroundColor);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      const tooltipMessage = 'Star button';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              tooltip: tooltipMessage,
            ),
          ),
        ),
      );

      expect(find.byType(Tooltip), findsOneWidget);
      
      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
      expect(tooltip.message, tooltipMessage);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Favorite button';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: () {},
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.semanticLabel, semanticLabel);
    });

    testWidgets('disables button when onPressed is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaIconButton(
              icon: Icons.star,
              onPressed: null,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.onPressed, isNull);
    });

    group('TinaIconButtonVariant enum', () {
      test('has all expected values', () {
        expect(TinaIconButtonVariant.values, hasLength(4));
        expect(TinaIconButtonVariant.values, contains(TinaIconButtonVariant.ghost));
        expect(TinaIconButtonVariant.values, contains(TinaIconButtonVariant.filled));
        expect(TinaIconButtonVariant.values, contains(TinaIconButtonVariant.outlined));
        expect(TinaIconButtonVariant.values, contains(TinaIconButtonVariant.elevated));
      });
    });
  });
}