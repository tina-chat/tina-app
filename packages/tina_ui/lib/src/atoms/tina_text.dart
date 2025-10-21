import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A text widget that follows the Tina design system typography scale.
///
/// This widget provides consistent typography across the application by using
/// predefined text styles based on the design tokens.
class TinaText extends StatelessWidget {
  /// Creates a Tina text widget.
  const TinaText({
    required this.child,
    super.key,
    this.style = TinaTextStyle.body,
    this.textAlign,
    this.color,
  });

  /// The text to display.
  final Widget child;

  /// The style variant to apply to the text.
  final TinaTextStyle style;

  /// Aligmnet
  final TextAlign? textAlign;

  /// enum color options
  final TinaTextColor? color;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final textStyle = _getTextStyle(
      tinaColors,
    ).copyWith(color: _getColor(context));

    final iconData = IconThemeData(color: _getColor(context));

    return DefaultTextStyle.merge(
      style: textStyle,
      child: IconTheme(data: iconData, child: child),
      textAlign: textAlign,
    );
  }

  TextStyle _getTextStyle(TinaColorScheme colors) {
    const fontFamily = DesignTypography.bodyFontFamily;

    return switch (style) {
      TinaTextStyle.heading1 => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSize5Xl,
        fontWeight: DesignTypography.fontWeightBold,
        height: DesignTypography.lineHeight5Xl,
        letterSpacing: DesignTypography.letterSpacingTight,
        color: colors.onBackground,
      ),
      TinaTextStyle.heading2 => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSize4Xl,
        fontWeight: DesignTypography.fontWeightBold,
        height: DesignTypography.lineHeight4Xl,
        letterSpacing: DesignTypography.letterSpacingTight,
        color: colors.onBackground,
      ),
      TinaTextStyle.heading3 => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSize3Xl,
        fontWeight: DesignTypography.fontWeightSemibold,
        height: DesignTypography.lineHeight3Xl,
        letterSpacing: DesignTypography.letterSpacingTight,
        color: colors.onBackground,
      ),
      TinaTextStyle.heading4 => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSize2Xl,
        fontWeight: DesignTypography.fontWeightSemibold,
        height: DesignTypography.lineHeight2Xl,
        letterSpacing: DesignTypography.letterSpacingNormal,
        color: colors.onBackground,
      ),
      TinaTextStyle.heading5 => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeXl,
        fontWeight: DesignTypography.fontWeightSemibold,
        height: DesignTypography.lineHeightXl,
        letterSpacing: DesignTypography.letterSpacingNormal,
        color: colors.onBackground,
      ),
      TinaTextStyle.heading6 => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeLg,
        fontWeight: DesignTypography.fontWeightSemibold,
        height: DesignTypography.lineHeightLg,
        letterSpacing: DesignTypography.letterSpacingNormal,
        color: colors.onBackground,
      ),
      TinaTextStyle.bodyLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeLg,
        fontWeight: DesignTypography.fontWeightRegular,
        height: DesignTypography.lineHeightLg,
        letterSpacing: DesignTypography.letterSpacingNormal,
        color: colors.onSurface,
      ),
      TinaTextStyle.body => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeBase,
        fontWeight: DesignTypography.fontWeightRegular,
        height: DesignTypography.lineHeightBase,
        letterSpacing: DesignTypography.letterSpacingNormal,
        color: colors.onSurface,
      ),
      TinaTextStyle.bodySmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeSm,
        fontWeight: DesignTypography.fontWeightRegular,
        height: DesignTypography.lineHeightSm,
        letterSpacing: DesignTypography.letterSpacingNormal,
        color: colors.onSurfaceVariant,
      ),
      TinaTextStyle.caption => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeXs,
        fontWeight: DesignTypography.fontWeightRegular,
        height: DesignTypography.lineHeightXs,
        letterSpacing: DesignTypography.letterSpacingWide,
        color: colors.onSurfaceVariant,
      ),
      TinaTextStyle.overline => TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeXs,
        fontWeight: DesignTypography.fontWeightMedium,
        height: DesignTypography.lineHeightXs,
        letterSpacing: DesignTypography.letterSpacingWide,
        color: colors.onSurfaceVariant,
      ),
      TinaTextStyle.button => const TextStyle(
        fontFamily: fontFamily,
        fontSize: DesignTypography.fontSizeBase,
        fontWeight: DesignTypography.fontWeightMedium,
        height: DesignTypography.lineHeightBase,
        letterSpacing: DesignTypography.letterSpacingWide,
      ),
      TinaTextStyle.code => TextStyle(
        fontFamily: DesignTypography.monoFontFamily,
        fontSize: DesignTypography.fontSizeSm,
        fontWeight: DesignTypography.fontWeightRegular,
        height: DesignTypography.lineHeightSm,
        letterSpacing: DesignTypography.letterSpacingNormal,
        color: colors.onSurface,
      ),
    };
  }

  Color? _getColor(BuildContext context) {
    final tinaColors = context.tinaColors;
    return switch (color) {
      null => null,
      TinaTextColor.primary => tinaColors.primary,
      TinaTextColor.onSurface => tinaColors.onSurface,
      TinaTextColor.error => tinaColors.error,
      TinaTextColor.onSurfaceVariant => tinaColors.onSurfaceVariant,
      TinaTextColor.onPrimary => tinaColors.onSurfaceVariant,
    };
  }
}

/// The style variant for [TinaText].
enum TinaTextStyle {
  /// Large heading text (48px).
  heading1,

  /// Medium heading text (36px).
  heading2,

  /// Small heading text (30px).
  heading3,

  /// Extra small heading text (24px).
  heading4,

  /// Tiny heading text (20px).
  heading5,

  /// Micro heading text (18px).
  heading6,

  /// Large body text (18px).
  bodyLarge,

  /// Default body text (16px).
  body,

  /// Small body text (14px).
  bodySmall,

  /// Caption text (12px).
  caption,

  /// Overline text (12px, uppercase).
  overline,

  /// Button text (16px, medium weight).
  button,

  /// Code text (14px, monospace).
  code,
}

/// Options for colors
enum TinaTextColor {
  /// primary
  primary,

  /// on surface option
  onSurface,

  /// on surface variant option
  onSurfaceVariant,

  /// error option
  error,

  /// on primary option
  onPrimary,
}
