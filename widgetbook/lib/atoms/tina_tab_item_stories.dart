import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Active Tab Item', type: TinaTabItem)
Widget activeTabItemUseCase(BuildContext context) {
  return Center(
    child: TinaTabItem(
      icon: Icons.home,
      text: 'Home',
      isActive: true,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Inactive Tab Item', type: TinaTabItem)
Widget inactiveTabItemUseCase(BuildContext context) {
  return Center(
    child: TinaTabItem(
      icon: Icons.settings,
      text: 'Settings',
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Only Tab Item', type: TinaTabItem)
Widget iconOnlyTabItemUseCase(BuildContext context) {
  return Center(
    child: TinaTabItem(
      icon: Icons.notifications,
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Text Only Tab Item', type: TinaTabItem)
Widget textOnlyTabItemUseCase(BuildContext context) {
  return Center(
    child: TinaTabItem(text: 'Profile', isActive: false, onTap: () {}),
  );
}

@widgetbook.UseCase(name: 'Tab Item with Badge', type: TinaTabItem)
Widget tabItemWithBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaTabItem(
      icon: Icons.message,
      text: 'Messages',
      badge: TinaBadge.count(count: 8),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Tab Item with Dot Badge', type: TinaTabItem)
Widget tabItemWithDotBadgeUseCase(BuildContext context) {
  return Center(
    child: TinaTabItem(
      icon: Icons.notifications,
      text: 'Notifications',
      badge: const TinaBadge.dot(variant: TinaBadgeVariant.error),
      isActive: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Tab Item', type: TinaTabItem)
Widget disabledTabItemUseCase(BuildContext context) {
  return Center(
    child: TinaTabItem(
      icon: Icons.lock,
      text: 'Locked',
      isActive: false,
      onTap: null,
    ),
  );
}

@widgetbook.UseCase(name: 'Tab Item States Comparison', type: TinaTabItem)
Widget tabItemStatesComparisonUseCase(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TinaTabItem(
        icon: Icons.home,
        text: 'Active',
        isActive: true,
        onTap: () {},
      ),
      TinaTabItem(
        icon: Icons.home,
        text: 'Inactive',
        isActive: false,
        onTap: () {},
      ),
      TinaTabItem(
        icon: Icons.home,
        text: 'Disabled',
        isActive: false,
        onTap: null,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Tab Bar Example', type: TinaTabItem)
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
        TinaTabItem(
          icon: Icons.dashboard,
          text: 'Dashboard',
          isActive: true,
          onTap: () {},
        ),
        TinaTabItem(
          icon: Icons.analytics,
          text: 'Analytics',
          isActive: false,
          onTap: () {},
        ),
        TinaTabItem(
          icon: Icons.people,
          text: 'Team',
          badge: TinaBadge.count(count: 5),
          isActive: false,
          onTap: () {},
        ),
        TinaTabItem(
          icon: Icons.settings,
          text: 'Settings',
          isActive: false,
          onTap: () {},
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Text Only Tab Bar', type: TinaTabItem)
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
        TinaTabItem(text: 'Overview', isActive: true, onTap: () {}),
        TinaTabItem(text: 'Details', isActive: false, onTap: () {}),
        TinaTabItem(
          text: 'History',
          badge: TinaBadge.count(count: 12),
          isActive: false,
          onTap: () {},
        ),
        TinaTabItem(text: 'Settings', isActive: false, onTap: () {}),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Only Tab Bar', type: TinaTabItem)
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
        TinaTabItem(
          icon: Icons.home,
          isActive: true,
          onTap: () {},
          semanticLabel: 'Home',
        ),
        TinaTabItem(
          icon: Icons.search,
          isActive: false,
          onTap: () {},
          semanticLabel: 'Search',
        ),
        TinaTabItem(
          icon: Icons.favorite,
          badge: const TinaBadge.dot(variant: TinaBadgeVariant.warning),
          isActive: false,
          onTap: () {},
          semanticLabel: 'Favorites',
        ),
        TinaTabItem(
          icon: Icons.person,
          isActive: false,
          onTap: () {},
          semanticLabel: 'Profile',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Tab with Various Badges', type: TinaTabItem)
Widget tabWithVariousBadgesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TinaTabItem(
            icon: Icons.message,
            text: 'Count',
            badge: TinaBadge.count(count: 99),
            isActive: false,
            onTap: () {},
          ),
          TinaTabItem(
            icon: Icons.notifications,
            text: 'Dot',
            badge: const TinaBadge.dot(),
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TinaTabItem(
            icon: Icons.warning,
            text: 'Warning',
            badge: TinaBadge.text(
              variant: TinaBadgeVariant.warning,
              child: Text('NEW'),
            ),
            isActive: false,
            onTap: () {},
          ),
          TinaTabItem(
            icon: Icons.error,
            text: 'Error',
            badge: const TinaBadge.dot(variant: TinaBadgeVariant.error),
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Scrollable Tab Bar', type: TinaTabItem)
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
          TinaTabItem(
            icon: Icons.dashboard,
            text: 'Dashboard',
            isActive: true,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          TinaTabItem(
            icon: Icons.analytics,
            text: 'Analytics',
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          TinaTabItem(
            icon: Icons.people,
            text: 'Team Members',
            badge: TinaBadge.count(count: 3),
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          TinaTabItem(
            icon: Icons.folder,
            text: 'Projects',
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          TinaTabItem(
            icon: Icons.calendar_today,
            text: 'Calendar',
            isActive: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          TinaTabItem(
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
