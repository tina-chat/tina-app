import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Aura Connection Status', type: AuraConnectionStatus)
Widget onlineStatusUseCase(BuildContext context) {
  return AuraConnectionStatus(
    status: context.knobs.object.dropdown(
      label: 'status',
      options: AuraConnectionState.values,
      labelBuilder: (value) => value.name,
    ),
    size: context.knobs.object.dropdown(
      label: 'size',
      options: AuraConnectionStatusSize.values,
      labelBuilder: (value) => value.name,
    ),
    showLabel: context.knobs.boolean(label: 'Show Label'),
    customLabel: context.knobs.string(
      label: 'Custom Label',
      initialValue: 'Custom Status',
    ),
  );
}
