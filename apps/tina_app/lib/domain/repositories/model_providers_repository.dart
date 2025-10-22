import 'package:tina_app/domain/entities/chat_model_model.dart';

/// Repository interface for chatModel data operations.
///
/// This abstract class defines the contract for chatModel data access,
/// following the Repository pattern from Clean Architecture.
/// Implementations should handle data persistence, retrieval, and
/// business logic validation for chatModel operations.
abstract class ModelProvidersRepository {
  Future<List<ModelProviderEntity>> getModelProviders(
    ModelProviderFilter filter,
  );

  Future<ModelProviderEntity> createModelProvider(
    ModelProviderToCreate workspace,
  );
}

/// Base exception for chatModel-related operations.
class ModelProviderException implements Exception {
  /// Error message describing the exception
  final String message;

  /// Optional original exception that caused this exception
  final Exception? cause;

  /// Creates a new ModelProviderException
  const ModelProviderException(this.message, [this.cause]);

  @override
  String toString() =>
      'ModelProviderException: $message${cause != null ? ' (Caused by: $cause)' : ''}';
}

/// Exception thrown when modelProvider validation fails.
class ModelProviderValidationException extends ModelProviderException {
  /// Creates a new ModelProviderValidationException
  const ModelProviderValidationException(super.message, [super.cause]);
}

/// Exception thrown when a modelProvider is not found.
class ModelProviderNotFoundException extends ModelProviderException {
  /// ID of the chatModel that was not found
  final int modelProviderId;

  /// Creates a new ModelProviderNotFoundException
  const ModelProviderNotFoundException(this.modelProviderId, [Exception? cause])
    : super('ModelProvider with ID "$modelProviderId" not found', cause);
}
