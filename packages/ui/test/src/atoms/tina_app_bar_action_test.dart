import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/atoms/tina_app_bar_action.dart';
import 'package:ui/src/atoms/tina_badge.dart';
import 'package:ui/src/atoms/tina_icon.dart';
import 'package:ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaAppBarAction', () {
    testWidgets('renders app bar action button correctly', (tester) async {
      const testIcon = Icons.notifications;
      bool wasPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.byType(TinaIcon), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      
      await tester.tap(find.byType(IconButton));
      expect(wasPressed, isTrue);
    });

    testWidgets('displays badge when provided', (tester) async {
      const testIcon = Icons.notifications;
      final testBadge = TinaBadge.count(count: 7);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
              badge: testBadge,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.text('7'), findsOneWidget);
      expect(find.byType(TinaBadge), findsOneWidget);
    });

    testWidgets('applies custom color correctly', (tester) async {
      const testIcon = Icons.notifications;
      const customColor = Colors.red;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
              color: customColor,
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.color, customColor);

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.style?.foregroundColor?.resolve({}), customColor);
    });

    testWidgets('applies default color in light theme', (tester) async {
      const testIcon = Icons.notifications;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.color, DesignColors.neutral700);
    });

    testWidgets('applies default color in dark theme', (tester) async {
      const testIcon = Icons.notifications;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.color, DesignColors.neutral100);
    });

    testWidgets('uses app bar theme foreground color when available', (tester) async {
      const testIcon = Icons.notifications;
      const appBarForegroundColor = Colors.purple;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              foregroundColor: appBarForegroundColor,
            ),
          ),
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.color, appBarForegroundColor);
    });

    testWidgets('handles null onPressed correctly', (tester) async {
      const testIcon = Icons.notifications;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: null,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.onPressed, isNull);
    });

    testWidgets('applies tooltip correctly', (tester) async {
      const testIcon = Icons.notifications;
      const tooltipMessage = 'Notifications';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
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
      const testIcon = Icons.notifications;
      const semanticLabel = 'View notifications';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.semanticLabel, semanticLabel);
    });

    testWidgets('applies proper button constraints and padding', (tester) async {
      const testIcon = Icons.notifications;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.iconSize, 24.0);
      expect(iconButton.padding, const EdgeInsets.all(DesignSpacing.sm));
      expect(iconButton.constraints, const BoxConstraints(
        minWidth: 48.0,
        minHeight: 48.0,
      ));
    });

    testWidgets('applies proper icon size', (tester) async {
      const testIcon = Icons.notifications;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
            ),
          ),
        ),
      );

      final tinaIcon = tester.widget<TinaIcon>(find.byType(TinaIcon));
      expect(tinaIcon.size, TinaIconSize.medium);
    });

    testWidgets('applies transparent background', (tester) async {
      const testIcon = Icons.notifications;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAppBarAction(
              icon: testIcon,
              onPressed: () {},
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.style?.backgroundColor?.resolve({}), Colors.transparent);
    });
  });
}