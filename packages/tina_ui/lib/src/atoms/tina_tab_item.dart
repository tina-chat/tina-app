import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_badge.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

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
    final tinaColors = context.tinaColors;

    var content = _buildContent(tinaColors);

    if (badge != null) {
      content = TinaPositionedBadge(
        badge: badge!,
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
                  color: _getIndicatorColor(tinaColors),
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

  Widget _buildContent(TinaColorScheme tinaColors) {
    final iconColor = _getIconColor(tinaColors);
    final textColor = _getTextColor(tinaColors);

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
        color: iconColor,
      );
    }

    if (text != null) {
      return TinaText(
        text!,
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

  Color _getIndicatorColor(TinaColorScheme tinaColors) {
    if (!isActive) return Colors.transparent;
    return tinaColors.primary;
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
