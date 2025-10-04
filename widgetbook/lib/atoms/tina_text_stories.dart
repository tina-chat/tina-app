import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Text Styles', type: TinaText)
Widget textStylesUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TinaText(
            'Heading 1 - Large heading text',
            style: TinaTextStyle.heading1,
          ),
          SizedBox(height: 16),
          TinaText(
            'Heading 2 - Medium heading text',
            style: TinaTextStyle.heading2,
          ),
          SizedBox(height: 16),
          TinaText(
            'Heading 3 - Small heading text',
            style: TinaTextStyle.heading3,
          ),
          SizedBox(height: 16),
          TinaText(
            'Heading 4 - Extra small heading text',
            style: TinaTextStyle.heading4,
          ),
          SizedBox(height: 16),
          TinaText(
            'Heading 5 - Tiny heading text',
            style: TinaTextStyle.heading5,
          ),
          SizedBox(height: 16),
          TinaText(
            'Heading 6 - Micro heading text',
            style: TinaTextStyle.heading6,
          ),
          SizedBox(height: 24),
          TinaText(
            'Body Large - Large body text for important content',
            style: TinaTextStyle.bodyLarge,
          ),
          SizedBox(height: 12),
          TinaText(
            'Body - Default body text for regular content',
            style: TinaTextStyle.body,
          ),
          SizedBox(height: 12),
          TinaText(
            'Body Small - Small body text for less important content',
            style: TinaTextStyle.bodySmall,
          ),
          SizedBox(height: 12),
          TinaText(
            'Caption - Caption text for descriptions and metadata',
            style: TinaTextStyle.caption,
          ),
          SizedBox(height: 12),
          TinaText(
            'OVERLINE - OVERLINE TEXT FOR LABELS',
            style: TinaTextStyle.overline,
          ),
          SizedBox(height: 12),
          TinaText('Button - Button text style', style: TinaTextStyle.button),
          SizedBox(height: 12),
          TinaText(
            'Code - Monospace code text style',
            style: TinaTextStyle.code,
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
            'The quick brown fox jumps over the lazy dog',
            style: TinaTextStyle.heading1,
          ),
          SizedBox(height: 24),
          TinaText(
            'The quick brown fox jumps over the lazy dog',
            style: TinaTextStyle.heading2,
          ),
          SizedBox(height: 20),
          TinaText(
            'The quick brown fox jumps over the lazy dog',
            style: TinaTextStyle.heading3,
          ),
          SizedBox(height: 16),
          TinaText(
            'The quick brown fox jumps over the lazy dog',
            style: TinaTextStyle.heading4,
          ),
          SizedBox(height: 16),
          TinaText(
            'The quick brown fox jumps over the lazy dog',
            style: TinaTextStyle.heading5,
          ),
          SizedBox(height: 16),
          TinaText(
            'The quick brown fox jumps over the lazy dog',
            style: TinaTextStyle.heading6,
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
          'Body Large - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: TinaTextStyle.bodyLarge,
        ),
        SizedBox(height: 16),
        TinaText(
          'Body - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
          style: TinaTextStyle.body,
        ),
        SizedBox(height: 16),
        TinaText(
          'Body Small - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: TinaTextStyle.bodySmall,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors', type: TinaText)
Widget customColorsUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TinaText(
          'Primary Color Text',
          style: TinaTextStyle.heading4,
          color: Colors.blue,
        ),
        SizedBox(height: 12),
        TinaText(
          'Success Color Text',
          style: TinaTextStyle.body,
          color: Colors.green,
        ),
        SizedBox(height: 12),
        TinaText(
          'Warning Color Text',
          style: TinaTextStyle.body,
          color: Colors.orange,
        ),
        SizedBox(height: 12),
        TinaText(
          'Error Color Text',
          style: TinaTextStyle.body,
          color: Colors.red,
        ),
        SizedBox(height: 12),
        TinaText(
          'Custom Color Text',
          style: TinaTextStyle.body,
          color: Colors.purple,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Font Weights', type: TinaText)
Widget fontWeightsUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TinaText(
          'Light Weight Text',
          style: TinaTextStyle.body,
          fontWeight: FontWeight.w300,
        ),
        SizedBox(height: 12),
        TinaText(
          'Regular Weight Text',
          style: TinaTextStyle.body,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 12),
        TinaText(
          'Medium Weight Text',
          style: TinaTextStyle.body,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 12),
        TinaText(
          'Semi Bold Weight Text',
          style: TinaTextStyle.body,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 12),
        TinaText(
          'Bold Weight Text',
          style: TinaTextStyle.body,
          fontWeight: FontWeight.w700,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Text Alignment', type: TinaText)
Widget textAlignmentUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: const [
        TinaText(
          'Left aligned text - Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          style: TinaTextStyle.body,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 16),
        TinaText(
          'Center aligned text - Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          style: TinaTextStyle.body,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        TinaText(
          'Right aligned text - Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          style: TinaTextStyle.body,
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 16),
        TinaText(
          'Justified text - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: TinaTextStyle.body,
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Text Overflow', type: TinaText)
Widget textOverflowUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Max Lines: 2, Overflow: Ellipsis'),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          child: const TinaText(
            'This is a very long text that will be truncated when it exceeds the maximum number of lines allowed.',
            style: TinaTextStyle.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 24),
        const Text('Max Lines: 1, Overflow: Fade'),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          child: const TinaText(
            'This is a very long text that will be faded when it exceeds the maximum width.',
            style: TinaTextStyle.body,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
        const SizedBox(height: 24),
        const Text('Max Lines: 3, Overflow: Visible'),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          height: 80,
          child: const TinaText(
            'This is a very long text that will be visible even when it exceeds the container bounds.',
            style: TinaTextStyle.body,
            maxLines: 3,
            overflow: TextOverflow.visible,
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
        TinaText('Regular text for comparison', style: TinaTextStyle.body),
        SizedBox(height: 16),
        TinaText(
          'function helloWorld() {\n  console.log("Hello, World!");\n}',
          style: TinaTextStyle.code,
        ),
        SizedBox(height: 16),
        TinaText(
          'const API_URL = "https://api.example.com/v1";',
          style: TinaTextStyle.code,
        ),
        SizedBox(height: 16),
        TinaText('npm install flutter_bloc', style: TinaTextStyle.code),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Semantic Labels', type: TinaText)
Widget semanticLabelsUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TinaText(
          'Price: \$29.99',
          style: TinaTextStyle.body,
          semanticsLabel: 'Price: twenty nine dollars and ninety nine cents',
        ),
        SizedBox(height: 16),
        TinaText(
          'Date: 2024-01-15',
          style: TinaTextStyle.body,
          semanticsLabel: 'Date: January fifteenth, two thousand twenty four',
        ),
        SizedBox(height: 16),
        TinaText(
          'Phone: (555) 123-4567',
          style: TinaTextStyle.body,
          semanticsLabel:
              'Phone number: five five five, one two three, four five six seven',
        ),
      ],
    ),
  );
}
