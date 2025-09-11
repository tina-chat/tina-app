/// Base class for all failures in the application
///
/// This provides a consistent way to handle and categorize different types
/// of failures throughout the application.
abstract base class AppFailure {
  const AppFailure(this.message, [this.code]);

  /// Human-readable error message
  final String message;

  /// Optional error code for programmatic handling
  final String? code;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppFailure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          code == other.code;

  @override
  int get hashCode => message.hashCode ^ code.hashCode;

  @override
  String toString() => 'AppFailure(message: $message, code: $code)';
}

/// Failure related to network operations
final class NetworkFailure extends AppFailure {
  const NetworkFailure(super.message, [super.code]);
}

/// Failure related to data parsing or validation
final class DataFailure extends AppFailure {
  const DataFailure(super.message, [super.code]);
}

/// Failure related to business logic validation
final class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message, [super.code]);
}

/// Failure related to external service operations
final class ServiceFailure extends AppFailure {
  const ServiceFailure(super.message, [super.code]);
}

/// Failure related to database operations
final class DatabaseFailure extends AppFailure {
  const DatabaseFailure(super.message, [super.code]);
}

/// Generic failure for unexpected errors
final class UnknownFailure extends AppFailure {
  const UnknownFailure(super.message, [super.code]);
}
