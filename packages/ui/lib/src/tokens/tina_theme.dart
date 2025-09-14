import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

/// Tina theme extension that provides theme-aware design tokens.
///
/// This extension adds semantic color tokens that automatically adapt to
/// light and dark themes, ensuring consistent UI across different themes.
@immutable
class TinaTheme extends ThemeExtension<TinaTheme> {
  /// Creates a Tina theme extension.
  const TinaTheme({
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.borderRadius,
    required this.elevation,
    required this.animation,
  });

  /// Light theme variant.
  static const light = TinaTheme(
    colors: _lightColors,
    typography: _standardTypography,
    spacing: _standardSpacing,
    borderRadius: _standardBorderRadius,
    elevation: _standardElevation,
    animation: _standardAnimation,
  );

  /// Dark theme variant.
  static const dark = TinaTheme(
    colors: _darkColors,
    typography: _standardTypography,
    spacing: _standardSpacing,
    borderRadius: _standardBorderRadius,
    elevation: _standardElevation,
    animation: _standardAnimation,
  );

  static const _lightColors = TinaColorScheme._light();
  static const _darkColors = TinaColorScheme._dark();
  static const _standardTypography = TinaTypographyTheme._standard();
  static const _standardSpacing = TinaSpacingTheme._standard();
  static const _standardBorderRadius = TinaBorderRadiusTheme._standard();
  static const _standardElevation = TinaElevationTheme._standard();
  static const _standardAnimation = TinaAnimationTheme._standard();

  /// Color scheme for the theme.
  final TinaColorScheme colors;

  /// Typography theme.
  final TinaTypographyTheme typography;

  /// Spacing theme.
  final TinaSpacingTheme spacing;

  /// Border radius theme.
  final TinaBorderRadiusTheme borderRadius;

  /// Elevation theme.
  final TinaElevationTheme elevation;

  /// Animation theme.
  final TinaAnimationTheme animation;

  @override
  TinaTheme copyWith({
    TinaColorScheme? colors,
    TinaTypographyTheme? typography,
    TinaSpacingTheme? spacing,
    TinaBorderRadiusTheme? borderRadius,
    TinaElevationTheme? elevation,
    TinaAnimationTheme? animation,
  }) {
    return TinaTheme(
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      spacing: spacing ?? this.spacing,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      animation: animation ?? this.animation,
    );
  }

  @override
  TinaTheme lerp(TinaTheme? other, double t) {
    if (other == null) return this;
    return TinaTheme(
      colors: colors.lerp(other.colors, t),
      typography: typography.lerp(other.typography, t),
      spacing: spacing.lerp(other.spacing, t),
      borderRadius: borderRadius.lerp(other.borderRadius, t),
      elevation: elevation.lerp(other.elevation, t),
      animation: animation.lerp(other.animation, t),
    );
  }
}

/// Color scheme that adapts to light and dark themes.
@immutable
class TinaColorScheme {
  /// Creates a [TinaColorScheme] with the specified colors.
  const TinaColorScheme({
    required this.primary,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.onSecondary,
    required this.surface,
    required this.surfaceVariant,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.warning,
    required this.onWarning,
    required this.success,
    required this.onSuccess,
    required this.info,
    required this.onInfo,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
  });

  /// Creates a light color scheme.
  const TinaColorScheme._light()
    : primary = DesignColors.primaryBase,
      primaryVariant = DesignColors.primaryDark,
      onPrimary = DesignColors.primaryContrast,
      secondary = DesignColors.secondaryBase,
      secondaryVariant = DesignColors.secondaryDark,
      onSecondary = DesignColors.secondaryContrast,
      surface = DesignColors.neutral50,
      surfaceVariant = DesignColors.neutral100,
      onSurface = DesignColors.neutral900,
      onSurfaceVariant = DesignColors.neutral700,
      background = const Color(0xFFFFFFFF),
      onBackground = DesignColors.neutral900,
      error = DesignColors.error,
      onError = const Color(0xFFFFFFFF),
      warning = DesignColors.warning,
      onWarning = const Color(0xFFFFFFFF),
      success = DesignColors.success,
      onSuccess = const Color(0xFFFFFFFF),
      info = DesignColors.info,
      onInfo = const Color(0xFFFFFFFF),
      outline = DesignColors.neutral300,
      outlineVariant = DesignColors.neutral200,
      shadow = DesignColors.neutral900,
      scrim = const Color(0x80000000),
      inverseSurface = DesignColors.neutral800,
      onInverseSurface = DesignColors.neutral100,
      inversePrimary = DesignColors.primaryLight;

  /// Creates a dark color scheme.
  const TinaColorScheme._dark()
    : primary = DesignColors.primaryLight,
      primaryVariant = DesignColors.primaryBase,
      onPrimary = DesignColors.neutral900,
      secondary = DesignColors.secondaryLight,
      secondaryVariant = DesignColors.secondaryBase,
      onSecondary = DesignColors.neutral900,
      surface = DesignColors.neutral800,
      surfaceVariant = DesignColors.neutral700,
      onSurface = DesignColors.neutral100,
      onSurfaceVariant = DesignColors.neutral300,
      background = DesignColors.neutral900,
      onBackground = DesignColors.neutral100,
      error = const Color(0xFFFF6B6B),
      onError = DesignColors.neutral900,
      warning = const Color(0xFFFFD93D),
      onWarning = DesignColors.neutral900,
      success = const Color(0xFF4ECDC4),
      onSuccess = DesignColors.neutral900,
      info = const Color(0xFF74C0FC),
      onInfo = DesignColors.neutral900,
      outline = DesignColors.neutral600,
      outlineVariant = DesignColors.neutral700,
      shadow = const Color(0xFF000000),
      scrim = const Color(0xB3000000),
      inverseSurface = DesignColors.neutral100,
      onInverseSurface = DesignColors.neutral800,
      inversePrimary = DesignColors.primaryDark;

  /// Primary color for main UI elements.
  final Color primary;

  /// Variant of the primary color for highlights.
  final Color primaryVariant;

  /// Color for text/icons on primary color.
  final Color onPrimary;

  /// Secondary color for accents.
  final Color secondary;

  /// Variant of the secondary color.
  final Color secondaryVariant;

  /// Color for text/icons on secondary color.
  final Color onSecondary;

  /// Background color for cards, sheets.
  final Color surface;

  /// Variant surface color.
  final Color surfaceVariant;

  /// Color for text/icons on surface.
  final Color onSurface;

  /// Color for text/icons on surface variants.
  final Color onSurfaceVariant;

  /// Background color for the app.
  final Color background;

  /// Color for text/icons on background.
  final Color onBackground;

  /// Error color.
  final Color error;

  /// Color for text/icons on error color.
  final Color onError;

  /// Warning color.
  final Color warning;

  /// Color for text/icons on warning color.
  final Color onWarning;

  /// Success color.
  final Color success;

  /// Color for text/icons on success color.
  final Color onSuccess;

  /// Info color.
  final Color info;

  /// Color for text/icons on info color.
  final Color onInfo;

  /// Outline color for borders.
  final Color outline;

  /// Variant outline color.
  final Color outlineVariant;

  /// Shadow color.
  final Color shadow;

  /// Scrim color for overlays.
  final Color scrim;

  /// Inverse surface color.
  final Color inverseSurface;

  /// Color for text/icons on inverse surface.
  final Color onInverseSurface;

  /// Inverse primary color.
  final Color inversePrimary;

  /// Linearly interpolate between two color schemes.
  TinaColorScheme lerp(TinaColorScheme other, double t) {
    return TinaColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryVariant: Color.lerp(
        secondaryVariant,
        other.secondaryVariant,
        t,
      )!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      onInverseSurface: Color.lerp(
        onInverseSurface,
        other.onInverseSurface,
        t,
      )!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
    );
  }
}

/// Typography theme that maintains consistency across themes.
@immutable
class TinaTypographyTheme {
  /// Creates a typography theme with the specified parameters.
  const TinaTypographyTheme({
    required this.fontFamily,
    required this.monoFontFamily,
    required this.sizes,
    required this.weights,
    required this.lineHeights,
    required this.letterSpacings,
  });

  /// Creates the standard typography theme.
  const TinaTypographyTheme._standard()
    : fontFamily = DesignTypography.bodyFontFamily,
      monoFontFamily = DesignTypography.monoFontFamily,
      sizes = const TinaFontSizes(),
      weights = const TinaFontWeights(),
      lineHeights = const TinaLineHeights(),
      letterSpacings = const TinaLetterSpacings();

  /// The primary font family used for body text.
  final String fontFamily;
  
  /// The monospace font family used for code and technical content.
  final String monoFontFamily;
  
  /// Font size tokens for different text scales.
  final TinaFontSizes sizes;
  
  /// Font weight tokens for typography hierarchy.
  final TinaFontWeights weights;
  
  /// Line height tokens for vertical rhythm.
  final TinaLineHeights lineHeights;
  
  /// Letter spacing tokens for text density control.
  final TinaLetterSpacings letterSpacings;

  /// Linearly interpolate between two typography themes.
  TinaTypographyTheme lerp(TinaTypographyTheme other, double t) {
    // Typography doesn't interpolate, return this or other based on t
    return t < 0.5 ? this : other;
  }
}

/// Font size tokens for typography theme.
///
/// Provides a consistent set of font sizes ranging from extra small (xs)
/// to extra large 5 (xl5) following the design system scale.
@immutable
class TinaFontSizes {
  /// Creates a font sizes theme with the specified values.
  const TinaFontSizes({
    this.xs = DesignTypography.fontSizeXs,
    this.sm = DesignTypography.fontSizeSm,
    this.base = DesignTypography.fontSizeBase,
    this.lg = DesignTypography.fontSizeLg,
    this.xl = DesignTypography.fontSizeXl,
    this.xl2 = DesignTypography.fontSize2Xl,
    this.xl3 = DesignTypography.fontSize3Xl,
    this.xl4 = DesignTypography.fontSize4Xl,
    this.xl5 = DesignTypography.fontSize5Xl,
  });

  /// Extra small font size (12px).
  final double xs;
  
  /// Small font size (14px).
  final double sm;
  
  /// Base font size (16px).
  final double base;
  
  /// Large font size (18px).
  final double lg;
  
  /// Extra large font size (20px).
  final double xl;
  
  /// 2x extra large font size (24px).
  final double xl2;
  
  /// 3x extra large font size (30px).
  final double xl3;
  
  /// 4x extra large font size (36px).
  final double xl4;
  
  /// 5x extra large font size (48px).
  final double xl5;
}

/// Font weight tokens for typography theme.
///
/// Defines the available font weights from light to bold,
/// ensuring consistent typography hierarchy across the application.
@immutable
class TinaFontWeights {
  const TinaFontWeights({
    this.light = DesignTypography.fontWeightLight,
    this.regular = DesignTypography.fontWeightRegular,
    this.medium = DesignTypography.fontWeightMedium,
    this.semibold = DesignTypography.fontWeightSemibold,
    this.bold = DesignTypography.fontWeightBold,
  });

  final FontWeight light;
  final FontWeight regular;
  final FontWeight medium;
  final FontWeight semibold;
  final FontWeight bold;
}

/// Line height tokens for typography theme.
///
/// Provides consistent line heights that correspond to font sizes,
/// maintaining proper vertical rhythm in text layout.
@immutable
class TinaLineHeights {
  const TinaLineHeights({
    this.xs = DesignTypography.lineHeightXs,
    this.sm = DesignTypography.lineHeightSm,
    this.base = DesignTypography.lineHeightBase,
    this.lg = DesignTypography.lineHeightLg,
    this.xl = DesignTypography.lineHeightXl,
    this.xl2 = DesignTypography.lineHeight2Xl,
    this.xl3 = DesignTypography.lineHeight3Xl,
    this.xl4 = DesignTypography.lineHeight4Xl,
    this.xl5 = DesignTypography.lineHeight5Xl,
  });

  final double xs;
  final double sm;
  final double base;
  final double lg;
  final double xl;
  final double xl2;
  final double xl3;
  final double xl4;
  final double xl5;
}

/// Letter spacing tokens for typography theme.
///
/// Defines tight, normal, and wide letter spacing values
/// for fine-tuning text readability and visual density.
@immutable
class TinaLetterSpacings {
  const TinaLetterSpacings({
    this.tight = DesignTypography.letterSpacingTight,
    this.normal = DesignTypography.letterSpacingNormal,
    this.wide = DesignTypography.letterSpacingWide,
  });

  final double tight;
  final double normal;
  final double wide;
}

/// Spacing theme that provides consistent spacing values.
///
/// Defines a scale of spacing values from extra small (xs) to extra large 3 (xl3)
/// used for margins, padding, and gaps throughout the application.
@immutable
class TinaSpacingTheme {
  const TinaSpacingTheme({
    this.xs = DesignSpacing.xs,
    this.sm = DesignSpacing.sm,
    this.md = DesignSpacing.md,
    this.lg = DesignSpacing.lg,
    this.xl = DesignSpacing.xl,
    this.xl2 = DesignSpacing.xl2,
    this.xl3 = DesignSpacing.xl3,
  });

  const TinaSpacingTheme._standard()
    : xs = DesignSpacing.xs,
      sm = DesignSpacing.sm,
      md = DesignSpacing.md,
      lg = DesignSpacing.lg,
      xl = DesignSpacing.xl,
      xl2 = DesignSpacing.xl2,
      xl3 = DesignSpacing.xl3;

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xl2;
  final double xl3;

  TinaSpacingTheme lerp(TinaSpacingTheme other, double t) {
    return TinaSpacingTheme(
      xs: lerpDouble(xs, other.xs, t) ?? xs,
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
      xl2: lerpDouble(xl2, other.xl2, t) ?? xl2,
      xl3: lerpDouble(xl3, other.xl3, t) ?? xl3,
    );
  }
}

/// Border radius theme that provides consistent corner radius values.
///
/// Defines border radius values from none (sharp corners) to full (circular),
/// ensuring consistent visual style across UI components.
@immutable
class TinaBorderRadiusTheme {
  const TinaBorderRadiusTheme({
    this.none = DesignBorderRadius.none,
    this.sm = DesignBorderRadius.sm,
    this.md = DesignBorderRadius.md,
    this.lg = DesignBorderRadius.lg,
    this.xl = DesignBorderRadius.xl,
    this.full = DesignBorderRadius.full,
  });

  const TinaBorderRadiusTheme._standard()
    : none = DesignBorderRadius.none,
      sm = DesignBorderRadius.sm,
      md = DesignBorderRadius.md,
      lg = DesignBorderRadius.lg,
      xl = DesignBorderRadius.xl,
      full = DesignBorderRadius.full;

  final double none;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double full;

  TinaBorderRadiusTheme lerp(TinaBorderRadiusTheme other, double t) {
    return TinaBorderRadiusTheme(
      none: lerpDouble(none, other.none, t) ?? none,
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
      full: lerpDouble(full, other.full, t) ?? full,
    );
  }
}

/// Elevation theme that provides consistent shadow depths.
///
/// Defines elevation values from none to extra large (xl) for creating
/// visual hierarchy and depth through Material Design shadow principles.
@immutable
class TinaElevationTheme {
  const TinaElevationTheme({
    this.none = DesignElevation.none,
    this.sm = DesignElevation.sm,
    this.md = DesignElevation.md,
    this.lg = DesignElevation.lg,
    this.xl = DesignElevation.xl,
  });

  const TinaElevationTheme._standard()
    : none = DesignElevation.none,
      sm = DesignElevation.sm,
      md = DesignElevation.md,
      lg = DesignElevation.lg,
      xl = DesignElevation.xl;

  final double none;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  TinaElevationTheme lerp(TinaElevationTheme other, double t) {
    return TinaElevationTheme(
      none: lerpDouble(none, other.none, t) ?? none,
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
    );
  }
}

/// Animation theme that provides consistent timing values.
///
/// Defines animation durations (fast, normal, slow) to ensure
/// cohesive motion design across the application.
@immutable
class TinaAnimationTheme {
  const TinaAnimationTheme({
    this.fast = DesignDuration.fast,
    this.normal = DesignDuration.normal,
    this.slow = DesignDuration.slow,
  });

  const TinaAnimationTheme._standard()
    : fast = DesignDuration.fast,
      normal = DesignDuration.normal,
      slow = DesignDuration.slow;

  final Duration fast;
  final Duration normal;
  final Duration slow;

  TinaAnimationTheme lerp(TinaAnimationTheme other, double t) {
    // Animation durations don't interpolate, return this or other based on t
    return t < 0.5 ? this : other;
  }
}

/// Extension to get Tina theme from BuildContext.
extension TinaThemeExtension on BuildContext {
  /// Get the current Tina theme.
  TinaTheme get tinaTheme =>
      Theme.of(this).extension<TinaTheme>() ?? TinaTheme.light;

  /// Get the current Tina color scheme.
  TinaColorScheme get tinaColors => tinaTheme.colors;
}

/// Helper function to provide null-safe lerp for doubles.
double? lerpDouble(double? a, double? b, double t) {
  if (a == null && b == null) return null;
  a ??= 0;
  b ??= 0;
  return a + (b - a) * t;
}
