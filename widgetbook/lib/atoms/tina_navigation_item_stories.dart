import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Active Navigation Item', type: TinaNavigationItem)
Widget activeNavigationItemUseCase(BuildContext context) {
  return Center(
    child: TinaNavigationItem(
      icon: Icons.home,
      text: 'Home',
      isActive: true,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Inactive Navigation Item', type: TinaNavigationItem)
Widget inactiveNavigationItemUseCase(BuildContext context) {
  return Center(
    child: TinaNavigationItem(
      icon: Icons.settings,
      text: 'Settings',
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Only Navigation Item', type: TinaNavigationItem)
Widget iconOnlyNavigationItemUseCase(BuildContext context) {
  return Center(
    child: TinaNavigationItem(
      icon: Icons.notifications,
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Text Only Navigation Item', type: TinaNavigationItem)
Widget textOnlyNavigationItemUseCase(BuildContext context) {
  return Center(
    child: TinaNavigationItem(text: 'Profile', isActive: false, onTap: () {}),
  );
}

@widgetbook.UseCase(
  name: 'Navigation Item with Badge',
  type: TinaNavigationItem,
)
Widget navigationItemWithBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaNavigationItem(
      icon: Icons.message,
      text: 'Messages',
      badge: TinaBadge.count(count: 5),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Navigation Item with Dot Badge',
  type: TinaNavigationItem,
)
Widget navigationItemWithDotBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaNavigationItem(
      icon: Icons.notifications,
      text: 'Notifications',
      badge: const TinaBadge.dot(),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Navigation Item', type: TinaNavigationItem)
Widget disabledNavigationItemUseCase(BuildContext context) {
  return Center(
    child: TinaNavigationItem(
      icon: Icons.lock,
      text: 'Locked',
      isActive: false,
      onTap: null,
    ),
  );
}

@widgetbook.UseCase(name: 'Navigation Item Sizes', type: TinaNavigationItem)
Widget navigationItemSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TinaNavigationItem(
        icon: Icons.home,
        text: 'Compact',
        size: TinaNavigationItemSize.compact,
        isActive: false,
        onTap: () {},
      ),
      const SizedBox(height: 16),
      TinaNavigationItem(
        icon: Icons.home,
        text: 'Normal',
        size: TinaNavigationItemSize.normal,
        isActive: false,
        onTap: () {},
      ),
      const SizedBox(height: 16),
      TinaNavigationItem(
        icon: Icons.home,
        text: 'Expanded',
        size: TinaNavigationItemSize.expanded,
        isActive: false,
        onTap: () {},
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Navigation Item States Comparison',
  type: TinaNavigationItem,
)
Widget navigationItemStatesComparisonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TinaNavigationItem(
            icon: Icons.home,
            text: 'Active',
            isActive: true,
            onTap: () {},
          ),
          TinaNavigationItem(
            icon: Icons.home,
            text: 'Inactive',
            isActive: false,
            onTap: () {},
          ),
          TinaNavigationItem(
            icon: Icons.home,
            text: 'Disabled',
            isActive: false,
            onTap: null,
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Navigation Bar Example', type: TinaNavigationItem)
Widget navigationBarExampleUseCase(BuildContext context) {
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TinaNavigationItem(
          icon: Icons.home,
          text: 'Home',
          isActive: true,
          onTap: () {},
        ),
        TinaNavigationItem(
          icon: Icons.search,
          text: 'Search',
          isActive: false,
          onTap: () {},
        ),
        TinaNavigationItem(
          icon: Icons.favorite,
          text: 'Favorites',
          badge: TinaBadge.count(count: 3),
          isActive: false,
          onTap: () {},
        ),
        TinaNavigationItem(
          icon: Icons.person,
          text: 'Profile',
          isActive: false,
          onTap: () {},
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Compact Navigation Rail', type: TinaNavigationItem)
Widget compactNavigationRailUseCase(BuildContext context) {
  return Container(
    width: 80,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TinaNavigationItem(
          icon: Icons.dashboard,
          size: TinaNavigationItemSize.compact,
          isActive: true,
          onTap: () {},
          semanticLabel: 'Dashboard',
        ),
        const SizedBox(height: 8),
        TinaNavigationItem(
          icon: Icons.analytics,
          size: TinaNavigationItemSize.compact,
          isActive: false,
          onTap: () {},
          semanticLabel: 'Analytics',
        ),
        const SizedBox(height: 8),
        TinaNavigationItem(
          icon: Icons.notifications,
          size: TinaNavigationItemSize.compact,
          badge: const TinaBadge.dot(variant: TinaBadgeVariant.error),
          isActive: false,
          onTap: () {},
          semanticLabel: 'Notifications',
        ),
        const SizedBox(height: 8),
        TinaNavigationItem(
          icon: Icons.settings,
          size: TinaNavigationItemSize.compact,
          isActive: false,
          onTap: () {},
          semanticLabel: 'Settings',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Expanded Navigation Drawer',
  type: TinaNavigationItem,
)
Widget expandedNavigationDrawerUseCase(BuildContext context) {
  return Container(
    width: 280,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TinaNavigationItem(
          icon: Icons.dashboard,
          text: 'Dashboard',
          size: TinaNavigationItemSize.expanded,
          isActive: true,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        TinaNavigationItem(
          icon: Icons.people,
          text: 'Team Members',
          size: TinaNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        TinaNavigationItem(
          icon: Icons.folder,
          text: 'Projects',
          badge: TinaBadge.count(count: 12),
          size: TinaNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        TinaNavigationItem(
          icon: Icons.calendar_today,
          text: 'Calendar',
          size: TinaNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        TinaNavigationItem(
          icon: Icons.help_outline,
          text: 'Help & Support',
          size: TinaNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
      ],
    ),
  );
}
