import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Input', type: TinaInput)
Widget basicInputUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: TinaInput(
      placeholder: 'Enter your text here',
      hint: Text('This is a basic input field'),
    ),
  );
}

@widgetbook.UseCase(name: 'Input Sizes', type: TinaInput)
Widget inputSizesUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaText(style: TinaTextStyle.caption, child: Text('Small Input')),
        SizedBox(height: 8),
        TinaInput(size: TinaInputSize.small, placeholder: 'Small input'),
        SizedBox(height: 24),
        TinaText(
          style: TinaTextStyle.caption,
          child: Text('Medium Input (Default)'),
        ),
        SizedBox(height: 8),
        TinaInput(size: TinaInputSize.medium, placeholder: 'Medium input'),
        SizedBox(height: 24),
        TinaText(style: TinaTextStyle.caption, child: Text('Large Input')),
        SizedBox(height: 8),
        TinaInput(size: TinaInputSize.large, placeholder: 'Large input'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input States', type: TinaInput)
Widget inputStatesUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaText(style: TinaTextStyle.caption, child: Text('Normal State')),
        SizedBox(height: 8),
        TinaInput(
          state: TinaInputState.normal,
          placeholder: 'Normal input',
          hint: Text('This is a normal input field'),
        ),
        SizedBox(height: 24),
        TinaText(style: TinaTextStyle.caption, child: Text('Success State')),
        SizedBox(height: 8),
        TinaInput(
          state: TinaInputState.success,
          placeholder: 'Success input',
          hint: Text('Input validation successful'),
          initialValue: 'Valid input',
        ),
        SizedBox(height: 24),
        TinaText(style: TinaTextStyle.caption, child: Text('Warning State')),
        SizedBox(height: 8),
        TinaInput(
          state: TinaInputState.warning,
          placeholder: 'Warning input',
          hint: Text('Please review your input'),
          initialValue: 'Warning example',
        ),
        SizedBox(height: 24),
        TinaText(style: TinaTextStyle.caption, child: Text('Error State')),
        SizedBox(height: 8),
        TinaInput(
          state: TinaInputState.error,
          placeholder: 'Error input',
          error: Text('This field is required'),
          initialValue: 'Invalid input',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input with Icons', type: TinaInput)
Widget inputWithIconsUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TinaInput(
          placeholder: 'Search...',
          prefixIcon: Icon(Icons.search),
          hint: Text('Input with prefix icon'),
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Enter password',
          suffixIcon: Icon(Icons.visibility_off),
          hint: Text('Input with suffix icon'),
          obscureText: true,
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Email address',
          prefixIcon: Icon(Icons.email),
          suffixIcon: Icon(Icons.check_circle, color: Colors.green),
          hint: Text('Input with both prefix and suffix icons'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input Types', type: TinaInput)
Widget inputTypesUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaInput(
          placeholder: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          hint: Text('Email input type'),
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Enter phone number',
          keyboardType: TextInputType.phone,
          hint: Text('Phone input type'),
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Enter a number',
          keyboardType: TextInputType.number,
          hint: Text('Number input type'),
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Enter password',
          obscureText: true,
          hint: Text('Password input (obscured)'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Multiline Input', type: TinaInput)
Widget multilineInputUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaInput(
          placeholder: 'Enter your message...',
          maxLines: 4,
          hint: Text('Multiline text input'),
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Enter description...',
          maxLines: 3,
          maxLength: 200,
          hint: Text('Multiline with character limit'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input Formatters', type: TinaInput)
Widget inputFormattersUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaInput(
          placeholder: 'UPPERCASE ONLY',
          inputFormatters: [UpperCaseTextFormatter()],
          hint: Text('Converts input to uppercase'),
        ),
        const SizedBox(height: 24),
        TinaInput(
          placeholder: 'Numbers only',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          hint: Text('Only accepts numbers'),
        ),
        const SizedBox(height: 24),
        TinaInput(
          placeholder: 'Max 10 characters',
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          hint: Text('Limited to 10 characters'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Input', type: TinaInput)
Widget disabledInputUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaInput(
          enabled: false,
          placeholder: 'Disabled input',
          hint: Text('This input is disabled'),
        ),
        SizedBox(height: 24),
        TinaInput(
          enabled: false,
          initialValue: 'Disabled with value',
          hint: Text('Disabled input with initial value'),
        ),
        SizedBox(height: 24),
        TinaInput(
          readOnly: true,
          initialValue: 'Read-only input',
          hint: Text('This input is read-only'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Input Focus', type: TinaInput)
Widget inputFocusUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaInput(
          autofocus: true,
          placeholder: 'Auto-focused input',
          hint: Text('This input is auto-focused'),
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Regular input',
          hint: Text('Regular input field'),
        ),
        SizedBox(height: 24),
        TinaInput(
          placeholder: 'Another input',
          hint: Text('Another input field'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Interactive Input', type: TinaInput)
Widget interactiveInputUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TinaInput(
          placeholder: 'Type something...',
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
        TinaInput(
          placeholder: 'Tap to interact',
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
