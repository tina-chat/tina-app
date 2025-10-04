import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Text Badge', type: TinaBadge)
Widget textBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaBadge.text(
      text: 'Badge',
      variant: TinaBadgeVariant.primary,
      size: TinaBadgeSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Count Badge', type: TinaBadge)
Widget countBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaBadge.count(
      count: 42,
      variant: TinaBadgeVariant.primary,
      size: TinaBadgeSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'High Count Badge', type: TinaBadge)
Widget highCountBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaBadge.count(
      count: 150,
      variant: TinaBadgeVariant.primary,
      size: TinaBadgeSize.medium,
      maxCount: 99,
    ),
  );
}

@widgetbook.UseCase(name: 'Dot Badge', type: TinaBadge)
Widget dotBadgeUseCase(BuildContext context) {
  return Center(child: TinaBadge.dot(variant: TinaBadgeVariant.error));
}

@widgetbook.UseCase(name: 'Badge Variants', type: TinaBadge)
Widget badgeVariantsUseCase(BuildContext context) {
  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: [
      TinaBadge.text(text: 'Primary', variant: TinaBadgeVariant.primary),
      TinaBadge.text(text: 'Secondary', variant: TinaBadgeVariant.secondary),
      TinaBadge.text(text: 'Success', variant: TinaBadgeVariant.success),
      TinaBadge.text(text: 'Warning', variant: TinaBadgeVariant.warning),
      TinaBadge.text(text: 'Error', variant: TinaBadgeVariant.error),
      TinaBadge.text(text: 'Info', variant: TinaBadgeVariant.info),
      TinaBadge.text(text: 'Neutral', variant: TinaBadgeVariant.neutral),
      TinaBadge.text(text: 'Outlined', variant: TinaBadgeVariant.outlined),
      TinaBadge.text(text: 'Soft', variant: TinaBadgeVariant.soft),
    ],
  );
}

@widgetbook.UseCase(name: 'Badge Sizes', type: TinaBadge)
Widget badgeSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TinaBadge.text(text: 'Small', size: TinaBadgeSize.small),
      const SizedBox(height: 16),
      TinaBadge.text(text: 'Medium', size: TinaBadgeSize.medium),
      const SizedBox(height: 16),
      TinaBadge.text(text: 'Large', size: TinaBadgeSize.large),
    ],
  );
}

@widgetbook.UseCase(name: 'Success Badges', type: TinaBadge)
Widget successBadgesUseCase(BuildContext context) {
  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: [
      TinaBadge.text(text: 'Active', variant: TinaBadgeVariant.success),
      TinaBadge.text(text: 'Verified', variant: TinaBadgeVariant.success),
      TinaBadge.text(text: 'Online', variant: TinaBadgeVariant.success),
      TinaBadge.dot(variant: TinaBadgeVariant.success),
    ],
  );
}

@widgetbook.UseCase(name: 'Error Badges', type: TinaBadge)
Widget errorBadgesUseCase(BuildContext context) {
  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: [
      TinaBadge.text(text: 'Error', variant: TinaBadgeVariant.error),
      TinaBadge.text(text: 'Failed', variant: TinaBadgeVariant.error),
      TinaBadge.count(count: 3, variant: TinaBadgeVariant.error),
      TinaBadge.dot(variant: TinaBadgeVariant.error),
    ],
  );
}

@widgetbook.UseCase(name: 'Positioned Badge', type: TinaPositionedBadge)
Widget positionedBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaPositionedBadge(
      position: TinaBadgePosition.topRight,
      badge: TinaBadge.count(count: 5, variant: TinaBadgeVariant.error),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.notifications, size: 32),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Positioned Badge Corners', type: TinaPositionedBadge)
Widget positionedBadgeCornersUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TinaPositionedBadge(
            position: TinaBadgePosition.topLeft,
            badge: TinaBadge.text(text: 'TL', size: TinaBadgeSize.small),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          TinaPositionedBadge(
            position: TinaBadgePosition.topRight,
            badge: TinaBadge.text(text: 'TR', size: TinaBadgeSize.small),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 32),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TinaPositionedBadge(
            position: TinaBadgePosition.bottomLeft,
            badge: TinaBadge.text(text: 'BL', size: TinaBadgeSize.small),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          TinaPositionedBadge(
            position: TinaBadgePosition.bottomRight,
            badge: TinaBadge.text(text: 'BR', size: TinaBadgeSize.small),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Custom Content Badge', type: TinaBadge)
Widget customContentBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaBadge(
      variant: TinaBadgeVariant.primary,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.star, size: 16, color: Colors.white),
          SizedBox(width: 4),
          Text('Premium', style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    ),
  );
}
