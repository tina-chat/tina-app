abstract class AppConfig {
  static const bool isDev = bool.fromEnvironment('IS_DEV');
  static const bool storeLocale = bool.fromEnvironment(
    'STORE_LOCALE',
    defaultValue: true,
  );
  static const double appTintHue =
      int.fromEnvironment('TINT_HUE', defaultValue: 25947) / 100;
  static const appTitle = String.fromEnvironment(
    'APP_TITLE',
    defaultValue: 'Aura',
  );
}
