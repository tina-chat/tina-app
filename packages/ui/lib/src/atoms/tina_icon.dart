import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';

/// A customizable icon component following the Tina design system.
///
/// This icon widget provides consistent sizing, theming, and accessibility
/// features across the application.
class TinaIcon extends StatelessWidget {
  /// Creates a Tina icon.
  const TinaIcon(
    this.icon, {
    super.key,
    this.size = TinaIconSize.medium,
    this.color,
    this.semanticLabel,
  });

  /// The icon to display.
  final IconData icon;

  /// The size of the icon.
  final TinaIconSize size;

  /// The color of the icon. If null, uses the default color from the theme.
  final Color? color;

  /// A semantic label for the icon for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = color ?? _getDefaultColor(theme);
    final iconSize = _getIconSize();

    return Semantics(
      label: semanticLabel,
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }

  double _getIconSize() {
    return switch (size) {
      TinaIconSize.extraSmall => 12.0,
      TinaIconSize.small => 16.0,
      TinaIconSize.medium => 20.0,
      TinaIconSize.large => 24.0,
      TinaIconSize.extraLarge => 32.0,
      TinaIconSize.huge => 48.0,
    };
  }

  Color _getDefaultColor(ThemeData theme) {
    return theme.brightness == Brightness.dark
        ? DesignColors.neutral100
        : DesignColors.neutral700;
  }
}

/// A specialized icon button component following the Tina design system.
///
/// This provides a consistent way to create interactive icons with proper
/// touch targets and accessibility features.
class TinaIconButton extends StatelessWidget {
  /// Creates a Tina icon button.
  const TinaIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.size = TinaIconSize.medium,
    this.color,
    this.backgroundColor,
    this.variant = TinaIconButtonVariant.ghost,
    this.semanticLabel,
    this.tooltip,
  });

  /// The icon to display.
  final IconData icon;

  /// The callback that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// The size of the icon.
  final TinaIconSize size;

  /// The color of the icon. If null, uses the default color for the variant.
  final Color? color;

  /// The background color of the button. If null, uses the default for the variant.
  final Color? backgroundColor;

  /// The visual variant of the icon button.
  final TinaIconButtonVariant variant;

  /// A semantic label for the button for accessibility.
  final String? semanticLabel;

  /// The tooltip message to display when the button is long-pressed.
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonSize = _getButtonSize();
    final iconSize = _getIconSize();

    Widget button = SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: IconButton(
        onPressed: onPressed,
        icon: TinaIcon(
          icon,
          size: size,
          color: color ?? _getIconColor(theme),
          semanticLabel: semanticLabel,
        ),
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: buttonSize,
          minHeight: buttonSize,
        ),
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor ?? _getBackgroundColor(theme),
          foregroundColor: color ?? _getIconColor(theme),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_getBorderRadius()),
            side: variant == TinaIconButtonVariant.outlined
                ? BorderSide(
                    color: DesignColors.neutral300,
                    width: DesignBorderWidth.thin,
                  )
                : BorderSide.none,
          ),
          elevation: variant == TinaIconButtonVariant.elevated ? 2 : 0,
        ),
      ),
    );

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }

  double _getButtonSize() {
    return switch (size) {
      TinaIconSize.extraSmall => 24.0,
      TinaIconSize.small => 32.0,
      TinaIconSize.medium => 40.0,
      TinaIconSize.large => 48.0,
      TinaIconSize.extraLarge => 56.0,
      TinaIconSize.huge => 72.0,
    };
  }

  double _getIconSize() {
    return switch (size) {
      TinaIconSize.extraSmall => 12.0,
      TinaIconSize.small => 16.0,
      TinaIconSize.medium => 20.0,
      TinaIconSize.large => 24.0,
      TinaIconSize.extraLarge => 32.0,
      TinaIconSize.huge => 48.0,
    };
  }

  double _getBorderRadius() {
    return switch (size) {
      TinaIconSize.extraSmall => DesignBorderRadius.sm,
      TinaIconSize.small => DesignBorderRadius.sm,
      TinaIconSize.medium => DesignBorderRadius.md,
      TinaIconSize.large => DesignBorderRadius.md,
      TinaIconSize.extraLarge => DesignBorderRadius.lg,
      TinaIconSize.huge => DesignBorderRadius.lg,
    };
  }

  Color _getIconColor(ThemeData theme) {
    if (onPressed == null) return DesignColors.neutral400;

    return switch (variant) {
      TinaIconButtonVariant.ghost => DesignColors.neutral700,
      TinaIconButtonVariant.filled => DesignColors.primaryContrast,
      TinaIconButtonVariant.outlined => DesignColors.neutral700,
      TinaIconButtonVariant.elevated => DesignColors.primaryContrast,
    };
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (onPressed == null) return Colors.transparent;

    return switch (variant) {
      TinaIconButtonVariant.ghost => Colors.transparent,
      TinaIconButtonVariant.filled => DesignColors.primaryBase,
      TinaIconButtonVariant.outlined => Colors.transparent,
      TinaIconButtonVariant.elevated => DesignColors.primaryBase,
    };
  }
}

/// The size of a [TinaIcon] or [TinaIconButton].
enum TinaIconSize {
  /// Extra small icon (12px).
  extraSmall,

  /// Small icon (16px).
  small,

  /// Medium icon (20px) - default.
  medium,

  /// Large icon (24px).
  large,

  /// Extra large icon (32px).
  extraLarge,

  /// Huge icon (48px).
  huge,
}

/// The visual variant of a [TinaIconButton].
enum TinaIconButtonVariant {
  /// A button with transparent background.
  ghost,

  /// A button with filled background.
  filled,

  /// A button with transparent background and border.
  outlined,

  /// A button with filled background and elevation.
  elevated,
}