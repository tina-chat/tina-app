import 'package:flutter/material.dart';
import 'package:tina_ui/src/internal/tina_pressable.dart';
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
    this.padding = TinaCardPadding.medium,
    this.onTap,
    this.semanticLabel,
    this.style = TinaCardStyle.border,
  });

  /// Creates a Tina card with no padding.
  const TinaCard.noPadding({
    required this.child,
    super.key,
    this.onTap,
    this.semanticLabel,
    this.style,
  }) : padding = TinaCardPadding.none;

  /// Creates a Tina card with compact padding.
  const TinaCard.compact({
    required this.child,
    super.key,

    this.onTap,
    this.semanticLabel,
    this.style,
  }) : padding = TinaCardPadding.small;

  /// Creates a Tina card with spacious padding.
  const TinaCard.spacious({
    required this.child,
    super.key,
    this.onTap,
    this.semanticLabel,
    this.style,
  }) : padding = TinaCardPadding.large;

  /// The widget to display inside the card.
  final Widget child;

  /// The padding inside the card.
  final TinaCardPadding padding;

  /// The callback that is called when the card is tapped.
  final VoidCallback? onTap;

  /// A semantic label for the card for accessibility.
  final String? semanticLabel;

  /// style of card
  final TinaCardStyle? style;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final cardBackgroundColor = _getDefaultBackgroundColor(tinaColors);

    final isBorder = style == TinaCardStyle.border;

    Widget card = TinaPressable(
      color: tinaColors.primary,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(DesignBorderRadius.xl),
        border: isBorder
            ? Border.all(
                // ~6–8% black on light surfaces looks like the mock
                color: Colors.black.withValues(alpha: .06),
              )
            : null,
        boxShadow: isBorder
            ? const [] // border-only, almost flush
            : [
                // wide ambient
                BoxShadow(
                  color: Colors.black.withValues(alpha: .06),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
                // tiny contact shadow for crisp edge
                BoxShadow(
                  color: Colors.black.withValues(alpha: .02),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      onPressed: onTap,
      child: Container(
        padding: _getPadding(),
        child: child,
      ),
    );

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

  Color _getDefaultBackgroundColor(TinaColorScheme colors) {
    return colors.surface;
  }
}

/// Tina Card Style
enum TinaCardStyle {
  /// Card With border
  border,
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
