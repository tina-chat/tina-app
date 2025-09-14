import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';
import 'tina_text.dart';

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
            text,
            style: size == TinaBadgeSize.small 
                ? TinaTextStyle.caption 
                : TinaTextStyle.bodySmall,
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
            count > maxCount ? '$maxCount+' : count.toString(),
            style: size == TinaBadgeSize.small 
                ? TinaTextStyle.caption 
                : TinaTextStyle.bodySmall,
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
    final theme = Theme.of(context);
    
    Widget badge = Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        border: variant == TinaBadgeVariant.outlined
            ? Border.all(
                color: _getBorderColor(),
                width: DesignBorderWidth.thin,
              )
            : null,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: _getForegroundColor(),
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
          vertical: 2.0,
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

  Color _getBackgroundColor() {
    return switch (variant) {
      TinaBadgeVariant.primary => DesignColors.primaryBase,
      TinaBadgeVariant.secondary => DesignColors.secondaryBase,
      TinaBadgeVariant.success => DesignColors.success,
      TinaBadgeVariant.warning => DesignColors.warning,
      TinaBadgeVariant.error => DesignColors.error,
      TinaBadgeVariant.info => DesignColors.info,
      TinaBadgeVariant.neutral => DesignColors.neutral500,
      TinaBadgeVariant.outlined => Colors.transparent,
      TinaBadgeVariant.soft => _getSoftBackgroundColor(),
    };
  }

  Color _getForegroundColor() {
    return switch (variant) {
      TinaBadgeVariant.primary => DesignColors.primaryContrast,
      TinaBadgeVariant.secondary => DesignColors.secondaryContrast,
      TinaBadgeVariant.success => Colors.white,
      TinaBadgeVariant.warning => Colors.white,
      TinaBadgeVariant.error => Colors.white,
      TinaBadgeVariant.info => Colors.white,
      TinaBadgeVariant.neutral => Colors.white,
      TinaBadgeVariant.outlined => _getOutlinedForegroundColor(),
      TinaBadgeVariant.soft => _getSoftForegroundColor(),
    };
  }

  Color _getBorderColor() {
    return switch (variant) {
      TinaBadgeVariant.primary => DesignColors.primaryBase,
      TinaBadgeVariant.secondary => DesignColors.secondaryBase,
      TinaBadgeVariant.success => DesignColors.success,
      TinaBadgeVariant.warning => DesignColors.warning,
      TinaBadgeVariant.error => DesignColors.error,
      TinaBadgeVariant.info => DesignColors.info,
      TinaBadgeVariant.neutral => DesignColors.neutral500,
      TinaBadgeVariant.outlined => DesignColors.neutral300,
      TinaBadgeVariant.soft => Colors.transparent,
    };
  }

  Color _getSoftBackgroundColor() {
    return switch (variant) {
      TinaBadgeVariant.primary => DesignColors.primaryBase.withOpacity(0.1),
      TinaBadgeVariant.secondary => DesignColors.secondaryBase.withOpacity(0.1),
      TinaBadgeVariant.success => DesignColors.success.withOpacity(0.1),
      TinaBadgeVariant.warning => DesignColors.warning.withOpacity(0.1),
      TinaBadgeVariant.error => DesignColors.error.withOpacity(0.1),
      TinaBadgeVariant.info => DesignColors.info.withOpacity(0.1),
      TinaBadgeVariant.neutral => DesignColors.neutral500.withOpacity(0.1),
      TinaBadgeVariant.outlined => DesignColors.neutral100,
      TinaBadgeVariant.soft => DesignColors.primaryBase.withOpacity(0.1),
    };
  }

  Color _getSoftForegroundColor() {
    return switch (variant) {
      TinaBadgeVariant.primary => DesignColors.primaryDark,
      TinaBadgeVariant.secondary => DesignColors.secondaryDark,
      TinaBadgeVariant.success => DesignColors.success,
      TinaBadgeVariant.warning => DesignColors.warning,
      TinaBadgeVariant.error => DesignColors.error,
      TinaBadgeVariant.info => DesignColors.info,
      TinaBadgeVariant.neutral => DesignColors.neutral700,
      _ => DesignColors.neutral700,
    };
  }

  Color _getOutlinedForegroundColor() {
    return switch (variant) {
      TinaBadgeVariant.primary => DesignColors.primaryBase,
      TinaBadgeVariant.secondary => DesignColors.secondaryBase,
      TinaBadgeVariant.success => DesignColors.success,
      TinaBadgeVariant.warning => DesignColors.warning,
      TinaBadgeVariant.error => DesignColors.error,
      TinaBadgeVariant.info => DesignColors.info,
      TinaBadgeVariant.neutral => DesignColors.neutral500,
      _ => DesignColors.neutral700,
    };
  }
}

/// A specialized badge component that can be positioned relative to another widget.
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
      TinaBadgePosition.topLeft || TinaBadgePosition.topRight => -8.0 + baseOffset,
      TinaBadgePosition.bottomLeft || TinaBadgePosition.bottomRight => null,
    };
  }

  double? _getRight() {
    final baseOffset = offset?.dx ?? 0;
    return switch (position) {
      TinaBadgePosition.topRight || TinaBadgePosition.bottomRight => -8.0 + baseOffset,
      TinaBadgePosition.topLeft || TinaBadgePosition.bottomLeft => null,
    };
  }

  double? _getBottom() {
    final baseOffset = offset?.dy ?? 0;
    return switch (position) {
      TinaBadgePosition.bottomLeft || TinaBadgePosition.bottomRight => -8.0 + baseOffset,
      TinaBadgePosition.topLeft || TinaBadgePosition.topRight => null,
    };
  }

  double? _getLeft() {
    final baseOffset = offset?.dx ?? 0;
    return switch (position) {
      TinaBadgePosition.topLeft || TinaBadgePosition.bottomLeft => -8.0 + baseOffset,
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