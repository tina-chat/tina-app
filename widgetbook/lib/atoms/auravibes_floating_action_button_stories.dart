import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Regular FAB', type: AuraFloatingActionButton)
Widget regularFABUseCase(BuildContext context) {
  return Center(
    child: AuraFloatingActionButton(
      onPressed: () {},
      icon: Icons.add,
      size: AuraFABSize.regular,
    ),
  );
}

@widgetbook.UseCase(name: 'Mini FAB', type: AuraFloatingActionButton)
Widget miniFABUseCase(BuildContext context) {
  return Center(
    child: AuraFloatingActionButton(
      onPressed: () {},
      icon: Icons.edit,
      size: AuraFABSize.mini,
    ),
  );
}

@widgetbook.UseCase(name: 'Large FAB', type: AuraFloatingActionButton)
Widget largeFABUseCase(BuildContext context) {
  return Center(
    child: AuraFloatingActionButton(
      onPressed: () {},
      icon: Icons.favorite,
      size: AuraFABSize.large,
    ),
  );
}

@widgetbook.UseCase(name: 'Extended FAB', type: AuraFloatingActionButton)
Widget extendedFABUseCase(BuildContext context) {
  return Center(
    child: AuraFloatingActionButton.extended(
      onPressed: () {},
      icon: Icons.add,
      text: 'Create New',
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors FAB', type: AuraFloatingActionButton)
Widget customColorsFABUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AuraFloatingActionButton(
        onPressed: () {},
        icon: Icons.star,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      const SizedBox(height: 16),
      AuraFloatingActionButton(
        onPressed: () {},
        icon: Icons.favorite,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      const SizedBox(height: 16),
      AuraFloatingActionButton(
        onPressed: () {},
        icon: Icons.thumb_up,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'FAB with Tooltip', type: AuraFloatingActionButton)
Widget fabWithTooltipUseCase(BuildContext context) {
  return Center(
    child: AuraFloatingActionButton(
      onPressed: () {},
      icon: Icons.info,
      tooltip: 'Show information',
      semanticLabel: 'Information button',
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled FAB', type: AuraFloatingActionButton)
Widget disabledFABUseCase(BuildContext context) {
  return Center(
    child: AuraFloatingActionButton(onPressed: null, icon: Icons.block),
  );
}

@widgetbook.UseCase(name: 'All FAB Sizes', type: AuraFloatingActionButton)
Widget allFABSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Mini FAB'),
      const SizedBox(height: 8),
      AuraFloatingActionButton(
        onPressed: () {},
        icon: Icons.add,
        size: AuraFABSize.mini,
      ),
      const SizedBox(height: 24),
      const Text('Regular FAB'),
      const SizedBox(height: 8),
      AuraFloatingActionButton(
        onPressed: () {},
        icon: Icons.add,
        size: AuraFABSize.regular,
      ),
      const SizedBox(height: 24),
      const Text('Large FAB'),
      const SizedBox(height: 8),
      AuraFloatingActionButton(
        onPressed: () {},
        icon: Icons.add,
        size: AuraFABSize.large,
      ),
      const SizedBox(height: 24),
      const Text('Extended FAB'),
      const SizedBox(height: 8),
      AuraFloatingActionButton.extended(
        onPressed: () {},
        icon: Icons.add,
        text: 'Add Item',
      ),
    ],
  );
}
