import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary Tile', type: TinaTile)
Widget primaryTileUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TinaTile(onTap: () {}, child: const Text('Primary Tile')),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            leading: const Icon(Icons.home),
            child: const Text('Tile with Leading Icon'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            trailing: const Icon(Icons.arrow_forward),
            child: const Text('Tile with Leading and Trailing'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary Tile', type: TinaTile)
Widget secondaryTileUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TinaTile(
            onTap: () {},
            variant: TinaTileVariant.secondary,
            child: const Text('Secondary Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            variant: TinaTileVariant.surface,
            child: const Text('Surface Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            variant: TinaTileVariant.outlined,
            child: const Text('Outlined Tile'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Semantic Tiles', type: TinaTile)
Widget semanticTilesUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TinaTile(
            onTap: () {},
            variant: TinaTileVariant.success,
            leading: const Icon(Icons.check_circle),
            child: const Text('Success Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            variant: TinaTileVariant.warning,
            leading: const Icon(Icons.warning),
            child: const Text('Warning Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            variant: TinaTileVariant.error,
            leading: const Icon(Icons.error),
            child: const Text('Error Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            variant: TinaTileVariant.info,
            leading: const Icon(Icons.info),
            child: const Text('Info Tile'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Tile Sizes', type: TinaTile)
Widget tileSizesUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TinaTile(
            onTap: () {},
            size: TinaTileSize.small,
            child: const Text('Small Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            size: TinaTileSize.medium,
            child: const Text('Medium Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            size: TinaTileSize.large,
            child: const Text('Large Tile'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Tile States', type: TinaTile)
Widget tileStatesUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TinaTile(onTap: () {}, child: const Text('Enabled Tile')),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            enabled: false,
            child: const Text('Disabled Tile'),
          ),
          const SizedBox(height: 16),
          TinaTile(
            onTap: () {},
            isLoading: true,
            child: const Text('Loading Tile'),
          ),
        ],
      ),
    ),
  );
}
