/// Application-wide constants
class AppConstants {
  AppConstants._();

  /// Application information
  static const String appName = 'Tina AI Assistant';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Your personal AI assistant';

  /// Database constants
  static const String databaseName = 'tina.db';
  static const int databaseVersion = 1;

  /// API constants
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const Duration streamTimeout = Duration(minutes: 5);
  static const int maxRetryAttempts = 3;

  /// UI constants
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration debounceDelay = Duration(milliseconds: 500);

  /// Message limits
  static const int maxMessageLength = 10000;
  static const int maxChatTitleLength = 100;

  /// Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
}

/// Error codes used throughout the application
class ErrorCodes {
  ErrorCodes._();

  // Network errors
  static const String networkTimeout = 'NETWORK_TIMEOUT';
  static const String networkUnavailable = 'NETWORK_UNAVAILABLE';
  static const String serverError = 'SERVER_ERROR';

  // Validation errors
  static const String invalidInput = 'INVALID_INPUT';
  static const String requiredField = 'REQUIRED_FIELD';
  static const String invalidFormat = 'INVALID_FORMAT';

  // Database errors
  static const String databaseError = 'DATABASE_ERROR';
  static const String recordNotFound = 'RECORD_NOT_FOUND';
  static const String duplicateRecord = 'DUPLICATE_RECORD';

  // Service errors
  static const String serviceUnavailable = 'SERVICE_UNAVAILABLE';
  static const String authenticationFailed = 'AUTHENTICATION_FAILED';
  static const String permissionDenied = 'PERMISSION_DENIED';
}
