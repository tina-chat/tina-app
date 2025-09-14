import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A text widget that follows the Tina design system typography scale.
///
/// This widget provides consistent typography across the application by using
/// predefined text styles based on the design tokens.
class TinaText extends StatelessWidget {
  /// Creates a Tina text widget.
  const TinaText(
    this.text, {
    super.key,
    this.style = TinaTextStyle.body,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
  });

  /// The text to display.
  final String text;

  /// The style variant to apply to the text.
  final TinaTextStyle style;

  /// The color to use for the text. If null, uses the default color for the
  /// style.
  final Color? color;

  /// The font weight to use for the text. If null, uses the default weight for
  /// the style.
  final FontWeight? fontWeight;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// An optional maximum number of lines for the text to span.
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// An alternative semantics label for this text.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final textStyle = _getTextStyle(tinaColors);

    return Text(
      text,
      style: textStyle.copyWith(
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
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
