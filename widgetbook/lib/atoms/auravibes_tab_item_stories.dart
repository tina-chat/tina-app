import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Active Tab Item', type: AuraTabItem)
Widget activeTabItemUseCase(BuildContext context) {
  return Center(
    child: AuraTabItem(
      icon: Icons.home,
      text: 'Home',
      isActive: true,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Inactive Tab Item', type: AuraTabItem)
Widget inactiveTabItemUseCase(BuildContext context) {
  return Center(
    child: AuraTabItem(
      icon: Icons.settings,
      text: 'Settings',
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Only Tab Item', type: AuraTabItem)
Widget iconOnlyTabItemUseCase(BuildContext context) {
  return Center(
    child: AuraTabItem(
      icon: Icons.notifications,
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Text Only Tab Item', type: AuraTabItem)
Widget textOnlyTabItemUseCase(BuildContext context) {
  return Center(
    child: AuraTabItem(text: 'Profile', isActive: false, onTap: () {}),
  );
}

@widgetbook.UseCase(name: 'Tab Item with Badge', type: AuraTabItem)
Widget tabItemWithBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraTabItem(
      icon: Icons.message,
      text: 'Messages',
      badge: AuraBadge.count(count: 8),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Tab Item with Dot Badge', type: AuraTabItem)
Widget tabItemWithDotBadgeUseCase(BuildContext context) {
  return Center(
    child: AuraTabItem(
      icon: Icons.notifications,
      text: 'Notifications',
      badge: const AuraBadge.dot(variant: AuraBadgeVariant.error),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Tab Item', type: AuraTabItem)
Widget disabledTabItemUseCase(BuildContext context) {
  return Center(
    child: AuraTabItem(
      icon: Icons.lock,
      text: 'Locked',
      isActive: false,
      onTap: null,
    ),
  );
}

@widgetbook.UseCase(name: 'Tab Item States Comparison', type: AuraTabItem)
Widget tabItemStatesComparisonUseCase(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      AuraTabItem(
        icon: Icons.home,
        text: 'Active',
        isActive: true,
        onTap: () {},
      ),
      AuraTabItem(
        icon: Icons.home,
        text: 'Inactive',
        isActive: false,
        onTap: () {},
      ),
      AuraTabItem(
        icon: Icons.home,
        text: 'Disabled',
        isActive: false,
        onTap: null,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Tab Bar Example', type: AuraTabItem)
Widget tabBarExampleUseCase(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AuraTabItem(
          icon: Icons.dashboard,
          text: 'Dashboard',
          isActive: true,
          onTap: () {},
        ),
        AuraTabItem(
          icon: Icons.analytics,
          text: 'Analytics',
          isActive: false,
          onTap: () {},
        ),
        AuraTabItem(
          icon: Icons.people,
          text: 'Team',
          badge: AuraBadge.count(count: 5),
          isActive: false,
          onTap: () {},
        ),
        AuraTabItem(
          icon: Icons.settings,
          text: 'Settings',
          isActive: false,
          onTap: () {},
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Text Only Tab Bar', type: AuraTabItem)
Widget textOnlyTabBarUseCase(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AuraTabItem(text: 'Overview', isActive: true, onTap: () {}),
        AuraTabItem(text: 'Details', isActive: false, onTap: () {}),
        AuraTabItem(
          text: 'History',
          badge: AuraBadge.count(count: 12),
          isActive: false,
          onTap: () {},
        ),
        AuraTabItem(text: 'Settings', isActive: false, onTap: () {}),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Only Tab Bar', type: AuraTabItem)
Widget iconOnlyTabBarUseCase(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AuraTabItem(
          icon: Icons.home,
          isActive: true,
          onTap: () {},
          semanticLabel: 'Home',
        ),
        AuraTabItem(
          icon: Icons.search,
          isActive: false,
          onTap: () {},
          semanticLabel: 'Search',
        ),
        AuraTabItem(
          icon: Icons.favorite,
          badge: const AuraBadge.dot(variant: AuraBadgeVariant.warning),
          isActive: false,
          onTap: () {},
          semanticLabel: 'Favorites',
        ),
        AuraTabItem(
          icon: Icons.person,
          isActive: false,
          onTap: () {},
          semanticLabel: 'Profile',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Tab with Various Badges', type: AuraTabItem)
Widget tabWithVariousBadgesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuraTabItem(
            icon: Icons.message,
            text: 'Count',
            badge: AuraBadge.count(count: 99),
            isActive: false,
            onTap: () {},
          ),
          AuraTabItem(
            icon: Icons.notifications,
            text: 'Dot',
            badge: const AuraBadge.dot(),
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuraTabItem(
            icon: Icons.warning,
            text: 'Warning',
            badge: AuraBadge.text(
              variant: AuraBadgeVariant.warning,
              child: Text('NEW'),
            ),
            isActive: false,
            onTap: () {},
          ),
          AuraTabItem(
            icon: Icons.error,
            text: 'Error',
            badge: const AuraBadge.dot(variant: AuraBadgeVariant.error),
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Scrollable Tab Bar', type: AuraTabItem)
Widget scrollableTabBarUseCase(BuildContext context) {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          AuraTabItem(
            icon: Icons.dashboard,
            text: 'Dashboard',
            isActive: true,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AuraTabItem(
            icon: Icons.analytics,
            text: 'Analytics',
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AuraTabItem(
            icon: Icons.people,
            text: 'Team Members',
            badge: AuraBadge.count(count: 3),
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AuraTabItem(
            icon: Icons.folder,
            text: 'Projects',
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AuraTabItem(
            icon: Icons.calendar_today,
            text: 'Calendar',
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AuraTabItem(
            icon: Icons.settings,
            text: 'Settings',
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}
