import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable badge component following the Tina design system.
///
/// This badge widget provides consistent styling for status indicators,
/// labels, and notification counts across the application.
class TinaBadge extends StatelessWidget {
  /// Creates a Tina badge.
  const TinaBadge({
    required this.child,
    super.key,
    this.variant = TinaBadgeVariant.primary,
    this.size = TinaBadgeSize.medium,
    this.semanticLabel,
  });

  /// Creates a Tina badge with text content.
  TinaBadge.text({
    required String text,
    Key? key,
    TinaBadgeVariant variant = TinaBadgeVariant.primary,
    TinaBadgeSize size = TinaBadgeSize.medium,
    String? semanticLabel,
  }) : this(
         key: key,
         variant: variant,
         size: size,
         semanticLabel: semanticLabel,
         child: TinaText(
           style: size == TinaBadgeSize.small
               ? TinaTextStyle.caption
               : TinaTextStyle.bodySmall,
           child: Text(text),
         ),
       );

  /// Creates a Tina badge with a count number.
  TinaBadge.count({
    required int count,
    Key? key,
    TinaBadgeVariant variant = TinaBadgeVariant.primary,
    TinaBadgeSize size = TinaBadgeSize.medium,
    String? semanticLabel,
    int maxCount = 99,
  }) : this(
         key: key,
         variant: variant,
         size: size,
         semanticLabel: semanticLabel ?? '$count notifications',
         child: TinaText(
           style: size == TinaBadgeSize.small
               ? TinaTextStyle.caption
               : TinaTextStyle.bodySmall,
           child: Text(count > maxCount ? '$maxCount+' : count.toString()),
         ),
       );

  /// Creates a Tina badge with a dot indicator.
  const TinaBadge.dot({
    Key? key,
    TinaBadgeVariant variant = TinaBadgeVariant.primary,
    String? semanticLabel,
  }) : this(
         key: key,
         variant: variant,
         size: TinaBadgeSize.small,
         semanticLabel: semanticLabel ?? 'notification indicator',
         child: const SizedBox(width: 6, height: 6),
       );

  /// The widget to display inside the badge.
  final Widget child;

  /// The visual variant of the badge.
  final TinaBadgeVariant variant;

  /// The size of the badge.
  final TinaBadgeSize size;

  /// A semantic label for the badge for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    Widget badge = Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(tinaColors),
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        border: variant == TinaBadgeVariant.outlined
            ? Border.all(
                color: _getBorderColor(tinaColors),
              )
            : null,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: _getForegroundColor(tinaColors),
          fontWeight: DesignTypography.fontWeightMedium,
        ),
        child: child,
      ),
    );

    if (semanticLabel != null) {
      badge = Semantics(
        label: semanticLabel,
        child: badge,
      );
    }

    return badge;
  }

  EdgeInsets _getPadding() {
    return switch (size) {
      TinaBadgeSize.small => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.xs,
        vertical: 2,
      ),
      TinaBadgeSize.medium => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.sm,
        vertical: DesignSpacing.xs,
      ),
      TinaBadgeSize.large => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.sm,
        vertical: DesignSpacing.xs,
      ),
    };
  }

  double _getBorderRadius() {
    return switch (size) {
      TinaBadgeSize.small => DesignBorderRadius.sm,
      TinaBadgeSize.medium => DesignBorderRadius.sm,
      TinaBadgeSize.large => DesignBorderRadius.md,
    };
  }

  Color _getBackgroundColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaBadgeVariant.primary => colors.primary,
      TinaBadgeVariant.secondary => colors.secondary,
      TinaBadgeVariant.success => colors.success,
      TinaBadgeVariant.warning => colors.warning,
      TinaBadgeVariant.error => colors.error,
      TinaBadgeVariant.info => colors.info,
      TinaBadgeVariant.neutral => colors.onSurfaceVariant,
      TinaBadgeVariant.outlined => Colors.transparent,
      TinaBadgeVariant.soft => _getSoftBackgroundColor(colors),
    };
  }

  Color _getForegroundColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaBadgeVariant.primary => colors.onPrimary,
      TinaBadgeVariant.secondary => colors.onSecondary,
      TinaBadgeVariant.success => colors.onSuccess,
      TinaBadgeVariant.warning => colors.onWarning,
      TinaBadgeVariant.error => colors.onError,
      TinaBadgeVariant.info => colors.onInfo,
      TinaBadgeVariant.neutral => colors.onSurface,
      TinaBadgeVariant.outlined => _getOutlinedForegroundColor(colors),
      TinaBadgeVariant.soft => _getSoftForegroundColor(colors),
    };
  }

  Color _getBorderColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaBadgeVariant.primary => colors.primary,
      TinaBadgeVariant.secondary => colors.secondary,
      TinaBadgeVariant.success => colors.success,
      TinaBadgeVariant.warning => colors.warning,
      TinaBadgeVariant.error => colors.error,
      TinaBadgeVariant.info => colors.info,
      TinaBadgeVariant.neutral => colors.onSurfaceVariant,
      TinaBadgeVariant.outlined => colors.outline,
      TinaBadgeVariant.soft => Colors.transparent,
    };
  }

  Color _getSoftBackgroundColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaBadgeVariant.primary => colors.primary.withValues(alpha: 0.1),
      TinaBadgeVariant.secondary => colors.secondary.withValues(alpha: 0.1),
      TinaBadgeVariant.success => colors.success.withValues(alpha: 0.1),
      TinaBadgeVariant.warning => colors.warning.withValues(alpha: 0.1),
      TinaBadgeVariant.error => colors.error.withValues(alpha: 0.1),
      TinaBadgeVariant.info => colors.info.withValues(alpha: 0.1),
      TinaBadgeVariant.neutral => colors.onSurfaceVariant.withValues(
        alpha: 0.1,
      ),
      TinaBadgeVariant.outlined => colors.surfaceVariant,
      TinaBadgeVariant.soft => colors.primary.withValues(alpha: 0.1),
    };
  }

  Color _getSoftForegroundColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaBadgeVariant.primary => colors.primaryVariant,
      TinaBadgeVariant.secondary => colors.secondaryVariant,
      TinaBadgeVariant.success => colors.success,
      TinaBadgeVariant.warning => colors.warning,
      TinaBadgeVariant.error => colors.error,
      TinaBadgeVariant.info => colors.info,
      TinaBadgeVariant.neutral => colors.onSurfaceVariant,
      _ => colors.onSurfaceVariant,
    };
  }

  Color _getOutlinedForegroundColor(TinaColorScheme colors) {
    return switch (variant) {
      TinaBadgeVariant.primary => colors.primary,
      TinaBadgeVariant.secondary => colors.secondary,
      TinaBadgeVariant.success => colors.success,
      TinaBadgeVariant.warning => colors.warning,
      TinaBadgeVariant.error => colors.error,
      TinaBadgeVariant.info => colors.info,
      TinaBadgeVariant.neutral => colors.onSurfaceVariant,
      _ => colors.onSurfaceVariant,
    };
  }
}

/// A specialized badge component that can be positioned relative to another
/// widget.
///
/// This is commonly used for notification badges on icons or avatars.
class TinaPositionedBadge extends StatelessWidget {
  /// Creates a positioned Tina badge.
  const TinaPositionedBadge({
    required this.child,
    required this.badge,
    super.key,
    this.position = TinaBadgePosition.topRight,
    this.offset,
  });

  /// The widget to position the badge relative to.
  final Widget child;

  /// The badge to display.
  final TinaBadge badge;

  /// The position of the badge relative to the child.
  final TinaBadgePosition position;

  /// Optional offset to fine-tune the badge position.
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: _getTop(),
          right: _getRight(),
          bottom: _getBottom(),
          left: _getLeft(),
          child: badge,
        ),
      ],
    );
  }

  double? _getTop() {
    final baseOffset = offset?.dy ?? 0;
    return switch (position) {
      TinaBadgePosition.topLeft ||
      TinaBadgePosition.topRight => -8.0 + baseOffset,
      TinaBadgePosition.bottomLeft || TinaBadgePosition.bottomRight => null,
    };
  }

  double? _getRight() {
    final baseOffset = offset?.dx ?? 0;
    return switch (position) {
      TinaBadgePosition.topRight ||
      TinaBadgePosition.bottomRight => -8.0 + baseOffset,
      TinaBadgePosition.topLeft || TinaBadgePosition.bottomLeft => null,
    };
  }

  double? _getBottom() {
    final baseOffset = offset?.dy ?? 0;
    return switch (position) {
      TinaBadgePosition.bottomLeft ||
      TinaBadgePosition.bottomRight => -8.0 + baseOffset,
      TinaBadgePosition.topLeft || TinaBadgePosition.topRight => null,
    };
  }

  double? _getLeft() {
    final baseOffset = offset?.dx ?? 0;
    return switch (position) {
      TinaBadgePosition.topLeft ||
      TinaBadgePosition.bottomLeft => -8.0 + baseOffset,
      TinaBadgePosition.topRight || TinaBadgePosition.bottomRight => null,
    };
  }
}

/// The visual variant of a [TinaBadge].
enum TinaBadgeVariant {
  /// Primary color badge.
  primary,

  /// Secondary color badge.
  secondary,

  /// Success color badge (green).
  success,

  /// Warning color badge (yellow).
  warning,

  /// Error color badge (red).
  error,

  /// Info color badge (blue).
  info,

  /// Neutral color badge (gray).
  neutral,

  /// Badge with transparent background and border.
  outlined,

  /// Badge with soft background color.
  soft,
}

/// The size of a [TinaBadge].
enum TinaBadgeSize {
  /// Small badge.
  small,

  /// Medium badge (default).
  medium,

  /// Large badge.
  large,
}

/// The position of a [TinaPositionedBadge].
enum TinaBadgePosition {
  /// Top-left corner.
  topLeft,

  /// Top-right corner.
  topRight,

  /// Bottom-left corner.
  bottomLeft,

  /// Bottom-right corner.
  bottomRight,
}
