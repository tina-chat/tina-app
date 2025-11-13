import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Input', type: AuraInput)
Widget basicInputUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: AuraInput(
      placeholder: Text('Enter your text here'),
      hint: Text('This is a basic input field'),
    ),
  );
}

@widgetbook.UseCase(name: 'Input Sizes', type: AuraInput)
Widget inputSizesUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraText(style: AuraTextStyle.caption, child: Text('Small Input')),
        SizedBox(height: 8),
        AuraInput(size: AuraInputSize.small, placeholder: Text('Small input')),
        SizedBox(height: 24),
        AuraText(
          style: AuraTextStyle.caption,
          child: Text('Medium Input (Default)'),
        ),
        SizedBox(height: 8),
        AuraInput(
          size: AuraInputSize.medium,
          placeholder: Text('Medium input'),
        ),
        SizedBox(height: 24),
        AuraText(style: AuraTextStyle.caption, child: Text('Large Input')),
        SizedBox(height: 8),
        AuraInput(size: AuraInputSize.large, placeholder: Text('Large input')),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input States', type: AuraInput)
Widget inputStatesUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraText(style: AuraTextStyle.caption, child: Text('Normal State')),
        SizedBox(height: 8),
        AuraInput(
          state: AuraInputState.normal,
          placeholder: Text('Normal input'),
          hint: Text('This is a normal input field'),
        ),
        SizedBox(height: 24),
        AuraText(style: AuraTextStyle.caption, child: Text('Success State')),
        SizedBox(height: 8),
        AuraInput(
          state: AuraInputState.success,
          placeholder: Text('Success input'),
          hint: Text('Input validation successful'),
          initialValue: 'Valid input',
        ),
        SizedBox(height: 24),
        AuraText(style: AuraTextStyle.caption, child: Text('Warning State')),
        SizedBox(height: 8),
        AuraInput(
          state: AuraInputState.warning,
          placeholder: Text('Warning input'),
          hint: Text('Please review your input'),
          initialValue: 'Warning example',
        ),
        SizedBox(height: 24),
        AuraText(style: AuraTextStyle.caption, child: Text('Error State')),
        SizedBox(height: 8),
        AuraInput(
          state: AuraInputState.error,
          placeholder: Text('Error input'),
          error: Text('This field is required'),
          initialValue: 'Invalid input',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input with Icons', type: AuraInput)
Widget inputWithIconsUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AuraInput(
          placeholder: Text('Search...'),
          prefixIcon: Icon(Icons.search),
          hint: Text('Input with prefix icon'),
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Enter password'),
          suffixIcon: Icon(Icons.visibility_off),
          hint: Text('Input with suffix icon'),
          obscureText: true,
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Email address'),
          prefixIcon: Icon(Icons.email),
          suffixIcon: Icon(Icons.check_circle, color: Colors.green),
          hint: Text('Input with both prefix and suffix icons'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input Types', type: AuraInput)
Widget inputTypesUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraInput(
          placeholder: Text('Enter your email'),
          keyboardType: TextInputType.emailAddress,
          hint: Text('Email input type'),
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Enter phone number'),
          keyboardType: TextInputType.phone,
          hint: Text('Phone input type'),
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Enter a number'),
          keyboardType: TextInputType.number,
          hint: Text('Number input type'),
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Enter password'),
          obscureText: true,
          hint: Text('Password input (obscured)'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Multiline Input', type: AuraInput)
Widget multilineInputUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraInput(
          placeholder: Text('Enter your message...'),
          maxLines: 4,
          hint: Text('Multiline text input'),
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Enter description...'),
          maxLines: 3,
          maxLength: 200,
          hint: Text('Multiline with character limit'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input Formatters', type: AuraInput)
Widget inputFormattersUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraInput(
          placeholder: Text('UPPERCASE ONLY'),
          inputFormatters: [UpperCaseTextFormatter()],
          hint: Text('Converts input to uppercase'),
        ),
        const SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Numbers only'),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          hint: Text('Only accepts numbers'),
        ),
        const SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Max 10 characters'),
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          hint: Text('Limited to 10 characters'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Input', type: AuraInput)
Widget disabledInputUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraInput(
          enabled: false,
          placeholder: Text('Disabled input'),
          hint: Text('This input is disabled'),
        ),
        SizedBox(height: 24),
        AuraInput(
          enabled: false,
          initialValue: 'Disabled with value',
          hint: Text('Disabled input with initial value'),
        ),
        SizedBox(height: 24),
        AuraInput(
          readOnly: true,
          initialValue: 'Read-only input',
          hint: Text('This input is read-only'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input Focus', type: AuraInput)
Widget inputFocusUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraInput(
          autofocus: true,
          placeholder: Text('Auto-focused input'),
          hint: Text('This input is auto-focused'),
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Regular input'),
          hint: Text('Regular input field'),
        ),
        SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Another input'),
          hint: Text('Another input field'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Interactive Input', type: AuraInput)
Widget interactiveInputUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraInput(
          placeholder: Text('Type something...'),
          onChanged: (value) {
            // Handle change
          },
          onSubmitted: (value) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Submitted: $value')));
          },
          hint: Text('Press enter to submit'),
        ),
        const SizedBox(height: 24),
        AuraInput(
          placeholder: Text('Tap to interact'),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Input field tapped!')),
            );
          },
          hint: Text('Tap this field to see interaction'),
        ),
      ],
    ),
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}
