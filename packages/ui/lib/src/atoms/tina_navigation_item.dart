import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_badge.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable navigation item component following the Tina design system.
///
/// This navigation item supports icons, text, badges, and different states
/// for use in navigation bars, drawers, and other navigation contexts.
class TinaNavigationItem extends StatelessWidget {
  /// Creates a Tina navigation item.
  const TinaNavigationItem({
    required this.onTap,
    super.key,
    this.icon,
    this.text,
    this.badge,
    this.isActive = false,
    this.size = TinaNavigationItemSize.normal,
    this.semanticLabel,
  });

  /// The callback that is called when the item is tapped.
  final VoidCallback? onTap;

  /// The icon to display.
  final IconData? icon;

  /// The text to display.
  final String? text;

  /// Optional badge to display on the item.
  final TinaBadge? badge;

  /// Whether the item is in an active state.
  final bool isActive;

  /// The size of the navigation item.
  final TinaNavigationItemSize size;

  /// A semantic label for the item for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    var content = _buildContent(tinaColors);

    if (badge != null) {
      content = TinaPositionedBadge(
        badge: badge!,
        child: content,
      );
    }

    return Semantics(
      label: semanticLabel ?? text,
      selected: isActive,
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          child: Container(
            padding: _getPadding(),
            decoration: BoxDecoration(
              color: _getBackgroundColor(tinaColors),
              borderRadius: BorderRadius.circular(_getBorderRadius()),
            ),
            child: content,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(TinaColorScheme tinaColors) {
    final iconColor = _getIconColor(tinaColors);
    final textColor = _getTextColor(tinaColors);

    return switch (size) {
      TinaNavigationItemSize.compact => _buildCompactContent(
        iconColor,
        textColor,
      ),
      TinaNavigationItemSize.normal => _buildNormalContent(
        iconColor,
        textColor,
      ),
      TinaNavigationItemSize.expanded => _buildExpandedContent(
        iconColor,
        textColor,
      ),
    };
  }

  Widget _buildCompactContent(Color iconColor, Color textColor) {
    if (icon != null) {
      return TinaIcon(
        icon!,
        size: TinaIconSize.small,
        color: iconColor,
      );
    }

    if (text != null) {
      return TinaText(
        text!,
        style: TinaTextStyle.caption,
        color: textColor,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildNormalContent(Color iconColor, Color textColor) {
    if (icon != null && text != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TinaIcon(
            icon!,
            color: iconColor,
          ),
          const SizedBox(height: DesignSpacing.xs),
          TinaText(
            text!,
            style: TinaTextStyle.caption,
            color: textColor,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }

    if (icon != null) {
      return TinaIcon(
        icon!,
        color: iconColor,
      );
    }

    if (text != null) {
      return TinaText(
        text!,
        style: TinaTextStyle.bodySmall,
        color: textColor,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildExpandedContent(Color iconColor, Color textColor) {
    if (icon != null && text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TinaIcon(
            icon!,
            color: iconColor,
          ),
          const SizedBox(width: DesignSpacing.sm),
          Flexible(
            child: TinaText(
              text!,
              color: textColor,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    if (icon != null) {
      return TinaIcon(
        icon!,
        color: iconColor,
      );
    }

    if (text != null) {
      return TinaText(
        text!,
        color: textColor,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return const SizedBox.shrink();
  }

  EdgeInsets _getPadding() {
    return switch (size) {
      TinaNavigationItemSize.compact => const EdgeInsets.all(DesignSpacing.xs),
      TinaNavigationItemSize.normal => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.sm,
        vertical: DesignSpacing.xs,
      ),
      TinaNavigationItemSize.expanded => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.md,
        vertical: DesignSpacing.sm,
      ),
    };
  }

  double _getBorderRadius() {
    return switch (size) {
      TinaNavigationItemSize.compact => DesignBorderRadius.sm,
      TinaNavigationItemSize.normal => DesignBorderRadius.md,
      TinaNavigationItemSize.expanded => DesignBorderRadius.md,
    };
  }

  Color _getBackgroundColor(TinaColorScheme tinaColors) {
    if (!isActive) return Colors.transparent;

    return tinaColors.primary.withValues(alpha: 0.1);
  }

  Color _getIconColor(TinaColorScheme tinaColors) {
    if (onTap == null) {
      return tinaColors.onSurfaceVariant.withValues(alpha: 0.6);
    }

    if (isActive) return tinaColors.primary;

    return tinaColors.onSurfaceVariant;
  }

  Color _getTextColor(TinaColorScheme tinaColors) {
    if (onTap == null) {
      return tinaColors.onSurfaceVariant.withValues(alpha: 0.6);
    }

    if (isActive) return tinaColors.primary;

    return tinaColors.onSurface;
  }
}

/// The size of a [TinaNavigationItem].
enum TinaNavigationItemSize {
  /// Compact size with minimal padding.
  compact,

  /// Normal size (default).
  normal,

  /// Expanded size with more padding and larger text.
  expanded,
}
