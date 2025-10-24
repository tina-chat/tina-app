import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';

void main() {
  group('TinaText', () {
    testWidgets('renders text correctly', (tester) async {
      const testText = 'Hello, World!';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaText(child: Text(testText)),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
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
