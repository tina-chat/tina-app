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
  /// Creates font weights with the specified values.
  const TinaFontWeights({
    this.light = DesignTypography.fontWeightLight,
    this.regular = DesignTypography.fontWeightRegular,
    this.medium = DesignTypography.fontWeightMedium,
    this.semibold = DesignTypography.fontWeightSemibold,
    this.bold = DesignTypography.fontWeightBold,
  });

  /// Light font weight (300) for subtle text elements.
  final FontWeight light;

  /// Regular font weight (400) for body text and standard content.
  final FontWeight regular;

  /// Medium font weight (500) for emphasized text and buttons.
  final FontWeight medium;

  /// Semibold font weight (600) for subheadings and important text.
  final FontWeight semibold;

  /// Bold font weight (700) for headings and strong emphasis.
  final FontWeight bold;
}

/// Line height tokens for typography theme.
///
/// Provides consistent line heights that correspond to font sizes,
/// maintaining proper vertical rhythm in text layout.
@immutable
class TinaLineHeights {
  /// Creates line heights with the specified values.
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

  /// Extra tight line height (1.2) for compact text layouts.
  final double xs;

  /// Tight line height (1.25) for dense text content.
  final double sm;

  /// Base line height (1.5) for comfortable reading of body text.
  final double base;

  /// Large line height (1.55) for improved readability.
  final double lg;

  /// Extra large line height (1.6) for spacious text layouts.
  final double xl;

  /// 2X large line height (1.3) for medium headings.
  final double xl2;

  /// 3X large line height (1.2) for large headings.
  final double xl3;

  /// 4X large line height (1.1) for display headings.
  final double xl4;

  /// 5X large line height (1.0) for hero text and tight displays.
  final double xl5;
}

/// Letter spacing tokens for typography theme.
///
/// Defines tight, normal, and wide letter spacing values
/// for fine-tuning text readability and visual density.
@immutable
class TinaLetterSpacings {
  /// Creates letter spacings with the specified values.
  const TinaLetterSpacings({
    this.tight = DesignTypography.letterSpacingTight,
    this.normal = DesignTypography.letterSpacingNormal,
    this.wide = DesignTypography.letterSpacingWide,
  });

  /// Tight letter spacing (-0.025) for compact text.
  final double tight;

  /// Normal letter spacing (0) for standard text.
  final double normal;

  /// Wide letter spacing (0.025) for spacious text and headings.
  final double wide;
}

/// Spacing theme that provides consistent spacing values.
///
/// Defines a scale of spacing values from extra small (xs) to extra large 3
/// (xl3)
/// used for margins, padding, and gaps throughout the application.
@immutable
class TinaSpacingTheme {
  /// Creates a spacing theme with the specified values.
  const TinaSpacingTheme({
    this.xs = DesignSpacing.xs,
    this.sm = DesignSpacing.sm,
    this.md = DesignSpacing.md,
    this.lg = DesignSpacing.lg,
    this.xl = DesignSpacing.xl,
    this.xl2 = DesignSpacing.xl2,
    this.xl3 = DesignSpacing.xl3,
  });

  /// Creates the standard spacing theme.
  const TinaSpacingTheme._standard()
    : xs = DesignSpacing.xs,
      sm = DesignSpacing.sm,
      md = DesignSpacing.md,
      lg = DesignSpacing.lg,
      xl = DesignSpacing.xl,
      xl2 = DesignSpacing.xl2,
      xl3 = DesignSpacing.xl3;

  /// Extra small spacing (4px) for tight gaps and fine adjustments.
  final double xs;

  /// Small spacing (8px) for minor element separation.
  final double sm;

  /// Medium spacing (16px) for standard element separation.
  final double md;

  /// Large spacing (24px) for section separation.
  final double lg;

  /// Extra large spacing (32px) for major layout sections.
  final double xl;

  /// 2X large spacing (48px) for page-level separation.
  final double xl2;

  /// 3X large spacing (64px) for maximum separation.
  final double xl3;

  /// Linearly interpolate between two spacing themes.
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
  /// Creates a border radius theme with the specified values.
  const TinaBorderRadiusTheme({
    this.none = DesignBorderRadius.none,
    this.sm = DesignBorderRadius.sm,
    this.md = DesignBorderRadius.md,
    this.lg = DesignBorderRadius.lg,
    this.xl = DesignBorderRadius.xl,
    this.full = DesignBorderRadius.full,
  });

  /// Creates the standard border radius theme.
  const TinaBorderRadiusTheme._standard()
    : none = DesignBorderRadius.none,
      sm = DesignBorderRadius.sm,
      md = DesignBorderRadius.md,
      lg = DesignBorderRadius.lg,
      xl = DesignBorderRadius.xl,
      full = DesignBorderRadius.full;

  /// No border radius for sharp corners and square elements.
  final double none;

  /// Small border radius (2px) for subtle rounding.
  final double sm;

  /// Medium border radius (6px) for standard button rounding.
  final double md;

  /// Large border radius (8px) for card and container rounding.
  final double lg;

  /// Extra large border radius (16px) for prominent rounded elements.
  final double xl;

  /// Full border radius for perfectly circular elements.
  final double full;

  /// Linearly interpolate between two border radius themes.
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
  /// Creates an elevation theme with the specified values.
  const TinaElevationTheme({
    this.none = DesignElevation.none,
    this.sm = DesignElevation.sm,
    this.md = DesignElevation.md,
    this.lg = DesignElevation.lg,
    this.xl = DesignElevation.xl,
  });

  /// Creates the standard elevation theme.
  const TinaElevationTheme._standard()
    : none = DesignElevation.none,
      sm = DesignElevation.sm,
      md = DesignElevation.md,
      lg = DesignElevation.lg,
      xl = DesignElevation.xl;

  /// No elevation for flat elements and backgrounds.
  final double none;

  /// Small elevation (1px) for subtle depth and hover states.
  final double sm;

  /// Medium elevation (4px) for cards and standard components.
  final double md;

  /// Large elevation (8px) for floating elements and dropdowns.
  final double lg;

  /// Extra large elevation (16px) for modals and prominent overlays.
  final double xl;

  /// Linearly interpolate between two elevation themes.
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
  /// Creates an animation theme with the specified values.
  const TinaAnimationTheme({
    this.fast = DesignDuration.fast,
    this.normal = DesignDuration.normal,
    this.slow = DesignDuration.slow,
  });

  /// Creates the standard animation theme.
  const TinaAnimationTheme._standard()
    : fast = DesignDuration.fast,
      normal = DesignDuration.normal,
      slow = DesignDuration.slow;

  /// Fast animation duration (150ms) for quick transitions and
  /// micro-interactions.
  final Duration fast;

  /// Normal animation duration (200ms) for standard transitions and
  /// state changes.
  final Duration normal;

  /// Slow animation duration (300ms) for deliberate animations and
  /// page transitions.
  final Duration slow;

  /// Linearly interpolate between two animation themes.
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
  final aValue = a ?? 0;
  final bValue = b ?? 0;
  return aValue + (bValue - aValue) * t;
}
