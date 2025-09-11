import '../types/result.dart';

/// Base interface for all use cases in the application
///
/// Use cases represent business operations and should contain the business
/// logic for a specific operation. They coordinate between different
/// repositories and services to accomplish a business goal.
abstract interface class UseCase<Type, Params> {
  /// Executes the use case with the given parameters
  ///
  /// Returns a [Result] that contains either the successful result
  /// or a failure with error information.
  Future<Result<Type>> execute(Params params);
}

/// Base interface for synchronous use cases
abstract interface class SyncUseCase<Type, Params> {
  /// Executes the use case synchronously with the given parameters
  Result<Type> execute(Params params);
}

/// Base interface for stream-based use cases
abstract interface class StreamUseCase<Type, Params> {
  /// Executes the use case and returns a stream of results
  Stream<Result<Type>> execute(Params params);
}

/// Marker class for use cases that don't require parameters
final class NoParams {
  const NoParams();

  @override
  bool operator ==(Object other) => other is NoParams;

  @override
  int get hashCode => 0;
}
