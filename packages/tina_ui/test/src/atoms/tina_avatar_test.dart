import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_avatar.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';

void main() {
  group('TinaAvatar', () {
    group('TinaAvatar.initials', () {
      testWidgets('renders initials correctly', (tester) async {
        const initials = 'JD';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.initials(
                initials: initials,
              ),
            ),
          ),
        );

        expect(find.text(initials.toUpperCase()), findsOneWidget);
        expect(find.byType(TinaText), findsOneWidget);
      });

      testWidgets('applies medium size correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.initials(
                initials: 'JD',
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.constraints?.maxWidth, 40.0);
        expect(container.constraints?.maxHeight, 40.0);
      });

      testWidgets('applies large size correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.initials(
                initials: 'JD',
                size: TinaAvatarSize.large,
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.constraints?.maxWidth, 48.0);
        expect(container.constraints?.maxHeight, 48.0);
      });

      testWidgets('applies custom background color correctly', (tester) async {
        const customColor = Colors.red;

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.initials(
                initials: 'JD',
                backgroundColor: customColor,
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration! as BoxDecoration;
        expect(decoration.color, customColor);
      });

      testWidgets('applies semantic label correctly', (tester) async {
        const semanticLabel = 'User avatar';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.initials(
                initials: 'JD',
                semanticLabel: semanticLabel,
              ),
            ),
          ),
        );

        // Check that the semantic label is applied correctly
        final semanticsWidgets = find.byType(Semantics);
        expect(semanticsWidgets, findsWidgets);

        // Find the TinaAvatar widget and verify it has the semantic label
        final avatarWidget = tester.widget<TinaAvatar>(find.byType(TinaAvatar));
        expect(avatarWidget.semanticLabel, equals(semanticLabel));
      });

      testWidgets('handles tap correctly', (tester) async {
        var wasTapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TinaAvatar.initials(
                initials: 'JD',
                onTap: () => wasTapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(TinaAvatar));
        expect(wasTapped, isTrue);
      });
    });

    group('TinaAvatar.icon', () {
      testWidgets('renders icon correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.icon(
                icon: Icons.person,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.person), findsOneWidget);
      });

      testWidgets('applies correct icon size for medium avatar', (
        tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.icon(
                icon: Icons.person,
              ),
            ),
          ),
        );

        final iconWidget = tester.widget<Icon>(find.byIcon(Icons.person));
        expect(iconWidget.size, 20.0);
      });
    });

    group('TinaAvatar.image', () {
      testWidgets('renders image correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.image(
                imageProvider: AssetImage('assets/test_image.png'),
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });

      testWidgets('shows fallback text when image fails to load', (
        tester,
      ) async {
        const fallbackText = 'FB';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.image(
                imageProvider: AssetImage('assets/nonexistent.png'),
                fallbackText: fallbackText,
              ),
            ),
          ),
        );

        // Trigger image error
        await tester.pump();

        expect(find.text(fallbackText.toUpperCase()), findsOneWidget);
      });

      testWidgets('shows fallback icon when image fails to load', (
        tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaAvatar.image(
                imageProvider: AssetImage('assets/nonexistent.png'),
                fallbackIcon: Icons.error,
              ),
            ),
          ),
        );

        // Trigger image error
        await tester.pump();

        expect(find.byIcon(Icons.error), findsOneWidget);
      });
    });

    group('TinaAvatarSize enum', () {
      test('has all expected values', () {
        expect(TinaAvatarSize.values, hasLength(6));
        expect(TinaAvatarSize.values, contains(TinaAvatarSize.extraSmall));
        expect(TinaAvatarSize.values, contains(TinaAvatarSize.small));
        expect(TinaAvatarSize.values, contains(TinaAvatarSize.medium));
        expect(TinaAvatarSize.values, contains(TinaAvatarSize.large));
        expect(TinaAvatarSize.values, contains(TinaAvatarSize.extraLarge));
        expect(TinaAvatarSize.values, contains(TinaAvatarSize.huge));
      });
    });
  });

  group('TinaAvatarGroup', () {
    testWidgets('renders multiple avatars correctly', (tester) async {
      final avatars = [
        const TinaAvatar.initials(initials: 'JD'),
        const TinaAvatar.initials(initials: 'AB'),
        const TinaAvatar.initials(initials: 'CD'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAvatarGroup(
              avatars: avatars,
            ),
          ),
        ),
      );

      expect(find.byType(TinaAvatar), findsNWidgets(3));
      expect(find.text('JD'), findsOneWidget);
      expect(find.text('AB'), findsOneWidget);
      expect(find.text('CD'), findsOneWidget);
    });

    testWidgets('shows count avatar when exceeding maxVisible', (tester) async {
      final avatars = [
        const TinaAvatar.initials(initials: 'JD'),
        const TinaAvatar.initials(initials: 'AB'),
        const TinaAvatar.initials(initials: 'CD'),
        const TinaAvatar.initials(initials: 'EF'),
        const TinaAvatar.initials(initials: 'GH'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAvatarGroup(
              avatars: avatars,
            ),
          ),
        ),
      );

      expect(find.byType(TinaAvatar), findsNWidgets(4)); // 3 visible + 1 count
      expect(find.text('+2'), findsOneWidget);
    });

    testWidgets('does not show count when showCount is false', (tester) async {
      final avatars = [
        const TinaAvatar.initials(initials: 'JD'),
        const TinaAvatar.initials(initials: 'AB'),
        const TinaAvatar.initials(initials: 'CD'),
        const TinaAvatar.initials(initials: 'EF'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAvatarGroup(
              avatars: avatars,
              maxVisible: 2,
              showCount: false,
            ),
          ),
        ),
      );

      expect(find.byType(TinaAvatar), findsNWidgets(2));
      expect(find.text('+2'), findsNothing);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Team members';
      final avatars = [
        const TinaAvatar.initials(initials: 'JD'),
        const TinaAvatar.initials(initials: 'AB'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaAvatarGroup(
              avatars: avatars,
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      // Check that the semantic label is applied correctly
      final semanticsWidgets = find.byType(Semantics);
      expect(semanticsWidgets, findsWidgets);

      // Find the TinaAvatarGroup widget and verify it has the semantic label
      final avatarGroupWidget = tester.widget<TinaAvatarGroup>(
        find.byType(TinaAvatarGroup),
      );
      expect(avatarGroupWidget.semanticLabel, equals(semanticLabel));
    });

    testWidgets('returns empty widget when avatars list is empty', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaAvatarGroup(
              avatars: [],
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(TinaAvatar), findsNothing);
    });
  });
}
