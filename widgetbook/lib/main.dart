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
        ThemeAddon(
          themeBuilder: (context, theme, child) => child,
          themes: [
            WidgetbookTheme(
              name: 'Tina Light Theme',
              data: _createLightTheme(),
            ),
            WidgetbookTheme(
              name: 'Tina Dark Theme', 
              data: _createDarkTheme(),
            ),
          ],
        ),
        BuilderAddon(
          name: 'Builder',
          builder: (context, child) => child,
        ),
      ],
    );
  }

  ThemeData _createLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: DesignColors.primaryBase,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.inter(
            fontWeight: DesignTypography.fontWeightMedium,
          ),
        ),
      ),
    );
  }

  ThemeData _createDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: DesignColors.primaryBase,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.inter(
            fontWeight: DesignTypography.fontWeightMedium,
          ),
        ),
      ),
    );
  }
}