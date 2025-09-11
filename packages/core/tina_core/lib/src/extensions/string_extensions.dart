/// Extensions for String class to add common utility methods
extension StringExtensions on String {
  /// Returns true if the string is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Returns true if the string is not null and not empty
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Returns true if the string contains only whitespace characters
  bool get isBlank => trim().isEmpty;

  /// Returns true if the string is not blank
  bool get isNotBlank => !isBlank;

  /// Capitalizes the first letter of the string
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalizes the first letter of each word
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Truncates the string to the specified length and adds ellipsis if needed
  String truncate(int maxLength, [String ellipsis = '...']) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - ellipsis.length)}$ellipsis';
  }

  /// Removes all whitespace from the string
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Returns true if the string is a valid email address
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Returns true if the string is a valid URL
  bool get isValidUrl {
    try {
      final uri = Uri.parse(this);
      return uri.hasScheme && uri.hasAuthority;
    } catch (e) {
      return false;
    }
  }

  /// Converts string to snake_case
  String get toSnakeCase {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    ).replaceFirst(RegExp(r'^_'), '');
  }

  /// Converts string to camelCase
  String get toCamelCase {
    final words = split('_');
    if (words.isEmpty) return this;

    return words.first.toLowerCase() +
        words.skip(1).map((word) => word.capitalize).join();
  }
}

/// Extensions for nullable String
extension NullableStringExtensions on String? {
  /// Returns true if the string is null or empty
  bool get isNullOrEmpty => this?.isEmpty ?? true;

  /// Returns true if the string is not null and not empty
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Returns true if the string is null or blank
  bool get isNullOrBlank => this?.isBlank ?? true;

  /// Returns true if the string is not null and not blank
  bool get isNotNullOrBlank => !isNullOrBlank;

  /// Returns the string or a default value if null
  String orDefault(String defaultValue) => this ?? defaultValue;

  /// Returns the string or empty string if null
  String get orEmpty => this ?? '';
}
