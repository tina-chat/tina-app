import 'package:flutter/material.dart';

/// Design tokens for the Tina AI Assistant design system.
///
/// This file contains all the design tokens extracted from the design system
/// specification, providing a single source of truth for colors, typography,
/// spacing, and other design properties.
class DesignTokens {
  DesignTokens._();
}

/// Color tokens based on the design system specification
class DesignColors {
  DesignColors._();

  // Primary colors
  static const Color primaryBase = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color primaryContrast = Color(0xFFFFFFFF);

  // Secondary colors
  static const Color secondaryBase = Color(0xFFEC4899);
  static const Color secondaryLight = Color(0xFFF472B6);
  static const Color secondaryDark = Color(0xFFBE185D);
  static const Color secondaryContrast = Color(0xFFFFFFFF);

  // Accent colors
  static const Color accentBase = Color(0xFF8B5CF6);
  static const Color accentLight = Color(0xFFA78BFA);
  static const Color accentDark = Color(0xFF6D28D9);
  static const Color accentContrast = Color(0xFFFFFFFF);

  // Neutral colors
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);

  // Semantic colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}

/// Typography tokens
class DesignTypography {
  DesignTypography._();

  // Font families
  static const String headingFontFamily = 'Inter';
  static const String bodyFontFamily = 'Inter';
  static const String monoFontFamily = 'JetBrains Mono';

  // Font sizes (in logical pixels)
  static const double fontSizeXs = 12.0; // 0.75rem
  static const double fontSizeSm = 14.0; // 0.875rem
  static const double fontSizeBase = 16.0; // 1rem
  static const double fontSizeLg = 18.0; // 1.125rem
  static const double fontSizeXl = 20.0; // 1.25rem
  static const double fontSize2Xl = 24.0; // 1.5rem
  static const double fontSize3Xl = 30.0; // 1.875rem
  static const double fontSize4Xl = 36.0; // 2.25rem
  static const double fontSize5Xl = 48.0; // 3rem

  // Font weights
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemibold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;

  // Line heights
  static const double lineHeightXs = 1.2;
  static const double lineHeightSm = 1.25;
  static const double lineHeightBase = 1.5;
  static const double lineHeightLg = 1.55;
  static const double lineHeightXl = 1.6;
  static const double lineHeight2Xl = 1.3;
  static const double lineHeight3Xl = 1.2;
  static const double lineHeight4Xl = 1.1;
  static const double lineHeight5Xl = 1.0;

  // Letter spacing
  static const double letterSpacingTight = -0.025;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.025;
}

/// Spacing tokens (in logical pixels)
class DesignSpacing {
  DesignSpacing._();

  static const double base = 16.0; // 1rem

  static const double xs = 4.0; // 0.25rem
  static const double sm = 8.0; // 0.5rem
  static const double md = 16.0; // 1rem
  static const double lg = 24.0; // 1.5rem
  static const double xl = 32.0; // 2rem
  static const double xl2 = 48.0; // 3rem
  static const double xl3 = 64.0; // 4rem

  // Layout spacing
  static const double contentPadding = 24.0; // 1.5rem
  static const double sectionSpacing = 64.0; // 4rem
  static const double componentSpacing = 16.0; // 1rem
}

/// Border radius tokens (in logical pixels)
class DesignBorderRadius {
  DesignBorderRadius._();

  static const double none = 0.0;
  static const double sm = 2.0; // 0.125rem
  static const double md = 6.0; // 0.375rem
  static const double lg = 8.0; // 0.5rem
  static const double xl = 16.0; // 1rem
  static const double full = 9999.0;
}

/// Border width tokens (in logical pixels)
class DesignBorderWidth {
  DesignBorderWidth._();

  static const double thin = 1.0;
  static const double medium = 2.0;
  static const double thick = 4.0;
}

/// Elevation tokens
class DesignElevation {
  DesignElevation._();

  static const double none = 0.0;
  static const double sm = 1.0;
  static const double md = 4.0;
  static const double lg = 8.0;
  static const double xl = 16.0;
}

/// Animation duration tokens
class DesignDuration {
  DesignDuration._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration slow = Duration(milliseconds: 300);
}

/// Breakpoints for responsive design (in logical pixels)
class DesignBreakpoints {
  DesignBreakpoints._();

  static const double sm = 640.0;
  static const double md = 768.0;
  static const double lg = 1024.0;
  static const double xl = 1280.0;
  static const double xl2 = 1536.0;
}

/// Z-index values for layering
class DesignZIndex {
  DesignZIndex._();

  static const int dropdown = 1000;
  static const int sticky = 1020;
  static const int fixed = 1030;
  static const int modal = 1040;
  static const int popover = 1050;
  static const int toast = 1060;
}

/// Component size tokens
class DesignComponentSizes {
  DesignComponentSizes._();
}

/// Button size tokens
class DesignButtonSizes {
  DesignButtonSizes._();

  static const double heightSm = 32.0; // 2rem
  static const double heightMd = 40.0; // 2.5rem
  static const double heightLg = 48.0; // 3rem

  static const EdgeInsets paddingSm = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  );
  static const EdgeInsets paddingMd = EdgeInsets.symmetric(
    horizontal: 24.0,
    vertical: 12.0,
  );
  static const EdgeInsets paddingLg = EdgeInsets.symmetric(
    horizontal: 32.0,
    vertical: 16.0,
  );
}

/// Input size tokens
class DesignInputSizes {
  DesignInputSizes._();

  static const double heightSm = 32.0; // 2rem
  static const double heightMd = 40.0; // 2.5rem
  static const double heightLg = 48.0; // 3rem

  static const EdgeInsets paddingSm = EdgeInsets.symmetric(
    horizontal: 8.0,
    vertical: 6.0,
  );
  static const EdgeInsets paddingMd = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 8.0,
  );
  static const EdgeInsets paddingLg = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );
}

/// Navigation size tokens
class DesignNavigationSizes {
  DesignNavigationSizes._();

  static const double desktopHeight = 64.0; // 4rem
  static const double mobileHeight = 56.0; // 3.5rem

  static const EdgeInsets desktopPadding = EdgeInsets.symmetric(
    horizontal: 24.0,
  );
  static const EdgeInsets mobilePadding = EdgeInsets.symmetric(
    horizontal: 16.0,
  );
}

/// Shadow definitions
class DesignShadows {
  DesignShadows._();

  static const BoxShadow sm = BoxShadow(
    color: Color(0x0D000000), // rgba(0, 0, 0, 0.05)
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  static const BoxShadow md = BoxShadow(
    color: Color(0x1A000000), // rgba(0, 0, 0, 0.1)
    offset: Offset(0, 4),
    blurRadius: 6,
    spreadRadius: -1,
  );

  static const BoxShadow lg = BoxShadow(
    color: Color(0x1A000000), // rgba(0, 0, 0, 0.1)
    offset: Offset(0, 10),
    blurRadius: 15,
    spreadRadius: -3,
  );

  static const BoxShadow xl = BoxShadow(
    color: Color(0x1A000000), // rgba(0, 0, 0, 0.1)
    offset: Offset(0, 20),
    blurRadius: 25,
    spreadRadius: -5,
  );

  static const BoxShadow inner = BoxShadow(
    color: Color(0x0F000000), // rgba(0, 0, 0, 0.06)
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow glass = BoxShadow(
    color: Color(0x5F1F2687), // rgba(31, 38, 135, 0.37)
    offset: Offset(0, 8),
    blurRadius: 32,
    spreadRadius: 0,
  );
}
