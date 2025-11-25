import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Horizontal Divider', type: AuraDivider)
Widget basicHorizontalDividerUseCase(BuildContext context) {
  return AuraDivider(
    endIndent: context.knobs.double.slider(
      label: 'End Indent',
      initialValue: 0,
      max: 100,
    ),
    height: context.knobs.double.slider(
      label: 'Height',
      initialValue: 0,
      min: 0,
      max: 1,
    ),
    indent: context.knobs.double.slider(
      label: 'Indent',
      initialValue: 0,
      max: 100,
    ),
    thickness: context.knobs.double.slider(
      label: 'Thickness',
      initialValue: 1,
      max: 1,
      min: 0,
    ),
  );
}

@widgetbook.UseCase(name: 'Vertical Divider', type: AuraDivider)
Widget verticalDividerUseCase(BuildContext context) {
  return AuraDivider.vertical(
    width: context.knobs.double.slider(
      label: 'Height',
      initialValue: 0,
      min: 0,
      max: 1,
    ),
    endIndent: context.knobs.double.slider(
      label: 'End Indent',
      initialValue: 0,
      max: 100,
    ),

    indent: context.knobs.double.slider(
      label: 'Indent',
      initialValue: 0,
      max: 100,
    ),
    thickness: context.knobs.double.slider(
      label: 'Thickness',
      initialValue: 1,
      max: 1,
      min: 0,
    ),
  );
}

@widgetbook.UseCase(name: 'Divider with Label', type: AuraDivider)
Widget dividerWithLabelUseCase(BuildContext context) {
  return AuraDivider.withLabel(
    label: Text('Section 1'),

    height: context.knobs.double.slider(
      label: 'Height',
      initialValue: 0,
      min: 0,
      max: 1,
    ),
    endIndent: context.knobs.double.slider(
      label: 'End Indent',
      initialValue: 0,
      max: 100,
    ),

    indent: context.knobs.double.slider(
      label: 'Indent',
      initialValue: 0,
      max: 100,
    ),
    thickness: context.knobs.double.slider(
      label: 'Thickness',
      initialValue: 1,
      max: 1,
      min: 0,
    ),
  );
}
