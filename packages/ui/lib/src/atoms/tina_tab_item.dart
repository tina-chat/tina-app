import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';
import 'tina_badge.dart';
import 'tina_icon.dart';
import 'tina_text.dart';

/// A customizable tab item component following the Tina design system.
///
/// This tab item supports icons, text, badges, and active/inactive states
/// for use in tab bars and tab navigation contexts.
class TinaTabItem extends StatelessWidget {
  /// Creates a Tina tab item.
  const TinaTabItem({
    required this.onTap,
    super.key,
    this.icon,
    this.text,
    this.badge,
    this.isActive = false,
    this.semanticLabel,
  });

  /// The callback that is called when the tab is tapped.
  final VoidCallback? onTap;

  /// The icon to display.
  final IconData? icon;

  /// The text to display.
  final String? text;

  /// Optional badge to display on the tab.
  final TinaBadge? badge;

  /// Whether the tab is in an active state.
  final bool isActive;

  /// A semantic label for the tab for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget content = _buildContent(theme);
    
    if (badge != null) {
      content = TinaPositionedBadge(
        badge: badge!,
        position: TinaBadgePosition.topRight,
        offset: const Offset(-4, 4),
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
          borderRadius: BorderRadius.circular(DesignBorderRadius.md),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpacing.md,
              vertical: DesignSpacing.sm,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: _getIndicatorColor(theme),
                  width: isActive ? 2.0 : 0.0,
                ),
              ),
            ),
            child: content,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    final iconColor = _getIconColor(theme);
    final textColor = _getTextColor(theme);

    if (icon != null && text != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TinaIcon(
            icon!,
            size: TinaIconSize.medium,
            color: iconColor,
          ),
          const SizedBox(height: DesignSpacing.xs),
          TinaText(
            text!,
            style: TinaTextStyle.caption,
            color: textColor,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontWeight: isActive 
                ? DesignTypography.fontWeightMedium 
                : DesignTypography.fontWeightRegular,
          ),
        ],
      );
    }
    
    if (icon != null) {
      return TinaIcon(
        icon!,
        size: TinaIconSize.medium,
        color: iconColor,
      );
    }
    
    if (text != null) {
      return TinaText(
        text!,
        style: TinaTextStyle.body,
        color: textColor,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        fontWeight: isActive 
            ? DesignTypography.fontWeightMedium 
            : DesignTypography.fontWeightRegular,
      );
    }
    
    return const SizedBox.shrink();
  }

  Color _getIndicatorColor(ThemeData theme) {
    if (!isActive) return Colors.transparent;
    return DesignColors.primaryBase;
  }

  Color _getIconColor(ThemeData theme) {
    if (onTap == null) return DesignColors.neutral400;
    
    if (isActive) return DesignColors.primaryBase;
    
    return theme.brightness == Brightness.dark
        ? DesignColors.neutral400
        : DesignColors.neutral500;
  }

  Color _getTextColor(ThemeData theme) {
    if (onTap == null) return DesignColors.neutral400;
    
    if (isActive) return DesignColors.primaryBase;
    
    return theme.brightness == Brightness.dark
        ? DesignColors.neutral300
        : DesignColors.neutral600;
  }
}