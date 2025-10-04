import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Horizontal Divider', type: TinaDivider)
Widget basicHorizontalDividerUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Content above divider'),
      TinaDivider(),
      Text('Content below divider'),
    ],
  );
}

@widgetbook.UseCase(name: 'Vertical Divider', type: TinaDivider)
Widget verticalDividerUseCase(BuildContext context) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Left content'),
      TinaDivider.vertical(),
      Text('Right content'),
    ],
  );
}

@widgetbook.UseCase(name: 'Divider with Label', type: TinaDivider)
Widget dividerWithLabelUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Section 1 content'),
      TinaDivider.withLabel(label: 'OR'),
      Text('Section 2 content'),
    ],
  );
}

@widgetbook.UseCase(name: 'Custom Thickness Dividers', type: TinaDivider)
Widget customThicknessDividersUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Thin divider'),
      TinaDivider(thickness: 1),
      SizedBox(height: 16),
      Text('Medium divider'),
      TinaDivider(thickness: 2),
      SizedBox(height: 16),
      Text('Thick divider'),
      TinaDivider(thickness: 4),
    ],
  );
}

@widgetbook.UseCase(name: 'Custom Color Dividers', type: TinaDivider)
Widget customColorDividersUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Default color divider'),
      TinaDivider(),
      SizedBox(height: 16),
      Text('Red divider'),
      TinaDivider(color: Colors.red),
      SizedBox(height: 16),
      Text('Blue divider'),
      TinaDivider(color: Colors.blue),
      SizedBox(height: 16),
      Text('Green divider'),
      TinaDivider(color: Colors.green),
    ],
  );
}

@widgetbook.UseCase(name: 'Indented Dividers', type: TinaDivider)
Widget indentedDividersUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Left indent only'),
      TinaDivider(indent: 32),
      SizedBox(height: 16),
      Text('Right indent only'),
      TinaDivider(endIndent: 32),
      SizedBox(height: 16),
      Text('Both sides indented'),
      TinaDivider(indent: 24, endIndent: 24),
    ],
  );
}

@widgetbook.UseCase(name: 'List Divider', type: TinaListDivider)
Widget listDividerUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('John Doe'),
              subtitle: Text('Software Engineer'),
            ),
            TinaListDivider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Jane Smith'),
              subtitle: Text('Product Manager'),
            ),
            TinaListDivider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Bob Johnson'),
              subtitle: Text('Designer'),
            ),
          ],
        ),
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Section Divider', type: TinaSectionDivider)
Widget sectionDividerUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('First section content'),
      Text('More content in first section'),
      TinaSectionDivider(),
      Text('Second section content'),
      Text('More content in second section'),
      TinaSectionDivider(label: 'Special Section'),
      Text('Third section with label'),
      Text('More content in third section'),
    ],
  );
}
