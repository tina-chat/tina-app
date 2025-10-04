import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable tile component following the Tina design system.
///
/// Tiles are horizontally expanded interactive elements similar to buttons
/// but designed for broader content areas and different interaction patterns.
/// They support multiple variants, sizes, and states while maintaining
/// consistency with the design tokens.
class TinaTile extends StatelessWidget {
  /// Creates a Tina tile.
  const TinaTile({
    required this.onTap,
    required this.child,
    super.key,
    this.variant = TinaTileVariant.primary,
    this.size = TinaTileSize.medium,
    this.isLoading = false,
    this.leading,
    this.trailing,
    this.enabled = true,
  });

  /// The callback that is called when the tile is tapped.
  final VoidCallback? onTap;

  /// The widget to display inside the tile.
  final Widget child;

  /// The visual variant of the tile.
  final TinaTileVariant variant;

  /// The size of the tile.
  final TinaTileSize size;

  /// Whether the tile is in a loading state.
  final bool isLoading;

  /// Optional widget to display before the main content.
  final Widget? leading;

  /// Optional widget to display after the main content.
  final Widget? trailing;

  /// Whether the tile is enabled for interaction.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final tinaTheme = context.tinaTheme;

    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (enabled && !isLoading) ? onTap : null,
          borderRadius: BorderRadius.circular(tinaTheme.borderRadius.lg),
          child: AnimatedContainer(
            duration: tinaTheme.animation.normal,
            padding: _getPadding(tinaTheme.spacing),
            decoration: BoxDecoration(
              color: _getBackgroundColor(tinaColors),
              borderRadius: BorderRadius.circular(tinaTheme.borderRadius.lg),
              border: _getBorder(tinaColors),
              boxShadow: _getBoxShadow(),
            ),
            child: _buildContent(tinaColors, tinaTheme),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(TinaColorScheme colors, TinaTheme theme) {
    if (isLoading) {
      return Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              _getLoadingColor(colors),
            ),
          ),
        ),
      );
    }

    // Check if child is effectively empty (like SizedBox.shrink())
    final isChildEmpty =
        child is SizedBox &&
        (child as SizedBox).width == 0 &&
        (child as SizedBox).height == 0;

    if (isChildEmpty && leading != null && trailing == null) {
      // Icon-only case: center the leading icon
      return Center(child: leading);
    }

    return Row(
      children: [
        if (leading != null) ...[
          leading!,
          SizedBox(width: theme.spacing.sm),
        ],
        Flexible(
          child: DefaultTextStyle(
            style: _getTextStyle(colors, theme.typography),
            child: child,
          ),
        ),
        if (trailing != null) ...[
          SizedBox(width: theme.spacing.sm),
          trailing!,
        ],
      ],
    );
  }

  Color _getBackgroundColor(TinaColorScheme colors) {
    if (!enabled) return colors.outlineVariant;

    return switch (variant) {
      TinaTileVariant.primary => colors.primary,
      TinaTileVariant.secondary => colors.secondary,
      TinaTileVariant.surface => colors.surface,
      TinaTileVariant.outlined => Colors.transparent,
      TinaTileVariant.ghost => Colors.transparent,
      TinaTileVariant.success => colors.success,
      TinaTileVariant.warning => colors.warning,
      TinaTileVariant.error => colors.error,
      TinaTileVariant.info => colors.info,
    };
  }

  Border? _getBorder(TinaColorScheme colors) {
    if (variant == TinaTileVariant.outlined) {
      return Border.all(
        color: enabled ? colors.outline : colors.outlineVariant,
      );
    }
    return null;
  }

  List<BoxShadow> _getBoxShadow() {
    if (variant == TinaTileVariant.surface) {
      return [DesignShadows.sm];
    }
    return [];
  }

  Color _getLoadingColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaTileVariant.primary => colors.onPrimary,
      TinaTileVariant.secondary => colors.onSecondary,
      TinaTileVariant.surface => colors.onSurface,
      TinaTileVariant.outlined => colors.primary,
      TinaTileVariant.ghost => colors.primary,
      TinaTileVariant.success => colors.onSuccess,
      TinaTileVariant.warning => colors.onWarning,
      TinaTileVariant.error => colors.onError,
      TinaTileVariant.info => colors.onInfo,
    };
  }

  TextStyle _getTextStyle(
    TinaColorScheme colors,
    TinaTypographyTheme typography,
  ) {
    final fontSize = switch (size) {
      TinaTileSize.small => typography.sizes.sm,
      TinaTileSize.medium => typography.sizes.base,
      TinaTileSize.large => typography.sizes.lg,
    };

    final fontWeight = switch (size) {
      TinaTileSize.small => typography.weights.medium,
      TinaTileSize.medium => typography.weights.medium,
      TinaTileSize.large => typography.weights.semibold,
    };

    Color textColor;
    if (!enabled) {
      textColor = colors.onSurfaceVariant;
    } else {
      textColor = switch (variant) {
        TinaTileVariant.primary => colors.onPrimary,
        TinaTileVariant.secondary => colors.onSecondary,
        TinaTileVariant.surface => colors.onSurface,
        TinaTileVariant.outlined => colors.onSurface,
        TinaTileVariant.ghost => colors.primary,
        TinaTileVariant.success => colors.onSuccess,
        TinaTileVariant.warning => colors.onWarning,
        TinaTileVariant.error => colors.onError,
        TinaTileVariant.info => colors.onInfo,
      };
    }

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor,
      height: typography.lineHeights.base,
    );
  }

  EdgeInsets _getPadding(TinaSpacingTheme spacing) {
    return switch (size) {
      TinaTileSize.small => EdgeInsets.symmetric(
        horizontal: spacing.md,
        vertical: spacing.sm,
      ),
      TinaTileSize.medium => EdgeInsets.symmetric(
        horizontal: spacing.lg,
        vertical: spacing.md,
      ),
      TinaTileSize.large => EdgeInsets.symmetric(
        horizontal: spacing.xl,
        vertical: spacing.lg,
      ),
    };
  }
}

/// The visual variant of a [TinaTile].
enum TinaTileVariant {
  /// A filled tile with primary color background.
  primary,

  /// A filled tile with secondary color background.
  secondary,

  /// A tile with surface background and subtle shadow.
  surface,

  /// A tile with transparent background and border.
  outlined,

  /// A tile with transparent background and no border.
  ghost,

  /// A tile with success color background.
  success,

  /// A tile with warning color background.
  warning,

  /// A tile with error color background.
  error,

  /// A tile with info color background.
  info,
}

/// The size of a [TinaTile].
enum TinaTileSize {
  /// A small tile.
  small,

  /// A medium tile (default).
  medium,

  /// A large tile.
  large,
}
