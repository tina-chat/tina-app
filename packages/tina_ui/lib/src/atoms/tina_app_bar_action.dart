import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_badge.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable app bar action button component following the Tina design
/// system.
///
/// This action button is specifically designed for use in app bars and provides
/// proper touch targets, badge support, and accessibility features.
class TinaAppBarAction extends StatelessWidget {
  /// Creates a Tina app bar action button.
  const TinaAppBarAction({
    required this.icon,
    required this.onPressed,
    super.key,
    this.badge,
    this.color,
    this.semanticLabel,
    this.tooltip,
  });

  /// The icon to display.
  final IconData icon;

  /// The callback that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Optional badge to display on the action button.
  final TinaBadge? badge;

  /// The color of the icon. If null, uses the default app bar icon color.
  final Color? color;

  /// A semantic label for the button for accessibility.
  final String? semanticLabel;

  /// The tooltip message to display when the button is long-pressed.
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final iconColor = color ?? _getDefaultIconColor(context, tinaColors);

    Widget actionButton = IconButton(
      onPressed: onPressed,
      icon: TinaIcon(
        icon,
        color: iconColor,
        semanticLabel: semanticLabel,
      ),
      iconSize: 24,
      padding: const EdgeInsets.all(DesignSpacing.sm),
      constraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 48,
      ),
      style: IconButton.styleFrom(
        foregroundColor: iconColor,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignBorderRadius.md),
        ),
      ),
    );

    if (badge != null) {
      actionButton = TinaPositionedBadge(
        badge: badge!,
        offset: const Offset(-4, 4),
        child: actionButton,
      );
    }

    if (tooltip != null) {
      actionButton = Tooltip(
        message: tooltip,
        child: actionButton,
      );
    }

    return actionButton;
  }

  Color _getDefaultIconColor(BuildContext context, TinaColorScheme tinaColors) {
    // Check if there's an AppBar theme with foreground color
    final appBarTheme = Theme.of(context).appBarTheme;
    if (appBarTheme.foregroundColor != null) {
      return appBarTheme.foregroundColor!;
    }
    return tinaColors.onSurface;
  }
}
