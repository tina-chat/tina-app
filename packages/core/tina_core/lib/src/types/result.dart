import 'failure.dart';

/// A type that represents either success or failure.
///
/// This is used throughout the application to handle operations that can fail
/// without throwing exceptions, following functional programming principles.
sealed class Result<T> {
  const Result();

  /// Returns true if this is a success result
  bool get isSuccess => this is Success<T>;

  /// Returns true if this is a failure result
  bool get isFailure => this is Failure<T>;

  /// Transforms the success value using the provided function
  Result<U> map<U>(U Function(T) transform) {
    return switch (this) {
      Success(value: final value) => Success(transform(value)),
      Failure(failure: final failure) => Failure(failure),
    };
  }

  /// Transforms the failure using the provided function
  Result<T> mapFailure(AppFailure Function(AppFailure) transform) {
    return switch (this) {
      Success() => this,
      Failure(failure: final failure) => Failure(transform(failure)),
    };
  }

  /// Executes the appropriate callback based on the result type
  U fold<U>(U Function(AppFailure) onFailure, U Function(T) onSuccess) {
    return switch (this) {
      Success(value: final value) => onSuccess(value),
      Failure(failure: final failure) => onFailure(failure),
    };
  }

  /// Returns the success value or null if this is a failure
  T? get valueOrNull {
    return switch (this) {
      Success(value: final value) => value,
      Failure() => null,
    };
  }

  /// Returns the failure or null if this is a success
  AppFailure? get failureOrNull {
    return switch (this) {
      Success() => null,
      Failure(failure: final failure) => failure,
    };
  }
}

/// Represents a successful result containing a value
final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Success($value)';
}

/// Represents a failed result containing a failure
final class Failure<T> extends Result<T> {
  const Failure(this.failure);

  final AppFailure failure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<T> &&
          runtimeType == other.runtimeType &&
          failure == other.failure;

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() => 'Failure($failure)';
}
