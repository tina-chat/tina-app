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
    final tinaTheme = context.tinaTheme;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(tinaTheme.borderRadius.md),
          child: AnimatedContainer(
            duration: tinaTheme.animation.normal,
            padding: _getPadding(tinaTheme.spacing),
            decoration: BoxDecoration(
              color: _getBackgroundColor(tinaColors),
              borderRadius: BorderRadius.circular(tinaTheme.borderRadius.md),
              border: _getBorder(tinaColors),
              boxShadow: _getBoxShadow(),
            ),
            child: Center(
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
                  : DefaultTextStyle(
                      style: _getTextStyle(tinaColors, tinaTheme.typography),
                      child: child,
                    ),
            ),
          ),
        ),
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

  EdgeInsets _getPadding(TinaSpacingTheme spacing) {
    return switch (size) {
      TinaButtonSize.small => EdgeInsets.symmetric(
        horizontal: spacing.md,
        vertical: spacing.sm,
      ),
      TinaButtonSize.medium => EdgeInsets.symmetric(
        horizontal: spacing.lg,
        vertical: spacing.md,
      ),
      TinaButtonSize.large => EdgeInsets.symmetric(
        horizontal: spacing.xl,
        vertical: spacing.lg,
      ),
    };
  }

  Border? _getBorder(TinaColorScheme colors) {
    if (variant == TinaButtonVariant.outlined) {
      return Border.all(
        color: onPressed == null ? colors.outlineVariant : colors.primary,
      );
    }
    return null;
  }

  List<BoxShadow> _getBoxShadow() {
    if (variant == TinaButtonVariant.elevated) {
      return [DesignShadows.sm];
    }
    return [];
  }

  TextStyle _getTextStyle(
    TinaColorScheme colors,
    TinaTypographyTheme typography,
  ) {
    final fontSize = switch (size) {
      TinaButtonSize.small => typography.sizes.sm,
      TinaButtonSize.medium => typography.sizes.base,
      TinaButtonSize.large => typography.sizes.lg,
    };

    final fontWeight = switch (size) {
      TinaButtonSize.small => typography.weights.medium,
      TinaButtonSize.medium => typography.weights.medium,
      TinaButtonSize.large => typography.weights.semibold,
    };

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: _getForegroundColor(colors),
      height: typography.lineHeights.base,
    );
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
