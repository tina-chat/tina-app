import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_button.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaButton', () {
    testWidgets('renders button with text correctly', (tester) async {
      const buttonText = 'Click me';
      var wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () => wasPressed = true,
              child: const Text(buttonText),
            ),
          ),
        ),
      );

      expect(find.text(buttonText), findsOneWidget);
      // Check for the actual widget structure: Material -> InkWell ->
      // AnimatedContainer
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);

      await tester.tap(find.byType(TinaButton));
      expect(wasPressed, isTrue);
    });

    testWidgets('applies primary variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              child: const Text('Primary'),
            ),
          ),
        ),
      );

      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = animatedContainer.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.primaryBase);
    });

    testWidgets('applies secondary variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              variant: TinaButtonVariant.secondary,
              child: const Text('Secondary'),
            ),
          ),
        ),
      );

      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = animatedContainer.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.secondaryBase);
    });

    testWidgets('applies outlined variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              variant: TinaButtonVariant.outlined,
              child: const Text('Outlined'),
            ),
          ),
        ),
      );

      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = animatedContainer.decoration! as BoxDecoration;
      expect(decoration.color, Colors.transparent);
      expect(decoration.border, isNotNull);
      expect(decoration.border!.top.color, DesignColors.primaryBase);
    });

    testWidgets('applies ghost variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              variant: TinaButtonVariant.ghost,
              child: const Text('Ghost'),
            ),
          ),
        ),
      );

      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = animatedContainer.decoration! as BoxDecoration;
      expect(decoration.color, Colors.transparent);
      expect(decoration.border, isNull);
    });

    testWidgets('applies elevated variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              variant: TinaButtonVariant.elevated,
              child: const Text('Elevated'),
            ),
          ),
        ),
      );

      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = animatedContainer.decoration! as BoxDecoration;
      expect(decoration.color, DesignColors.primaryBase);
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, 1);
      expect(decoration.boxShadow!.first, DesignShadows.sm);
    });

    testWidgets('applies small size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              size: TinaButtonSize.small,
              child: const Text('Small'),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(AnimatedContainer),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      expect(sizedBox.height, DesignButtonSizes.heightSm);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              child: const Text('Medium'),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(AnimatedContainer),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      expect(sizedBox.height, DesignButtonSizes.heightMd);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              size: TinaButtonSize.large,
              child: const Text('Large'),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(AnimatedContainer),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      expect(sizedBox.height, DesignButtonSizes.heightLg);
    });

    testWidgets('shows loading spinner when isLoading is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              isLoading: true,
              child: const Text('Loading'),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading'), findsNothing);
    });

    testWidgets('disables button when isLoading is true', (tester) async {
      var wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () => wasPressed = true,
              isLoading: true,
              child: const Text('Loading'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TinaButton));
      expect(wasPressed, isFalse);
    });

    testWidgets('applies full width when isFullWidth is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              isFullWidth: true,
              child: const Text('Full Width'),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(AnimatedContainer),
              matching: find.byType(SizedBox),
            )
            .first,
      );

      expect(sizedBox.width, double.infinity);
    });

    testWidgets('applies disabled styling when onPressed is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(
        find.byType(InkWell),
      );

      expect(inkWell.onTap, isNull);

      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = animatedContainer.decoration! as BoxDecoration;
      // Disabled state should have outlineVariant color
      expect(decoration.color, isNotNull);
    });

    testWidgets('applies correct text styling based on size', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              size: TinaButtonSize.large,
              child: const Text('Large Button'),
            ),
          ),
        ),
      );

      final defaultTextStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('Large Button'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );

      expect(
        defaultTextStyle.style.fontSize,
        DesignTypography.fontSizeLg,
      );
      expect(
        defaultTextStyle.style.fontWeight,
        DesignTypography.fontWeightSemibold,
      );
    });

    testWidgets('applies correct border radius', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
          ),
        ),
      );

      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = animatedContainer.decoration! as BoxDecoration;
      expect(
        decoration.borderRadius,
        BorderRadius.circular(DesignBorderRadius.md),
      );
    });

    testWidgets('InkWell has correct border radius', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(
        find.byType(InkWell),
      );

      expect(
        inkWell.borderRadius,
        BorderRadius.circular(DesignBorderRadius.md),
      );
    });

    group('TinaButtonVariant enum', () {
      test('has all expected values', () {
        expect(TinaButtonVariant.values, hasLength(5));
        expect(TinaButtonVariant.values, contains(TinaButtonVariant.primary));
        expect(TinaButtonVariant.values, contains(TinaButtonVariant.secondary));
        expect(TinaButtonVariant.values, contains(TinaButtonVariant.outlined));
        expect(TinaButtonVariant.values, contains(TinaButtonVariant.ghost));
        expect(TinaButtonVariant.values, contains(TinaButtonVariant.elevated));
      });
    });

    group('TinaButtonSize enum', () {
      test('has all expected values', () {
        expect(TinaButtonSize.values, hasLength(3));
        expect(TinaButtonSize.values, contains(TinaButtonSize.small));
        expect(TinaButtonSize.values, contains(TinaButtonSize.medium));
        expect(TinaButtonSize.values, contains(TinaButtonSize.large));
      });
    });
  });
}
