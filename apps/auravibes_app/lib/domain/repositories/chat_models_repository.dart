import 'package:auravibes_app/domain/entities/credentials_models_entities.dart';

/// Repository interface for credentialsModel data operations.
///
/// This abstract class defines the contract for credentialsModel data access,
/// following the Repository pattern from Clean Architecture.
/// Implementations should handle data persistence, retrieval, and
/// business logic validation for credentialsModel operations.
abstract class CredentialsModelsRepository {
  Future<void> createCredentialsModels(
    List<CredentialModelToCreate> credentialsModels,
  );

  Future<List<CredentialsModelWithProviderEntity>> getCredentialsModels(
    CredentialsModelsFilter filter,
  );

  Future<CredentialsModelWithProviderEntity?> getCredentialsModelById(
    String id,
  );
}

/// Base exception for credentialsModel-related operations.
class CredentialsModelException implements Exception {
  /// Creates a new CredentialsModelException
  const CredentialsModelException(this.message, [this.cause]);

  /// Error message describing the exception
  final String message;

  /// Optional original exception that caused this exception
  final Exception? cause;

  @override
  String toString() {
    final causedBy = ' (Caused by: $cause)';
    return 'CredentialsModelException: $message'
        '${cause != null ? causedBy : ''}';
  }
}

/// Exception thrown when credentialsModel validation fails.
class CredentialsModelValidationException extends CredentialsModelException {
  /// Creates a new CredentialsModelValidationException
  const CredentialsModelValidationException(super.message, [super.cause]);
}

/// Exception thrown when a credentialsModel is not found.
class CredentialsModelNotFoundException extends CredentialsModelException {
  /// Creates a new CredentialsModelNotFoundException
  const CredentialsModelNotFoundException(
    this.credentialsModelId, [
    Exception? cause,
  ]) : super('CredentialsModel with ID "$credentialsModelId" not found', cause);

  /// ID of the credentialsModel that was not found
  final int credentialsModelId;
}
