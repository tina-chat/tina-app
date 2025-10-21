import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/atoms.dart';
import 'package:tina_ui/src/internal/tina_pressable.dart';
import 'package:tina_ui/src/tokens/tokens.dart';

/// A generic sidebar organism component that provides navigation functionality.
///
/// This component handles the visual presentation of the sidebar including
/// customizable header, navigation items, and footer sections. It is designed
/// to be a pure UI component that receives all necessary data and callbacks.
class TinaSidebar extends StatelessWidget {
  /// Creates a Tina sidebar organism.
  const TinaSidebar({
    required this.isExpanded,
    required this.animation,
    required this.navigationItems,
    required this.onNavigationTap,
    this.header,
    this.footer,
    super.key,
  });

  /// Whether the sidebar is currently expanded.
  final bool isExpanded;

  /// Animation controller for sidebar expand/collapse transitions.
  final Animation<double> animation;

  /// List of navigation items to display.
  final List<NavigationItem> navigationItems;

  /// Callback when a navigation item is tapped.
  final void Function(String route) onNavigationTap;

  /// Optional header widget to display at the top of the sidebar.
  final Widget? header;

  /// Optional footer widget to display at the bottom of the sidebar.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: isExpanded ? 280 : 80,
          decoration: BoxDecoration(
            color: context.tinaColors.surface,
            border: Border(
              right: BorderSide(
                color: context.tinaColors.outline,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: context.tinaColors.shadow.withValues(alpha: 0.1),
                offset: const Offset(2, 0),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              if (header != null)
                _buildHeaderSection(context)
              else
                SizedBox(height: context.tinaTheme.spacing.lg),
              Expanded(child: _buildNavigationItems(context)),
              if (footer != null) _buildFooterSection(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.tinaTheme.spacing.lg),
      child: header,
    );
  }

  Widget _buildNavigationItems(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.tinaTheme.spacing.md),
      child: Column(
        children: navigationItems.map((item) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.tinaTheme.spacing.sm,
              vertical: context.tinaTheme.spacing.xs,
            ),
            child: _TinaSidebarItem(
              selected: item.isActive,
              icon: Icon(
                item.icon,
              ),
              onTap: () => onNavigationTap(item.route),
              label: isExpanded ? Text(item.label) : const SizedBox.shrink(),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFooterSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.tinaTheme.spacing.sm),
      child: footer,
    );
  }
}

/// Represents a navigation item in the sidebar.
class NavigationItem {
  /// Creates a navigation item.
  const NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.isActive,
  });

  /// Icon to display for the navigation item.
  final IconData icon;

  /// Label text for the navigation item.
  final String label;

  /// Route path for navigation.
  final String route;

  /// Whether this item is currently active/selected.
  final bool isActive;
}

class _TinaSidebarItem extends StatelessWidget {
  const _TinaSidebarItem({
    required this.label,
    required this.onTap,
    this.icon,
    this.selected = false,
  });

  final Widget label;

  final Widget? icon;

  final bool selected;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.tinaColors;
    return TinaPressable(
      color: colors.primary,
      onPressed: onTap,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(context.tinaTheme.spacing.sm),
      decoration: BoxDecoration(
        color: selected ? colors.primary.withValues(alpha: .1) : null,
        borderRadius: BorderRadius.circular(context.tinaTheme.borderRadius.xl),
      ),
      child: TinaText(
        color: selected ? TinaTextColor.primary : null,
        child: TinaRow(
          spacing: TinaSpacing.sm,
          children: [
            if (icon != null) icon!,
            label,
          ],
        ),
      ),
    );
  }
}
