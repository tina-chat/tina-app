import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knobs/icons.dart';

@widgetbook.UseCase(name: 'Active Tab Item', type: AuraTabItem)
Widget activeTabItemUseCase(BuildContext context) {
  return AuraTabItem(
    icon: context.knobs.iconDataOrNull(label: 'Icon', initialValue: Icons.home),
    text: context.knobs.string(label: 'Text', initialValue: 'Home'),
    isActive: context.knobs.boolean(label: 'Is Active', initialValue: true),
    onTap: () {},
    badge: context.knobs.boolean(label: 'Show Badge', initialValue: false)
        ? AuraBadge.count(
            count: context.knobs.int.slider(
              label: 'Badge Count',
              initialValue: 1,
              min: 1,
              max: 99,
            ),
          )
        : null,
  );
}
