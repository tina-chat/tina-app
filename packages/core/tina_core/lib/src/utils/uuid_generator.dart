import 'dart:math';

/// Simple UUID generator for creating unique identifiers
///
/// This is a basic implementation that generates UUID-like strings
/// without external dependencies. For production use, consider using
/// the 'uuid' package for RFC 4122 compliant UUIDs.
class UuidGenerator {
  UuidGenerator._();

  static final Random _random = Random();

  /// Generates a simple UUID-like string
  ///
  /// Format: xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx
  /// where x is a random hexadecimal digit and y is one of 8, 9, A, or B
  static String generate() {
    return '${_generateHex(8)}-${_generateHex(4)}-4${_generateHex(3)}-${_generateY()}${_generateHex(3)}-${_generateHex(12)}';
  }

  /// Generates a short ID (8 characters)
  static String generateShort() {
    return _generateHex(8);
  }

  /// Generates a compact ID without dashes
  static String generateCompact() {
    return '${_generateHex(8)}${_generateHex(4)}4${_generateHex(3)}${_generateY()}${_generateHex(3)}${_generateHex(12)}';
  }

  static String _generateHex(int length) {
    const chars = '0123456789abcdef';
    return List.generate(length, (_) => chars[_random.nextInt(16)]).join();
  }

  static String _generateY() {
    const chars = '89ab';
    return chars[_random.nextInt(4)];
  }
}
