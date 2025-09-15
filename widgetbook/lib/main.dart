import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:tina_ui/ui.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [
        InspectorAddon(enabled: true),
        AlignmentAddon(),
        ViewportAddon([
          Viewports.none, 
          IosViewports.iPhone13, 
          AndroidViewports.samsungGalaxyNote20, 
          MacosViewports.macbookPro, 
          WindowsViewports.desktop, 
          LinuxViewports.desktop, 
        ]),
        ThemeAddon(
          themeBuilder: (context, theme, child) => Theme(
            data: theme,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
              ),
              child: child,
            ),
          ),
          themes: [
            WidgetbookTheme(
              name: 'Tina Light Theme',
              data: _createLightTheme(),
            ),
            WidgetbookTheme(name: 'Tina Dark Theme', data: _createDarkTheme()),
          ],
        ),
        BuilderAddon(name: 'Builder', builder: (context, child) => child),
      ],
    );
  }

  ThemeData _createLightTheme() {
    final tinaColors = TinaTheme.light.colors;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: tinaColors.primary,
        onPrimary: tinaColors.onPrimary,
        secondary: tinaColors.secondary,
        onSecondary: tinaColors.onSecondary,
        surface: tinaColors.surface,
        onSurface: tinaColors.onSurface,
        error: tinaColors.error,
        onError: tinaColors.onError,
        outline: tinaColors.outline,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.inter(
            fontWeight: DesignTypography.fontWeightMedium,
          ),
        ),
      ),
      extensions: const [TinaTheme.light],
    );
  }

  ThemeData _createDarkTheme() {
    final tinaColors = TinaTheme.dark.colors;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: tinaColors.primary,
        onPrimary: tinaColors.onPrimary,
        secondary: tinaColors.secondary,
        onSecondary: tinaColors.onSecondary,
        surface: tinaColors.surface,
        onSurface: tinaColors.onSurface,
        error: tinaColors.error,
        onError: tinaColors.onError,
        outline: tinaColors.outline,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.inter(
            fontWeight: DesignTypography.fontWeightMedium,
          ),
        ),
      ),
      extensions: const [TinaTheme.dark],
    );
  }
}
