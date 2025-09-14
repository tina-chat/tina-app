import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';
import 'tina_badge.dart';
import 'tina_icon.dart';

/// A customizable app bar action button component following the Tina design system.
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
    final theme = Theme.of(context);
    final iconColor = color ?? _getDefaultIconColor(theme);
    
    Widget actionButton = IconButton(
      onPressed: onPressed,
      icon: TinaIcon(
        icon,
        size: TinaIconSize.medium,
        color: iconColor,
        semanticLabel: semanticLabel,
      ),
      iconSize: 24.0,
      padding: const EdgeInsets.all(DesignSpacing.sm),
      constraints: const BoxConstraints(
        minWidth: 48.0,
        minHeight: 48.0,
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
        position: TinaBadgePosition.topRight,
        offset: const Offset(-4, 4),
        child: actionButton,
      );
    }

    if (tooltip != null) {
      actionButton = Tooltip(
        message: tooltip!,
        child: actionButton,
      );
    }

    return actionButton;
  }

  Color _getDefaultIconColor(ThemeData theme) {
    // Use the app bar's foreground color if available, otherwise use neutral colors
    final appBarTheme = theme.appBarTheme;
    if (appBarTheme.foregroundColor != null) {
      return appBarTheme.foregroundColor!;
    }
    
    return theme.brightness == Brightness.dark
        ? DesignColors.neutral100
        : DesignColors.neutral700;
  }
}