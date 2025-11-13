import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Active Navigation Item', type: AuraNavigationItem)
Widget activeNavigationItemUseCase(BuildContext context) {
  return Center(
    child: AuraNavigationItem(
      icon: Icons.home,
      text: 'Home',
      isActive: true,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Inactive Navigation Item', type: AuraNavigationItem)
Widget inactiveNavigationItemUseCase(BuildContext context) {
  return Center(
    child: AuraNavigationItem(
      icon: Icons.settings,
      text: 'Settings',
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Only Navigation Item', type: AuraNavigationItem)
Widget iconOnlyNavigationItemUseCase(BuildContext context) {
  return Center(
    child: AuraNavigationItem(
      icon: Icons.notifications,
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Text Only Navigation Item', type: AuraNavigationItem)
Widget textOnlyNavigationItemUseCase(BuildContext context) {
  return Center(
    child: AuraNavigationItem(text: 'Profile', isActive: false, onTap: () {}),
  );
}

@widgetbook.UseCase(
  name: 'Navigation Item with Badge',
  type: AuraNavigationItem,
)
Widget navigationItemWithBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraNavigationItem(
      icon: Icons.message,
      text: 'Messages',
      badge: AuraBadge.count(count: 5),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Navigation Item with Dot Badge',
  type: AuraNavigationItem,
)
Widget navigationItemWithDotBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraNavigationItem(
      icon: Icons.notifications,
      text: 'Notifications',
      badge: const AuraBadge.dot(),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Navigation Item', type: AuraNavigationItem)
Widget disabledNavigationItemUseCase(BuildContext context) {
  return Center(
    child: AuraNavigationItem(
      icon: Icons.lock,
      text: 'Locked',
      isActive: false,
      onTap: null,
    ),
  );
}

@widgetbook.UseCase(name: 'Navigation Item Sizes', type: AuraNavigationItem)
Widget navigationItemSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AuraNavigationItem(
        icon: Icons.home,
        text: 'Compact',
        size: AuraNavigationItemSize.compact,
        isActive: false,
        onTap: () {},
      ),
      const SizedBox(height: 16),
      AuraNavigationItem(
        icon: Icons.home,
        text: 'Normal',
        size: AuraNavigationItemSize.normal,
        isActive: false,
        onTap: () {},
      ),
      const SizedBox(height: 16),
      AuraNavigationItem(
        icon: Icons.home,
        text: 'Expanded',
        size: AuraNavigationItemSize.expanded,
        isActive: false,
        onTap: () {},
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Navigation Item States Comparison',
  type: AuraNavigationItem,
)
Widget navigationItemStatesComparisonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuraNavigationItem(
            icon: Icons.home,
            text: 'Active',
            isActive: true,
            onTap: () {},
          ),
          AuraNavigationItem(
            icon: Icons.home,
            text: 'Inactive',
            isActive: false,
            onTap: () {},
          ),
          AuraNavigationItem(
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

@widgetbook.UseCase(name: 'Navigation Bar Example', type: AuraNavigationItem)
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
        AuraNavigationItem(
          icon: Icons.home,
          text: 'Home',
          isActive: true,
          onTap: () {},
        ),
        AuraNavigationItem(
          icon: Icons.search,
          text: 'Search',
          isActive: false,
          onTap: () {},
        ),
        AuraNavigationItem(
          icon: Icons.favorite,
          text: 'Favorites',
          badge: AuraBadge.count(count: 3),
          isActive: false,
          onTap: () {},
        ),
        AuraNavigationItem(
          icon: Icons.person,
          text: 'Profile',
          isActive: false,
          onTap: () {},
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Compact Navigation Rail', type: AuraNavigationItem)
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
        AuraNavigationItem(
          icon: Icons.dashboard,
          size: AuraNavigationItemSize.compact,
          isActive: true,
          onTap: () {},
          semanticLabel: 'Dashboard',
        ),
        const SizedBox(height: 8),
        AuraNavigationItem(
          icon: Icons.analytics,
          size: AuraNavigationItemSize.compact,
          isActive: false,
          onTap: () {},
          semanticLabel: 'Analytics',
        ),
        const SizedBox(height: 8),
        AuraNavigationItem(
          icon: Icons.notifications,
          size: AuraNavigationItemSize.compact,
          badge: const AuraBadge.dot(variant: AuraBadgeVariant.error),
          isActive: false,
          onTap: () {},
          semanticLabel: 'Notifications',
        ),
        const SizedBox(height: 8),
        AuraNavigationItem(
          icon: Icons.settings,
          size: AuraNavigationItemSize.compact,
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
  type: AuraNavigationItem,
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
        AuraNavigationItem(
          icon: Icons.dashboard,
          text: 'Dashboard',
          size: AuraNavigationItemSize.expanded,
          isActive: true,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        AuraNavigationItem(
          icon: Icons.people,
          text: 'Team Members',
          size: AuraNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        AuraNavigationItem(
          icon: Icons.folder,
          text: 'Projects',
          badge: AuraBadge.count(count: 12),
          size: AuraNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        AuraNavigationItem(
          icon: Icons.calendar_today,
          text: 'Calendar',
          size: AuraNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        AuraNavigationItem(
          icon: Icons.help_outline,
          text: 'Help & Support',
          size: AuraNavigationItemSize.expanded,
          isActive: false,
          onTap: () {},
        ),
      ],
    ),
  );
}
