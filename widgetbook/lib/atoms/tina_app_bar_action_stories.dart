import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic App Bar Action', type: TinaAppBarAction)
Widget basicAppBarActionUseCase(BuildContext context) {
  return Center(
    child: TinaAppBarAction(icon: Icons.search, onPressed: () {}),
  );
}

@widgetbook.UseCase(name: 'App Bar Action with Tooltip', type: TinaAppBarAction)
Widget appBarActionWithTooltipUseCase(BuildContext context) {
  return Center(
    child: TinaAppBarAction(
      icon: Icons.settings,
      onPressed: () {},
      tooltip: 'Settings',
    ),
  );
}

@widgetbook.UseCase(name: 'App Bar Action with Badge', type: TinaAppBarAction)
Widget appBarActionWithBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaAppBarAction(
      icon: Icons.notifications,
      onPressed: () {},
      badge: TinaBadge.count(count: 3),
      tooltip: 'Notifications',
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar Action with Dot Badge',
  type: TinaAppBarAction,
)
Widget appBarActionWithDotBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaAppBarAction(
      icon: Icons.message,
      onPressed: () {},
      badge: const TinaBadge.dot(variant: TinaBadgeVariant.error),
      tooltip: 'Messages',
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled App Bar Action', type: TinaAppBarAction)
Widget disabledAppBarActionUseCase(BuildContext context) {
  return Center(
    child: TinaAppBarAction(
      icon: Icons.lock,
      onPressed: null,
      tooltip: 'Locked feature',
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar Action with Custom Color',
  type: TinaAppBarAction,
)
Widget appBarActionWithCustomColorUseCase(BuildContext context) {
  return Center(
    child: TinaAppBarAction(
      icon: Icons.favorite,
      onPressed: () {},
      color: Colors.red,
      tooltip: 'Favorite',
    ),
  );
}

@widgetbook.UseCase(
  name: 'App Bar Action with Semantic Label',
  type: TinaAppBarAction,
)
Widget appBarActionWithSemanticLabelUseCase(BuildContext context) {
  return Center(
    child: TinaAppBarAction(
      icon: Icons.share,
      onPressed: () {},
      semanticLabel: 'Share this content',
      tooltip: 'Share',
    ),
  );
}

@widgetbook.UseCase(name: 'App Bar Actions Row', type: TinaAppBarAction)
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
        TinaAppBarAction(
          icon: Icons.search,
          onPressed: () {},
          tooltip: 'Search',
        ),
        TinaAppBarAction(
          icon: Icons.filter_list,
          onPressed: () {},
          tooltip: 'Filter',
        ),
        TinaAppBarAction(
          icon: Icons.more_vert,
          onPressed: () {},
          tooltip: 'More options',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'App Bar with Notifications', type: TinaAppBarAction)
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
          'Tina AI Assistant',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        TinaAppBarAction(
          icon: Icons.notifications,
          onPressed: () {},
          badge: TinaBadge.count(count: 5),
          color: Theme.of(context).colorScheme.onPrimary,
          tooltip: 'Notifications',
        ),
        TinaAppBarAction(
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
  type: TinaAppBarAction,
)
Widget appBarActionsWithVariousBadgesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TinaAppBarAction(
            icon: Icons.message,
            onPressed: () {},
            badge: TinaBadge.count(count: 12),
            tooltip: 'Messages',
          ),
          TinaAppBarAction(
            icon: Icons.notifications,
            onPressed: () {},
            badge: const TinaBadge.dot(),
            tooltip: 'Notifications',
          ),
        ],
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TinaAppBarAction(
            icon: Icons.warning,
            onPressed: () {},
            badge: TinaBadge.text(
              text: 'NEW',
              variant: TinaBadgeVariant.warning,
              size: TinaBadgeSize.small,
            ),
            tooltip: 'Warnings',
          ),
          TinaAppBarAction(
            icon: Icons.error,
            onPressed: () {},
            badge: const TinaBadge.dot(variant: TinaBadgeVariant.error),
            tooltip: 'Errors',
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'App Bar Action States', type: TinaAppBarAction)
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
              TinaAppBarAction(
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
              TinaAppBarAction(
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
              TinaAppBarAction(
                icon: Icons.home,
                onPressed: () {},
                badge: const TinaBadge.dot(),
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

@widgetbook.UseCase(name: 'Common App Bar Icons', type: TinaAppBarAction)
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
        TinaAppBarAction(
          icon: Icons.search,
          onPressed: () {},
          tooltip: 'Search',
        ),
        TinaAppBarAction(
          icon: Icons.filter_list,
          onPressed: () {},
          tooltip: 'Filter',
        ),
        TinaAppBarAction(icon: Icons.sort, onPressed: () {}, tooltip: 'Sort'),
        TinaAppBarAction(
          icon: Icons.refresh,
          onPressed: () {},
          tooltip: 'Refresh',
        ),
        TinaAppBarAction(icon: Icons.share, onPressed: () {}, tooltip: 'Share'),
        TinaAppBarAction(
          icon: Icons.bookmark,
          onPressed: () {},
          tooltip: 'Bookmark',
        ),
        TinaAppBarAction(
          icon: Icons.download,
          onPressed: () {},
          tooltip: 'Download',
        ),
        TinaAppBarAction(icon: Icons.edit, onPressed: () {}, tooltip: 'Edit'),
        TinaAppBarAction(
          icon: Icons.delete,
          onPressed: () {},
          tooltip: 'Delete',
        ),
        TinaAppBarAction(
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
  type: TinaAppBarAction,
)
Widget appBarWithHighBadgeCountUseCase(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TinaAppBarAction(
        icon: Icons.message,
        onPressed: () {},
        badge: TinaBadge.count(count: 99),
        tooltip: 'Messages (99)',
      ),
      TinaAppBarAction(
        icon: Icons.notifications,
        onPressed: () {},
        badge: TinaBadge.count(count: 999),
        tooltip: 'Notifications (999+)',
      ),
      TinaAppBarAction(
        icon: Icons.email,
        onPressed: () {},
        badge: TinaBadge.count(count: 1234, maxCount: 999),
        tooltip: 'Emails (1234+)',
      ),
    ],
  );
}
