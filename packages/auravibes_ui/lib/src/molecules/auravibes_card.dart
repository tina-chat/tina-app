import 'package:auravibes_ui/src/atoms/atoms.dart';
import 'package:auravibes_ui/src/atoms/auravibes_pressable.dart';
import 'package:auravibes_ui/src/tokens/auravibes_theme.dart';
import 'package:auravibes_ui/src/tokens/design_tokens.dart';
import 'package:flutter/material.dart';

/// A customizable card container component following the Aura design system.
///
/// This card provides consistent styling with different elevations, rounded
/// corners,
/// and padding variants for content organization.
class AuraCard extends StatelessWidget {
  /// Creates a Aura card.
  const AuraCard({
    required this.child,
    super.key,
    this.padding = .medium,
    this.onTap,
    this.semanticLabel,
    this.style = AuraCardStyle.border,
  });

  /// The widget to display inside the card.
  final Widget child;

  /// The padding inside the card.
  final AuraEdgeInsetsGeometry padding;

  /// The callback that is called when the card is tapped.
  final VoidCallback? onTap;

  /// A semantic label for the card for accessibility.
  final String? semanticLabel;

  /// style of card
  final AuraCardStyle? style;

  @override
  Widget build(BuildContext context) {
    final auraColors = context.auraColors;
    final cardBackgroundColor = _getDefaultBackgroundColor(auraColors);

    final isBorder = style == AuraCardStyle.border;

    Widget card = AuraPressable(
      color: auraColors.primary,
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
      child: AuraPadding(
        padding: padding,
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

  Color _getDefaultBackgroundColor(AuraColorScheme colors) {
    return colors.surface;
  }
}

/// Aura Card Style
enum AuraCardStyle {
  /// Card With border
  border,
}
