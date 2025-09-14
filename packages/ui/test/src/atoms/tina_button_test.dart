import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/atoms/tina_button.dart';
import 'package:ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaButton', () {
    testWidgets('renders button with text correctly', (tester) async {
      const buttonText = 'Click me';
      bool wasPressed = false;
      
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
      expect(find.byType(ElevatedButton), findsOneWidget);
      
      await tester.tap(find.byType(TinaButton));
      expect(wasPressed, isTrue);
    });

    testWidgets('applies primary variant styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              variant: TinaButtonVariant.primary,
              child: const Text('Primary'),
            ),
          ),
        ),
      );

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      
      expect(elevatedButton.style?.backgroundColor?.resolve({}), 
             DesignColors.primaryBase);
      expect(elevatedButton.style?.foregroundColor?.resolve({}), 
             DesignColors.primaryContrast);
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

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      
      expect(elevatedButton.style?.backgroundColor?.resolve({}), 
             DesignColors.secondaryBase);
      expect(elevatedButton.style?.foregroundColor?.resolve({}), 
             DesignColors.secondaryContrast);
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

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      
      expect(elevatedButton.style?.backgroundColor?.resolve({}), 
             Colors.transparent);
      expect(elevatedButton.style?.foregroundColor?.resolve({}), 
             DesignColors.primaryBase);
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

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      
      expect(elevatedButton.style?.backgroundColor?.resolve({}), 
             Colors.transparent);
      expect(elevatedButton.style?.foregroundColor?.resolve({}), 
             DesignColors.primaryBase);
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
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
      );
      
      expect(sizedBox.height, DesignButtonSizes.heightSm);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaButton(
              onPressed: () {},
              size: TinaButtonSize.medium,
              child: const Text('Medium'),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
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
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
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
      bool wasPressed = false;
      
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
        find.ancestor(
          of: find.byType(ElevatedButton),
          matching: find.byType(SizedBox),
        ).first,
      );
      
      expect(sizedBox.width, double.infinity);
    });

    testWidgets('applies disabled styling when onPressed is null', (tester) async {
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

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      
      expect(elevatedButton.onPressed, isNull);
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