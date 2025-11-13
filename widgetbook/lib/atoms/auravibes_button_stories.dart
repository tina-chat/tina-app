import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary Button', type: AuraButton)
Widget primaryButtonUseCase(BuildContext context) {
  return Center(
    child: AuraButton(
      onPressed: () {},
      variant: AuraButtonVariant.primary,
      size: AuraButtonSize.medium,
      child: const Text('Primary Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary Button', type: AuraButton)
Widget secondaryButtonUseCase(BuildContext context) {
  return Center(
    child: AuraButton(
      onPressed: () {},
      variant: AuraButtonVariant.secondary,
      size: AuraButtonSize.medium,
      child: const Text('Secondary Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Outlined Button', type: AuraButton)
Widget outlinedButtonUseCase(BuildContext context) {
  return Center(
    child: AuraButton(
      onPressed: () {},
      variant: AuraButtonVariant.outlined,
      size: AuraButtonSize.medium,
      child: const Text('Outlined Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Ghost Button', type: AuraButton)
Widget ghostButtonUseCase(BuildContext context) {
  return Center(
    child: AuraButton(
      onPressed: () {},
      variant: AuraButtonVariant.ghost,
      size: AuraButtonSize.medium,
      child: const Text('Ghost Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Elevated Button', type: AuraButton)
Widget elevatedButtonUseCase(BuildContext context) {
  return Center(
    child: AuraButton(
      onPressed: () {},
      variant: AuraButtonVariant.elevated,
      size: AuraButtonSize.medium,
      child: const Text('Elevated Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Loading Button', type: AuraButton)
Widget loadingButtonUseCase(BuildContext context) {
  return Center(
    child: AuraButton(
      onPressed: () {},
      variant: AuraButtonVariant.primary,
      size: AuraButtonSize.medium,
      isLoading: true,
      child: const Text('Loading...'),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Button', type: AuraButton)
Widget disabledButtonUseCase(BuildContext context) {
  return Center(
    child: AuraButton(
      onPressed: null,
      variant: AuraButtonVariant.primary,
      size: AuraButtonSize.medium,
      child: const Text('Disabled Button'),
    ),
  );
}

@widgetbook.UseCase(name: 'Button Sizes', type: AuraButton)
Widget buttonSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AuraButton(
        onPressed: () {},
        variant: AuraButtonVariant.primary,
        size: AuraButtonSize.small,
        child: const Text('Small Button'),
      ),
      const SizedBox(height: 16),
      AuraButton(
        onPressed: () {},
        variant: AuraButtonVariant.primary,
        size: AuraButtonSize.medium,
        child: const Text('Medium Button'),
      ),
      const SizedBox(height: 16),
      AuraButton(
        onPressed: () {},
        variant: AuraButtonVariant.primary,
        size: AuraButtonSize.large,
        child: const Text('Large Button'),
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Full Width Button', type: AuraButton)
Widget fullWidthButtonUseCase(BuildContext context) {
  return AuraButton(
    onPressed: () {},
    variant: AuraButtonVariant.primary,
    size: AuraButtonSize.medium,
    isFullWidth: true,
    child: const Text('Full Width Button'),
  );
}
