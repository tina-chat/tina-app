import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable card container component following the Tina design system.
///
/// This card provides consistent styling with different elevations, rounded
/// corners,
/// and padding variants for content organization.
class TinaCard extends StatelessWidget {
  /// Creates a Tina card.
  const TinaCard({
    required this.child,
    super.key,
    this.elevation = TinaCardElevation.sm,
    this.padding = TinaCardPadding.medium,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.semanticLabel,
  });

  /// Creates a Tina card with no padding.
  const TinaCard.noPadding({
    required this.child,
    super.key,
    this.elevation = TinaCardElevation.sm,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.semanticLabel,
  }) : padding = TinaCardPadding.none;

  /// Creates a Tina card with compact padding.
  const TinaCard.compact({
    required this.child,
    super.key,
    this.elevation = TinaCardElevation.sm,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.semanticLabel,
  }) : padding = TinaCardPadding.small;

  /// Creates a Tina card with spacious padding.
  const TinaCard.spacious({
    required this.child,
    super.key,
    this.elevation = TinaCardElevation.sm,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.semanticLabel,
  }) : padding = TinaCardPadding.large;

  /// The widget to display inside the card.
  final Widget child;

  /// The elevation of the card.
  final TinaCardElevation elevation;

  /// The padding inside the card.
  final TinaCardPadding padding;

  /// The background color of the card. If null, uses the surface color.
  final Color? backgroundColor;

  /// The border color of the card. If null, no border is displayed.
  final Color? borderColor;

  /// The callback that is called when the card is tapped.
  final VoidCallback? onTap;

  /// A semantic label for the card for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final cardBackgroundColor =
        backgroundColor ?? _getDefaultBackgroundColor(tinaColors);

    Widget card = Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(DesignBorderRadius.lg),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
              )
            : null,
        boxShadow: _getBoxShadow(),
      ),
      child: child,
    );

    if (onTap != null) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(DesignBorderRadius.lg),
          child: card,
        ),
      );
    }

    if (semanticLabel != null) {
      card = Semantics(
        label: semanticLabel,
        container: true,
        child: card,
      );
    }

    return card;
  }

  EdgeInsets _getPadding() {
    return switch (padding) {
      TinaCardPadding.none => EdgeInsets.zero,
      TinaCardPadding.small => const EdgeInsets.all(DesignSpacing.sm),
      TinaCardPadding.medium => const EdgeInsets.all(DesignSpacing.md),
      TinaCardPadding.large => const EdgeInsets.all(DesignSpacing.lg),
    };
  }

  List<BoxShadow> _getBoxShadow() {
    return switch (elevation) {
      TinaCardElevation.none => [],
      TinaCardElevation.sm => [DesignShadows.sm],
      TinaCardElevation.md => [DesignShadows.md],
      TinaCardElevation.lg => [DesignShadows.lg],
      TinaCardElevation.xl => [DesignShadows.xl],
    };
  }

  Color _getDefaultBackgroundColor(TinaColorScheme colors) {
    return colors.surface;
  }
}

/// The elevation of a [TinaCard].
enum TinaCardElevation {
  /// No elevation.
  none,

  /// Small elevation with subtle shadow.
  sm,

  /// Medium elevation (default).
  md,

  /// Large elevation with prominent shadow.
  lg,

  /// Extra large elevation with strong shadow.
  xl,
}

/// The padding of a [TinaCard].
enum TinaCardPadding {
  /// No padding.
  none,

  /// Small padding.
  small,

  /// Medium padding (default).
  medium,

  /// Large padding.
  large,
}
