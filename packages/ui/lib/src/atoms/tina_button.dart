import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';

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
    final theme = Theme.of(context);
    
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(theme),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getLoadingColor(theme),
                  ),
                ),
              )
            : child,
      ),
    );
  }

  ButtonStyle _getButtonStyle(ThemeData theme) {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(theme),
      foregroundColor: _getForegroundColor(theme),
      elevation: variant == TinaButtonVariant.elevated ? 2 : 0,
      padding: _getPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignBorderRadius.md),
        side: variant == TinaButtonVariant.outlined
            ? BorderSide(
                color: DesignColors.primaryBase,
                width: DesignBorderWidth.thin,
              )
            : BorderSide.none,
      ),
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (onPressed == null) return DesignColors.neutral300;
    
    return switch (variant) {
      TinaButtonVariant.primary => DesignColors.primaryBase,
      TinaButtonVariant.secondary => DesignColors.secondaryBase,
      TinaButtonVariant.outlined => Colors.transparent,
      TinaButtonVariant.ghost => Colors.transparent,
      TinaButtonVariant.elevated => DesignColors.primaryBase,
    };
  }

  Color _getForegroundColor(ThemeData theme) {
    if (onPressed == null) return DesignColors.neutral500;
    
    return switch (variant) {
      TinaButtonVariant.primary => DesignColors.primaryContrast,
      TinaButtonVariant.secondary => DesignColors.secondaryContrast,
      TinaButtonVariant.outlined => DesignColors.primaryBase,
      TinaButtonVariant.ghost => DesignColors.primaryBase,
      TinaButtonVariant.elevated => DesignColors.primaryContrast,
    };
  }

  Color _getLoadingColor(ThemeData theme) {
    return switch (variant) {
      TinaButtonVariant.primary => DesignColors.primaryContrast,
      TinaButtonVariant.secondary => DesignColors.secondaryContrast,
      TinaButtonVariant.outlined => DesignColors.primaryBase,
      TinaButtonVariant.ghost => DesignColors.primaryBase,
      TinaButtonVariant.elevated => DesignColors.primaryContrast,
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