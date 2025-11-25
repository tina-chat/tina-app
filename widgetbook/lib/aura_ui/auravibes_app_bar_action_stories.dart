import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic App Bar Action', type: AuraAppBarAction)
Widget basicAppBarActionUseCase(BuildContext context) {
  return AuraAppBarAction(
    icon: Icons.search,
    onPressed: context.knobs.boolean(label: 'onPressed') ? () {} : null,
    tooltip: context.knobs.stringOrNull(
      label: 'tooltip',
      initialValue: 'Search',
    ),
    badge: context.knobs.objectOrNull.dropdown<AuraBadge>(
      label: 'badge',
      options: [
        .count(count: context.knobs.int.input(label: 'badge - count')),
        .dot(
          variant:
              context.knobs.objectOrNull.dropdown<AuraBadgeVariant>(
                label: 'badge - variant',
                options: AuraBadgeVariant.values,
                labelBuilder: (value) => value.toString(),
              ) ??
              .primary,
        ),
      ],
      labelBuilder: (value) {
        return value.toString();
      },
    ),
  );
}
