import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable floating action button component following the Tina design
/// system.
///
/// This FAB supports different sizes, icons, extended variants with text,
/// and proper elevation and shadows.
class TinaFloatingActionButton extends StatelessWidget {
  /// Creates a Tina floating action button.
  const TinaFloatingActionButton({
    required this.onPressed,
    required this.icon,
    super.key,
    this.size = TinaFABSize.regular,
    this.backgroundColor,
    this.foregroundColor,
    this.semanticLabel,
    this.tooltip,
  }) : text = null;

  /// Creates an extended Tina floating action button with text.
  const TinaFloatingActionButton.extended({
    required this.onPressed,
    required this.icon,
    required this.text,
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.semanticLabel,
    this.tooltip,
  }) : size = TinaFABSize.extended;

  /// The callback that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// The icon to display.
  final IconData icon;

  /// The text to display (only for extended variant).
  final String? text;

  /// The size of the FAB.
  final TinaFABSize size;

  /// The background color of the FAB. If null, uses the primary color.
  final Color? backgroundColor;

  /// The foreground color of the FAB. If null, uses the primary contrast color.
  final Color? foregroundColor;

  /// A semantic label for the FAB for accessibility.
  final String? semanticLabel;

  /// The tooltip message to display when the FAB is long-pressed.
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final isExtended = size == TinaFABSize.extended;

    Widget fab = FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? tinaColors.primary,
      foregroundColor: foregroundColor ?? tinaColors.onPrimary,
      elevation: _getElevation(),
      focusElevation: _getFocusElevation(),
      hoverElevation: _getHoverElevation(),
      highlightElevation: _getHighlightElevation(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius()),
      ),
      child: isExtended
          ? _buildExtendedContent(tinaColors)
          : _buildRegularContent(tinaColors),
    );

    // Override size for mini and large variants
    if (size == TinaFABSize.mini || size == TinaFABSize.large) {
      fab = SizedBox(
        width: _getFABSize(),
        height: _getFABSize(),
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor ?? tinaColors.primary,
          foregroundColor: foregroundColor ?? tinaColors.onPrimary,
          elevation: _getElevation(),
          focusElevation: _getFocusElevation(),
          hoverElevation: _getHoverElevation(),
          highlightElevation: _getHighlightElevation(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_getBorderRadius()),
          ),
          child: _buildRegularContent(tinaColors),
        ),
      );
    }

    if (isExtended) {
      fab = FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: backgroundColor ?? tinaColors.primary,
        foregroundColor: foregroundColor ?? tinaColors.onPrimary,
        elevation: _getElevation(),
        focusElevation: _getFocusElevation(),
        hoverElevation: _getHoverElevation(),
        highlightElevation: _getHighlightElevation(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        icon: TinaIcon(
          icon,
          color: foregroundColor ?? tinaColors.onPrimary,
        ),
        label: TinaText(
          text!,
          color: foregroundColor ?? tinaColors.onPrimary,
          fontWeight: DesignTypography.fontWeightMedium,
        ),
      );
    }

    if (tooltip != null) {
      fab = Tooltip(
        message: tooltip,
        child: fab,
      );
    }

    if (semanticLabel != null) {
      fab = Semantics(
        label: semanticLabel,
        button: true,
        child: fab,
      );
    }

    return fab;
  }

  Widget _buildRegularContent(TinaColorScheme tinaColors) {
    return TinaIcon(
      icon,
      size: _getIconSize(),
      color: foregroundColor ?? tinaColors.onPrimary,
    );
  }

  Widget _buildExtendedContent(TinaColorScheme tinaColors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TinaIcon(
          icon,
          color: foregroundColor ?? tinaColors.onPrimary,
        ),
        const SizedBox(width: DesignSpacing.sm),
        TinaText(
          text!,
          color: foregroundColor ?? tinaColors.onPrimary,
          fontWeight: DesignTypography.fontWeightMedium,
        ),
      ],
    );
  }

  double _getFABSize() {
    return switch (size) {
      TinaFABSize.mini => 40.0,
      TinaFABSize.regular => 56.0,
      TinaFABSize.large => 72.0,
      TinaFABSize.extended => 56.0, // Height for extended
    };
  }

  TinaIconSize _getIconSize() {
    return switch (size) {
      TinaFABSize.mini => TinaIconSize.small,
      TinaFABSize.regular => TinaIconSize.medium,
      TinaFABSize.large => TinaIconSize.large,
      TinaFABSize.extended => TinaIconSize.medium,
    };
  }

  double _getBorderRadius() {
    return switch (size) {
      TinaFABSize.mini => DesignBorderRadius.lg,
      TinaFABSize.regular => DesignBorderRadius.xl,
      TinaFABSize.large => DesignBorderRadius.xl,
      TinaFABSize.extended => DesignBorderRadius.xl,
    };
  }

  double _getElevation() {
    return DesignElevation.md;
  }

  double _getFocusElevation() {
    return DesignElevation.lg;
  }

  double _getHoverElevation() {
    return DesignElevation.lg;
  }

  double _getHighlightElevation() {
    return DesignElevation.xl;
  }
}

/// The size of a [TinaFloatingActionButton].
enum TinaFABSize {
  /// Mini FAB (40x40).
  mini,

  /// Regular FAB (56x56) - default.
  regular,

  /// Large FAB (72x72).
  large,

  /// Extended FAB with text.
  extended,
}
