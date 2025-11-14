import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Text Badge', type: AuraBadge)
Widget textBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraBadge.text(
      variant: AuraBadgeVariant.primary,
      size: AuraBadgeSize.medium,
      child: Text('Badge'),
    ),
  );
}

@widgetbook.UseCase(name: 'Count Badge', type: AuraBadge)
Widget countBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraBadge.count(
      count: 42,
      variant: AuraBadgeVariant.primary,
      size: AuraBadgeSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'High Count Badge', type: AuraBadge)
Widget highCountBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraBadge.count(
      count: 150,
      variant: AuraBadgeVariant.primary,
      size: AuraBadgeSize.medium,
      maxCount: 99,
    ),
  );
}

@widgetbook.UseCase(name: 'Dot Badge', type: AuraBadge)
Widget dotBadgeUseCase(BuildContext context) {
  return Center(child: AuraBadge.dot(variant: AuraBadgeVariant.error));
}

@widgetbook.UseCase(name: 'Badge Variants', type: AuraBadge)
Widget badgeVariantsUseCase(BuildContext context) {
  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: [
      AuraBadge.text(variant: AuraBadgeVariant.primary, child: Text('Primary')),
      AuraBadge.text(
        variant: AuraBadgeVariant.secondary,
        child: Text('Secondary'),
      ),
      AuraBadge.text(variant: AuraBadgeVariant.success, child: Text('Success')),
      AuraBadge.text(variant: AuraBadgeVariant.warning, child: Text('Warning')),
      AuraBadge.text(variant: AuraBadgeVariant.error, child: Text('Error')),
      AuraBadge.text(variant: AuraBadgeVariant.info, child: Text('Info')),
      AuraBadge.text(variant: AuraBadgeVariant.neutral, child: Text('Neutral')),
      AuraBadge.text(
        variant: AuraBadgeVariant.outlined,
        child: Text('Outlined'),
      ),
      AuraBadge.text(variant: AuraBadgeVariant.soft, child: Text('Soft')),
    ],
  );
}

@widgetbook.UseCase(name: 'Badge Sizes', type: AuraBadge)
Widget badgeSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AuraBadge.text(size: AuraBadgeSize.small, child: Text('Small')),
      const SizedBox(height: 16),
      AuraBadge.text(size: AuraBadgeSize.medium, child: Text('Medium')),
      const SizedBox(height: 16),
      AuraBadge.text(size: AuraBadgeSize.large, child: Text('Large')),
    ],
  );
}

@widgetbook.UseCase(name: 'Success Badges', type: AuraBadge)
Widget successBadgesUseCase(BuildContext context) {
  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: [
      AuraBadge.text(variant: AuraBadgeVariant.success, child: Text('Active')),
      AuraBadge.text(
        variant: AuraBadgeVariant.success,
        child: Text('Verified'),
      ),
      AuraBadge.text(variant: AuraBadgeVariant.success, child: Text('Online')),
      AuraBadge.dot(variant: AuraBadgeVariant.success),
    ],
  );
}

@widgetbook.UseCase(name: 'Error Badges', type: AuraBadge)
Widget errorBadgesUseCase(BuildContext context) {
  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: [
      AuraBadge.text(variant: AuraBadgeVariant.error, child: Text('Error')),
      AuraBadge.text(variant: AuraBadgeVariant.error, child: Text('Failed')),
      AuraBadge.count(count: 3, variant: AuraBadgeVariant.error),
      AuraBadge.dot(variant: AuraBadgeVariant.error),
    ],
  );
}

@widgetbook.UseCase(name: 'Positioned Badge', type: AuraPositionedBadge)
Widget positionedBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraPositionedBadge(
      position: AuraBadgePosition.topRight,
      badge: AuraBadge.count(count: 5, variant: AuraBadgeVariant.error),
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

@widgetbook.UseCase(name: 'Positioned Badge Corners', type: AuraPositionedBadge)
Widget positionedBadgeCornersUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuraPositionedBadge(
            position: AuraBadgePosition.topLeft,
            badge: AuraBadge.text(size: AuraBadgeSize.small, child: Text('TL')),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          AuraPositionedBadge(
            position: AuraBadgePosition.topRight,
            badge: AuraBadge.text(size: AuraBadgeSize.small, child: Text('TR')),
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
          AuraPositionedBadge(
            position: AuraBadgePosition.bottomLeft,
            badge: AuraBadge.text(size: AuraBadgeSize.small, child: Text('BL')),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          AuraPositionedBadge(
            position: AuraBadgePosition.bottomRight,
            badge: AuraBadge.text(size: AuraBadgeSize.small, child: Text('BR')),
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

@widgetbook.UseCase(name: 'Custom Content Badge', type: AuraBadge)
Widget customContentBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraBadge(
      variant: AuraBadgeVariant.primary,
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
