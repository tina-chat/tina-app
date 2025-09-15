import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary Button', type: TinaButton)
Widget primaryButtonUseCase(BuildContext context) {
  return Center(
    child: TinaButton(
      onPressed: () {},
      variant: TinaButtonVariant.primary,
      size: TinaButtonSize.medium,
      child: const Text('Primary Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary Button', type: TinaButton)
Widget secondaryButtonUseCase(BuildContext context) {
  return Center(
    child: TinaButton(
      onPressed: () {},
      variant: TinaButtonVariant.secondary,
      size: TinaButtonSize.medium,
      child: const Text('Secondary Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Outlined Button', type: TinaButton)
Widget outlinedButtonUseCase(BuildContext context) {
  return Center(
    child: TinaButton(
      onPressed: () {},
      variant: TinaButtonVariant.outlined,
      size: TinaButtonSize.medium,
      child: const Text('Outlined Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Ghost Button', type: TinaButton)
Widget ghostButtonUseCase(BuildContext context) {
  return Center(
    child: TinaButton(
      onPressed: () {},
      variant: TinaButtonVariant.ghost,
      size: TinaButtonSize.medium,
      child: const Text('Ghost Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Elevated Button', type: TinaButton)
Widget elevatedButtonUseCase(BuildContext context) {
  return Center(
    child: TinaButton(
      onPressed: () {},
      variant: TinaButtonVariant.elevated,
      size: TinaButtonSize.medium,
      child: const Text('Elevated Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Loading Button', type: TinaButton)
Widget loadingButtonUseCase(BuildContext context) {
  return Center(
    child: TinaButton(
      onPressed: () {},
      variant: TinaButtonVariant.primary,
      size: TinaButtonSize.medium,
      isLoading: true,
      child: const Text('Loading...'),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Button', type: TinaButton)
Widget disabledButtonUseCase(BuildContext context) {
  return Center(
    child: TinaButton(
      onPressed: null,
      variant: TinaButtonVariant.primary,
      size: TinaButtonSize.medium,
      child: const Text('Disabled Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Button Sizes', type: TinaButton)
Widget buttonSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TinaButton(
        onPressed: () {},
        variant: TinaButtonVariant.primary,
        size: TinaButtonSize.small,
        child: const Text('Small Button'),
      ),
      const SizedBox(height: 16),
      TinaButton(
        onPressed: () {},
        variant: TinaButtonVariant.primary,
        size: TinaButtonSize.medium,
        child: const Text('Medium Button'),
      ),
      const SizedBox(height: 16),
      TinaButton(
        onPressed: () {},
        variant: TinaButtonVariant.primary,
        size: TinaButtonSize.large,
        child: const Text('Large Button'),
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Full Width Button', type: TinaButton)
Widget fullWidthButtonUseCase(BuildContext context) {
  return TinaButton(
    onPressed: () {},
    variant: TinaButtonVariant.primary,
    size: TinaButtonSize.medium,
    isFullWidth: true,
    child: const Text('Full Width Button'),
  );
}
