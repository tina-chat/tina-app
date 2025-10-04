import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaText', () {
    testWidgets('renders text correctly', (tester) async {
      const testText = 'Hello, World!';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(testText),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('applies correct style for heading1', (tester) async {
      const testText = 'Heading 1';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
              style: TinaTextStyle.heading1,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontSize, DesignTypography.fontSize5Xl);
      expect(textWidget.style?.fontWeight, DesignTypography.fontWeightBold);
      expect(textWidget.style?.color, const Color(0xFF0F172A)); // tinaColors.onBackground
    });

    testWidgets('applies correct style for body text', (tester) async {
      const testText = 'Body text';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontSize, DesignTypography.fontSizeBase);
      expect(textWidget.style?.fontWeight, DesignTypography.fontWeightRegular);
      expect(textWidget.style?.color, const Color(0xFF0F172A)); // tinaColors.onSurface
    });

    testWidgets('applies custom color when provided', (tester) async {
      const testText = 'Custom color text';
      const customColor = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
              color: customColor,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.color, customColor);
    });

    testWidgets('applies text alignment correctly', (tester) async {
      const testText = 'Centered text';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('applies maxLines correctly', (tester) async {
      const testText = 'Text with max lines';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
              maxLines: 2,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.maxLines, 2);
    });

    testWidgets('applies overflow correctly', (tester) async {
      const testText = 'Text with overflow';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const testText = 'Text with semantic label';
      const semanticLabel = 'Custom semantic label';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
              semanticsLabel: semanticLabel,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.semanticsLabel, semanticLabel);
    });

    testWidgets('applies code style correctly', (tester) async {
      const testText = 'console.log("Hello");';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(
              testText,
              style: TinaTextStyle.code,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontFamily, DesignTypography.monoFontFamily);
      expect(textWidget.style?.fontSize, DesignTypography.fontSizeSm);
    });

    group('TinaTextStyle enum', () {
      test('has all expected values', () {
        expect(TinaTextStyle.values, hasLength(13));
        expect(TinaTextStyle.values, contains(TinaTextStyle.heading1));
        expect(TinaTextStyle.values, contains(TinaTextStyle.heading2));
        expect(TinaTextStyle.values, contains(TinaTextStyle.heading3));
        expect(TinaTextStyle.values, contains(TinaTextStyle.heading4));
        expect(TinaTextStyle.values, contains(TinaTextStyle.heading5));
        expect(TinaTextStyle.values, contains(TinaTextStyle.heading6));
        expect(TinaTextStyle.values, contains(TinaTextStyle.bodyLarge));
        expect(TinaTextStyle.values, contains(TinaTextStyle.body));
        expect(TinaTextStyle.values, contains(TinaTextStyle.bodySmall));
        expect(TinaTextStyle.values, contains(TinaTextStyle.caption));
        expect(TinaTextStyle.values, contains(TinaTextStyle.overline));
        expect(TinaTextStyle.values, contains(TinaTextStyle.button));
        expect(TinaTextStyle.values, contains(TinaTextStyle.code));
      });
    });
  });
}
