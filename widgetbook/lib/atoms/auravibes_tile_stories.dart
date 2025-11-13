import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary Tile', type: AuraTile)
Widget primaryTileUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AuraTile(onTap: () {}, child: const Text('Primary Tile')),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            leading: const Icon(Icons.home),
            child: const Text('Tile with Leading Icon'),
          ),
          const SizedBox(height: 16),
          AuraTile(
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

@widgetbook.UseCase(name: 'Secondary Tile', type: AuraTile)
Widget secondaryTileUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AuraTile(
            onTap: () {},
            variant: AuraTileVariant.secondary,
            child: const Text('Secondary Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            variant: AuraTileVariant.surface,
            child: const Text('Surface Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            variant: AuraTileVariant.outlined,
            child: const Text('Outlined Tile'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Semantic Tiles', type: AuraTile)
Widget semanticTilesUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AuraTile(
            onTap: () {},
            variant: AuraTileVariant.success,
            leading: const Icon(Icons.check_circle),
            child: const Text('Success Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            variant: AuraTileVariant.warning,
            leading: const Icon(Icons.warning),
            child: const Text('Warning Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            variant: AuraTileVariant.error,
            leading: const Icon(Icons.error),
            child: const Text('Error Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            variant: AuraTileVariant.info,
            leading: const Icon(Icons.info),
            child: const Text('Info Tile'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Tile Sizes', type: AuraTile)
Widget tileSizesUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AuraTile(
            onTap: () {},
            size: AuraTileSize.small,
            child: const Text('Small Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            size: AuraTileSize.medium,
            child: const Text('Medium Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            size: AuraTileSize.large,
            child: const Text('Large Tile'),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Tile States', type: AuraTile)
Widget tileStatesUseCase(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AuraTile(onTap: () {}, child: const Text('Enabled Tile')),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            enabled: false,
            child: const Text('Disabled Tile'),
          ),
          const SizedBox(height: 16),
          AuraTile(
            onTap: () {},
            isLoading: true,
            child: const Text('Loading Tile'),
          ),
        ],
      ),
    ),
  );
}
