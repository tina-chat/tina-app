enum Flavor {
  prod,
  dev,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'AuraVibes';
      case Flavor.dev:
        return 'AuraVibes Dev';
    }
  }
}
