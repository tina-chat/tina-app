import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Regular FAB', type: TinaFloatingActionButton)
Widget regularFABUseCase(BuildContext context) {
  return Center(
    child: TinaFloatingActionButton(
      onPressed: () {},
      icon: Icons.add,
      size: TinaFABSize.regular,
    ),
  );
}

@widgetbook.UseCase(name: 'Mini FAB', type: TinaFloatingActionButton)
Widget miniFABUseCase(BuildContext context) {
  return Center(
    child: TinaFloatingActionButton(
      onPressed: () {},
      icon: Icons.edit,
      size: TinaFABSize.mini,
    ),
  );
}

@widgetbook.UseCase(name: 'Large FAB', type: TinaFloatingActionButton)
Widget largeFABUseCase(BuildContext context) {
  return Center(
    child: TinaFloatingActionButton(
      onPressed: () {},
      icon: Icons.favorite,
      size: TinaFABSize.large,
    ),
  );
}

@widgetbook.UseCase(name: 'Extended FAB', type: TinaFloatingActionButton)
Widget extendedFABUseCase(BuildContext context) {
  return Center(
    child: TinaFloatingActionButton.extended(
      onPressed: () {},
      icon: Icons.add,
      text: 'Create New',
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors FAB', type: TinaFloatingActionButton)
Widget customColorsFABUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TinaFloatingActionButton(
        onPressed: () {},
        icon: Icons.star,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      const SizedBox(height: 16),
      TinaFloatingActionButton(
        onPressed: () {},
        icon: Icons.favorite,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      const SizedBox(height: 16),
      TinaFloatingActionButton(
        onPressed: () {},
        icon: Icons.thumb_up,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'FAB with Tooltip', type: TinaFloatingActionButton)
Widget fabWithTooltipUseCase(BuildContext context) {
  return Center(
    child: TinaFloatingActionButton(
      onPressed: () {},
      icon: Icons.info,
      tooltip: 'Show information',
      semanticLabel: 'Information button',
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled FAB', type: TinaFloatingActionButton)
Widget disabledFABUseCase(BuildContext context) {
  return Center(
    child: TinaFloatingActionButton(
      onPressed: null,
      icon: Icons.block,
    ),
  );
}

@widgetbook.UseCase(name: 'All FAB Sizes', type: TinaFloatingActionButton)
Widget allFABSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Mini FAB'),
      const SizedBox(height: 8),
      TinaFloatingActionButton(
        onPressed: () {},
        icon: Icons.add,
        size: TinaFABSize.mini,
      ),
      const SizedBox(height: 24),
      const Text('Regular FAB'),
      const SizedBox(height: 8),
      TinaFloatingActionButton(
        onPressed: () {},
        icon: Icons.add,
        size: TinaFABSize.regular,
      ),
      const SizedBox(height: 24),
      const Text('Large FAB'),
      const SizedBox(height: 8),
      TinaFloatingActionButton(
        onPressed: () {},
        icon: Icons.add,
        size: TinaFABSize.large,
      ),
      const SizedBox(height: 24),
      const Text('Extended FAB'),
      const SizedBox(height: 8),
      TinaFloatingActionButton.extended(
        onPressed: () {},
        icon: Icons.add,
        text: 'Add Item',
      ),
    ],
  );
}