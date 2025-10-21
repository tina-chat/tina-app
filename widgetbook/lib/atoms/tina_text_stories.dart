import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Text Styles', type: TinaText)
Widget textStylesUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TinaText(
            style: context.knobs.object.dropdown(
              label: 'Style',
              options: TinaTextStyle.values,
            ),
            child: Text('Heading 1 - Large heading text'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Headings', type: TinaText)
Widget headingsUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TinaText(
            style: TinaTextStyle.heading1,
            child: Text('The quick brown fox jumps over the lazy dog'),
          ),
          SizedBox(height: 24),
          TinaText(
            style: TinaTextStyle.heading2,
            child: Text('The quick brown fox jumps over the lazy dog'),
          ),
          SizedBox(height: 20),
          TinaText(
            style: TinaTextStyle.heading3,
            child: Text('The quick brown fox jumps over the lazy dog'),
          ),
          SizedBox(height: 16),
          TinaText(
            style: TinaTextStyle.heading4,
            child: Text('The quick brown fox jumps over the lazy dog'),
          ),
          SizedBox(height: 16),
          TinaText(
            style: TinaTextStyle.heading5,
            child: Text('The quick brown fox jumps over the lazy dog'),
          ),
          SizedBox(height: 16),
          TinaText(
            style: TinaTextStyle.heading6,
            child: Text('The quick brown fox jumps over the lazy dog'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Body Text', type: TinaText)
Widget bodyTextUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TinaText(
          style: TinaTextStyle.bodyLarge,
          child: Text(
            'Body Large - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
        ),
        SizedBox(height: 16),
        TinaText(
          style: TinaTextStyle.body,
          child: Text(
            'Body - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
          ),
        ),
        SizedBox(height: 16),
        TinaText(
          style: TinaTextStyle.bodySmall,
          child: Text(
            'Body Small - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Code Text', type: TinaText)
Widget codeTextUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TinaText(
          style: TinaTextStyle.body,
          child: Text('Regular text for comparison'),
        ),
        SizedBox(height: 16),
        TinaText(
          style: TinaTextStyle.code,
          child: Text(
            'function helloWorld() {\n  console.log("Hello, World!");\n}',
          ),
        ),
        SizedBox(height: 16),
        TinaText(
          style: TinaTextStyle.code,
          child: Text('const API_URL = "https://api.example.com/v1";'),
        ),
        SizedBox(height: 16),
        TinaText(
          style: TinaTextStyle.code,
          child: Text('npm install flutter_bloc'),
        ),
      ],
    ),
  );
}
