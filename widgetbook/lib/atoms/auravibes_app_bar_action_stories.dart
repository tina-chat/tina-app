import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic App Bar Action', type: AuraAppBarAction)
Widget basicAppBarActionUseCase(BuildContext context) {
  return Center(
    child: AuraAppBarAction(icon: Icons.search, onPressed: () {}),
  );
}

@widgetbook.UseCase(name: 'App Bar Action with Tooltip', type: AuraAppBarAction)
Widget appBarActionWithTooltipUseCase(BuildContext context) {
  return Center(
    child: AuraAppBarAction(
      icon: Icons.settings,
      onPressed: () {},
      tooltip: 'Settings',
    ),
  );
}

@widgetbook.UseCase(name: 'App Bar Action with Badge', type: AuraAppBarAction)
Widget appBarActionWithBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraAppBarAction(
      icon: Icons.notifications,
      onPressed: () {},
      badge: AuraBadge.count(count: 3),
      tooltip: 'Notifications',
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar Action with Dot Badge',
  type: AuraAppBarAction,
)
Widget appBarActionWithDotBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraAppBarAction(
      icon: Icons.message,
      onPressed: () {},
      badge: const AuraBadge.dot(variant: AuraBadgeVariant.error),
      tooltip: 'Messages',
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled App Bar Action', type: AuraAppBarAction)
Widget disabledAppBarActionUseCase(BuildContext context) {
  return Center(
    child: AuraAppBarAction(
      icon: Icons.lock,
      onPressed: null,
      tooltip: 'Locked feature',
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar Action with Custom Color',
  type: AuraAppBarAction,
)
Widget appBarActionWithCustomColorUseCase(BuildContext context) {
  return Center(
    child: AuraAppBarAction(
      icon: Icons.favorite,
      onPressed: () {},
      color: Colors.red,
      tooltip: 'Favorite',
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar Action with Semantic Label',
  type: AuraAppBarAction,
)
Widget appBarActionWithSemanticLabelUseCase(BuildContext context) {
  return Center(
    child: AuraAppBarAction(
      icon: Icons.share,
      onPressed: () {},
      semanticLabel: 'Share this content',
      tooltip: 'Share',
    ),
  );
}

@widgetbook.UseCase(name: 'App Bar Actions Row', type: AuraAppBarAction)
Widget appBarActionsRowUseCase(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuraAppBarAction(
          icon: Icons.search,
          onPressed: () {},
          tooltip: 'Search',
        ),
        AuraAppBarAction(
          icon: Icons.filter_list,
          onPressed: () {},
          tooltip: 'Filter',
        ),
        AuraAppBarAction(
          icon: Icons.more_vert,
          onPressed: () {},
          tooltip: 'More options',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'App Bar with Notifications', type: AuraAppBarAction)
Widget appBarWithNotificationsUseCase(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Aura AI Assistant',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        AuraAppBarAction(
          icon: Icons.notifications,
          onPressed: () {},
          badge: AuraBadge.count(count: 5),
          color: Theme.of(context).colorScheme.onPrimary,
          tooltip: 'Notifications',
        ),
        AuraAppBarAction(
          icon: Icons.account_circle,
          onPressed: () {},
          color: Theme.of(context).colorScheme.onPrimary,
          tooltip: 'Profile',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar Actions with Various Badges',
  type: AuraAppBarAction,
)
Widget appBarActionsWithVariousBadgesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuraAppBarAction(
            icon: Icons.message,
            onPressed: () {},
            badge: AuraBadge.count(count: 12),
            tooltip: 'Messages',
          ),
          AuraAppBarAction(
            icon: Icons.notifications,
            onPressed: () {},
            badge: const AuraBadge.dot(),
            tooltip: 'Notifications',
          ),
        ],
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuraAppBarAction(
            icon: Icons.warning,
            onPressed: () {},
            badge: AuraBadge.text(
              variant: AuraBadgeVariant.warning,
              size: AuraBadgeSize.small,
              child: Text('NEW'),
            ),
            tooltip: 'Warnings',
          ),
          AuraAppBarAction(
            icon: Icons.error,
            onPressed: () {},
            badge: const AuraBadge.dot(variant: AuraBadgeVariant.error),
            tooltip: 'Errors',
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'App Bar Action States', type: AuraAppBarAction)
Widget appBarActionStatesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'App Bar Action States',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              AuraAppBarAction(
                icon: Icons.home,
                onPressed: () {},
                tooltip: 'Enabled',
              ),
              const SizedBox(height: 8),
              const Text('Enabled'),
            ],
          ),
          Column(
            children: [
              AuraAppBarAction(
                icon: Icons.home,
                onPressed: null,
                tooltip: 'Disabled',
              ),
              const SizedBox(height: 8),
              const Text('Disabled'),
            ],
          ),
          Column(
            children: [
              AuraAppBarAction(
                icon: Icons.home,
                onPressed: () {},
                badge: const AuraBadge.dot(),
                tooltip: 'With Badge',
              ),
              const SizedBox(height: 8),
              const Text('With Badge'),
            ],
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Common App Bar Icons', type: AuraAppBarAction)
Widget commonAppBarIconsUseCase(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AuraAppBarAction(
          icon: Icons.search,
          onPressed: () {},
          tooltip: 'Search',
        ),
        AuraAppBarAction(
          icon: Icons.filter_list,
          onPressed: () {},
          tooltip: 'Filter',
        ),
        AuraAppBarAction(icon: Icons.sort, onPressed: () {}, tooltip: 'Sort'),
        AuraAppBarAction(
          icon: Icons.refresh,
          onPressed: () {},
          tooltip: 'Refresh',
        ),
        AuraAppBarAction(icon: Icons.share, onPressed: () {}, tooltip: 'Share'),
        AuraAppBarAction(
          icon: Icons.bookmark,
          onPressed: () {},
          tooltip: 'Bookmark',
        ),
        AuraAppBarAction(
          icon: Icons.download,
          onPressed: () {},
          tooltip: 'Download',
        ),
        AuraAppBarAction(icon: Icons.edit, onPressed: () {}, tooltip: 'Edit'),
        AuraAppBarAction(
          icon: Icons.delete,
          onPressed: () {},
          tooltip: 'Delete',
        ),
        AuraAppBarAction(
          icon: Icons.more_vert,
          onPressed: () {},
          tooltip: 'More',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar with High Badge Count',
  type: AuraAppBarAction,
)
Widget appBarWithHighBadgeCountUseCase(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      AuraAppBarAction(
        icon: Icons.message,
        onPressed: () {},
        badge: AuraBadge.count(count: 99),
        tooltip: 'Messages (99)',
      ),
      AuraAppBarAction(
        icon: Icons.notifications,
        onPressed: () {},
        badge: AuraBadge.count(count: 999),
        tooltip: 'Notifications (999+)',
      ),
      AuraAppBarAction(
        icon: Icons.email,
        onPressed: () {},
        badge: AuraBadge.count(count: 1234, maxCount: 999),
        tooltip: 'Emails (1234+)',
      ),
    ],
  );
}
