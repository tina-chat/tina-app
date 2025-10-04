import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable button component following the Tina design system.
///
/// This button supports multiple variants, sizes, and states while maintaining
/// consistency with the design tokens.
class TinaButton extends StatelessWidget {
  /// Creates a Tina button.
  const TinaButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.variant = TinaButtonVariant.primary,
    this.size = TinaButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  /// The callback that is called when the button is tapped.
  final VoidCallback? onPressed;

  /// The widget to display inside the button.
  final Widget child;

  /// The visual variant of the button.
  final TinaButtonVariant variant;

  /// The size of the button.
  final TinaButtonSize size;

  /// Whether the button is in a loading state.
  final bool isLoading;

  /// Whether the button should take the full width of its parent.
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(tinaColors),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getLoadingColor(tinaColors),
                  ),
                ),
              )
            : child,
      ),
    );
  }

  ButtonStyle _getButtonStyle(TinaColorScheme colors) {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(colors),
      foregroundColor: _getForegroundColor(colors),
      elevation: variant == TinaButtonVariant.elevated ? 2 : 0,
      padding: _getPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignBorderRadius.md),
        side: variant == TinaButtonVariant.outlined
            ? BorderSide(
                color: colors.primary,
              )
            : BorderSide.none,
      ),
    );
  }

  Color _getBackgroundColor(TinaColorScheme colors) {
    if (onPressed == null) return colors.outlineVariant;

    return switch (variant) {
      TinaButtonVariant.primary => colors.primary,
      TinaButtonVariant.secondary => colors.secondary,
      TinaButtonVariant.outlined => Colors.transparent,
      TinaButtonVariant.ghost => Colors.transparent,
      TinaButtonVariant.elevated => colors.primary,
    };
  }

  Color _getForegroundColor(TinaColorScheme colors) {
    if (onPressed == null) return colors.onSurfaceVariant;

    return switch (variant) {
      TinaButtonVariant.primary => colors.onPrimary,
      TinaButtonVariant.secondary => colors.onSecondary,
      TinaButtonVariant.outlined => colors.primary,
      TinaButtonVariant.ghost => colors.primary,
      TinaButtonVariant.elevated => colors.onPrimary,
    };
  }

  Color _getLoadingColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaButtonVariant.primary => colors.onPrimary,
      TinaButtonVariant.secondary => colors.onSecondary,
      TinaButtonVariant.outlined => colors.primary,
      TinaButtonVariant.ghost => colors.primary,
      TinaButtonVariant.elevated => colors.onPrimary,
    };
  }

  double _getHeight() {
    return switch (size) {
      TinaButtonSize.small => DesignButtonSizes.heightSm,
      TinaButtonSize.medium => DesignButtonSizes.heightMd,
      TinaButtonSize.large => DesignButtonSizes.heightLg,
    };
  }

  EdgeInsets _getPadding() {
    return switch (size) {
      TinaButtonSize.small => DesignButtonSizes.paddingSm,
      TinaButtonSize.medium => DesignButtonSizes.paddingMd,
      TinaButtonSize.large => DesignButtonSizes.paddingLg,
    };
  }
}

/// The visual variant of a [TinaButton].
enum TinaButtonVariant {
  /// A filled button with primary color background.
  primary,

  /// A filled button with secondary color background.
  secondary,

  /// A button with transparent background and border.
  outlined,

  /// A button with transparent background and no border.
  ghost,

  /// A button with elevation and shadow.
  elevated,
}

/// The size of a [TinaButton].
enum TinaButtonSize {
  /// A small button.
  small,

  /// A medium button (default).
  medium,

  /// A large button.
  large,
}
