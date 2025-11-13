import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Horizontal Divider', type: AuraDivider)
Widget basicHorizontalDividerUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Content above divider'),
      AuraDivider(),
      Text('Content below divider'),
    ],
  );
}

@widgetbook.UseCase(name: 'Vertical Divider', type: AuraDivider)
Widget verticalDividerUseCase(BuildContext context) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Left content'),
      AuraDivider.vertical(),
      Text('Right content'),
    ],
  );
}

@widgetbook.UseCase(name: 'Divider with Label', type: AuraDivider)
Widget dividerWithLabelUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Section 1 content'),
      AuraDivider.withLabel(label: 'OR'),
      Text('Section 2 content'),
    ],
  );
}

@widgetbook.UseCase(name: 'Custom Thickness Dividers', type: AuraDivider)
Widget customThicknessDividersUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Thin divider'),
      AuraDivider(thickness: 1),
      SizedBox(height: 16),
      Text('Medium divider'),
      AuraDivider(thickness: 2),
      SizedBox(height: 16),
      Text('Thick divider'),
      AuraDivider(thickness: 4),
    ],
  );
}

@widgetbook.UseCase(name: 'Custom Color Dividers', type: AuraDivider)
Widget customColorDividersUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Default color divider'),
      AuraDivider(),
      SizedBox(height: 16),
      Text('Red divider'),
      AuraDivider(color: Colors.red),
      SizedBox(height: 16),
      Text('Blue divider'),
      AuraDivider(color: Colors.blue),
      SizedBox(height: 16),
      Text('Green divider'),
      AuraDivider(color: Colors.green),
    ],
  );
}

@widgetbook.UseCase(name: 'Indented Dividers', type: AuraDivider)
Widget indentedDividersUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Left indent only'),
      AuraDivider(indent: 32),
      SizedBox(height: 16),
      Text('Right indent only'),
      AuraDivider(endIndent: 32),
      SizedBox(height: 16),
      Text('Both sides indented'),
      AuraDivider(indent: 24, endIndent: 24),
    ],
  );
}

@widgetbook.UseCase(name: 'List Divider', type: AuraListDivider)
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
            AuraListDivider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Jane Smith'),
              subtitle: Text('Product Manager'),
            ),
            AuraListDivider(),
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

@widgetbook.UseCase(name: 'Section Divider', type: AuraSectionDivider)
Widget sectionDividerUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('First section content'),
      Text('More content in first section'),
      AuraSectionDivider(),
      Text('Second section content'),
      Text('More content in second section'),
      AuraSectionDivider(label: 'Special Section'),
      Text('Third section with label'),
      Text('More content in third section'),
    ],
  );
}
