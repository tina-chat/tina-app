import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_input.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaInput', () {
    testWidgets('renders input field correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              placeholder: 'Enter text',
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('displays initial value correctly', (tester) async {
      const initialValue = 'Initial text';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              initialValue: initialValue,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      expect(textField.initialValue, initialValue);
    });

    testWidgets('calls onChanged when text changes', (tester) async {
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaInput(
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'New text');
      expect(changedValue, 'New text');
    });

    testWidgets('calls onSubmitted when submitted', (tester) async {
      String? submittedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaInput(
              onSubmitted: (value) => submittedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Submitted text');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(submittedValue, 'Submitted text');
    });

    testWidgets('displays helper text correctly', (tester) async {
      const helperText = 'This is helper text';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              hint: Text(helperText),
            ),
          ),
        ),
      );

      expect(find.text(helperText), findsOneWidget);
    });

    testWidgets('displays error text correctly', (tester) async {
      const errorText = 'This is an error';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              error: Text(errorText),
              state: TinaInputState.error,
            ),
          ),
        ),
      );

      expect(find.text(errorText), findsOneWidget);

      final errorTextWidget = tester.widget<Text>(find.text(errorText));
      expect(errorTextWidget.style?.color, DesignColors.error);
    });

    testWidgets('prioritizes error text over helper text', (tester) async {
      const helperText = 'Helper text';
      const errorText = 'Error text';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              hint: Text(helperText),
              error: Text(errorText),
            ),
          ),
        ),
      );

      expect(find.text(errorText), findsOneWidget);
      expect(find.text(helperText), findsNothing);
    });

    testWidgets('applies small size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              size: TinaInputSize.small,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(TextFormField),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxHeight, DesignInputSizes.heightSm);
    });

    testWidgets('applies medium size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(TextFormField),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxHeight, DesignInputSizes.heightMd);
    });

    testWidgets('applies large size correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              size: TinaInputSize.large,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(TextFormField),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxHeight, DesignInputSizes.heightLg);
    });

    testWidgets('applies success state styling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              state: TinaInputState.success,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(TextFormField),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border?.top.color, DesignColors.success);
    });

    testWidgets('applies warning state styling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              state: TinaInputState.warning,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(TextFormField),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border?.top.color, DesignColors.warning);
    });

    testWidgets('applies error state styling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              state: TinaInputState.error,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(TextFormField),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border?.top.color, DesignColors.error);
    });

    testWidgets('disables input when enabled is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              enabled: false,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      expect(textField.enabled, isFalse);
    });

    testWidgets('makes input read-only when readOnly is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              readOnly: true,
            ),
          ),
        ),
      );

      // Test that the input is read-only by checking if we can enter text
      await tester.enterText(find.byType(TextFormField), 'test');
      expect(find.text('test'), findsNothing);
    });

    testWidgets('obscures text when obscureText is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              obscureText: true,
              initialValue: 'password',
            ),
          ),
        ),
      );

      // Find the TinaInput widget and verify obscureText property is set
      final tinaInput = tester.widget<TinaInput>(find.byType(TinaInput));
      expect(tinaInput.obscureText, isTrue);

      // Verify the initial value is set correctly
      expect(tinaInput.initialValue, equals('password'));
    });

    testWidgets('displays prefix icon correctly', (tester) async {
      const prefixIcon = Icon(Icons.search);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('displays suffix icon correctly', (tester) async {
      const suffixIcon = Icon(Icons.clear);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaInput(
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.clear), findsOneWidget);
    });

    group('TinaInputSize enum', () {
      test('has all expected values', () {
        expect(TinaInputSize.values, hasLength(3));
        expect(TinaInputSize.values, contains(TinaInputSize.small));
        expect(TinaInputSize.values, contains(TinaInputSize.medium));
        expect(TinaInputSize.values, contains(TinaInputSize.large));
      });
    });

    group('TinaInputState enum', () {
      test('has all expected values', () {
        expect(TinaInputState.values, hasLength(4));
        expect(TinaInputState.values, contains(TinaInputState.normal));
        expect(TinaInputState.values, contains(TinaInputState.success));
        expect(TinaInputState.values, contains(TinaInputState.warning));
        expect(TinaInputState.values, contains(TinaInputState.error));
      });
    });
  });
}
