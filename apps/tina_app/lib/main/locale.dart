import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

export 'package:easy_localization/easy_localization.dart'
    show BuildContextEasyLocalizationExtension;

const supportedLocales = [Locale('en'), Locale('es')];

class MainLocale extends StatelessWidget {
  final Widget child;

  const MainLocale({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/i18n',
      fallbackLocale: supportedLocales.first,
      useFallbackTranslations: true,
      useOnlyLangCode: true,
      saveLocale: false,
      child: child,
    );
  }

  static Future<void> ensureInitialized() {
    return EasyLocalization.ensureInitialized();
  }
}
