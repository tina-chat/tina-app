import 'package:auravibes_ui/src/atoms/atoms.dart';
import 'package:auravibes_ui/src/tokens/tokens.dart';
import 'package:flutter/material.dart';

/// A generic sidebar organism component that provides navigation functionality.
///
/// This component handles the visual presentation of the sidebar including
/// customizable header, navigation items, and footer sections. It is designed
/// to be a pure UI component that receives all necessary data and callbacks.
class AuraSidebar<T> extends StatelessWidget {
  /// Creates a Aura sidebar organism.
  const AuraSidebar({
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
  final List<AuraNavigationData<T>> navigationItems;

  /// Callback when a navigation item is tapped.
  final void Function(T value) onNavigationTap;

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
            color: context.auraColors.surface,
            border: Border(
              right: BorderSide(
                color: context.auraColors.outline,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: context.auraColors.shadow.withValues(alpha: 0.1),
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
                SizedBox(height: context.auraTheme.spacing.lg),
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
      padding: EdgeInsets.all(context.auraTheme.spacing.lg),
      child: header,
    );
  }

  Widget _buildNavigationItems(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.auraTheme.spacing.md),
      child: Column(
        children: navigationItems.map((item) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.auraTheme.spacing.sm,
              vertical: context.auraTheme.spacing.xs,
            ),
            child: _AuraSidebarItem(
              selected: item.isActive,
              icon: Icon(
                item.icon,
              ),
              onTap: () => onNavigationTap(item.value),
              label: isExpanded ? item.label : const SizedBox.shrink(),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFooterSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.auraTheme.spacing.sm),
      child: footer,
    );
  }
}

/// Represents a navigation item in the sidebar.
class AuraNavigationData<T> {
  /// Creates a navigation item.
  const AuraNavigationData({
    required this.icon,
    required this.label,
    required this.value,
    this.isActive = false,
  });

  /// Icon to display for the navigation item.
  final IconData icon;

  /// Label text for the navigation item.
  final Widget label;

  /// unique value to diferentiate
  final T value;

  /// Whether this item is currently active/selected.
  final bool isActive;

  /// copy with
  AuraNavigationData<T> copyWith({
    IconData? icon,
    Widget? label,
    T? value,
    bool? isActive,
  }) {
    return AuraNavigationData<T>(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      value: value ?? this.value,
      isActive: isActive ?? this.isActive,
    );
  }
}

class _AuraSidebarItem extends StatelessWidget {
  const _AuraSidebarItem({
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
    final colors = context.auraColors;
    return AuraPressable(
      color: colors.primary,
      onPressed: onTap,
      decoration: BoxDecoration(
        color: selected ? colors.primary.withValues(alpha: .1) : null,
        borderRadius: BorderRadius.circular(context.auraTheme.borderRadius.xl),
      ),
      child: AuraPadding(
        padding: .small,
        child: AuraText(
          color: selected ? .primary : null,
          child: AuraRow(
            spacing: .sm,
            children: [
              ?icon,
              label,
            ],
          ),
        ),
      ),
    );
  }
}
