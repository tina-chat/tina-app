import 'package:auravibes_app/domain/entities/chat_models_entities.dart';

/// Repository interface for chatModel data operations.
///
/// This abstract class defines the contract for chatModel data access,
/// following the Repository pattern from Clean Architecture.
/// Implementations should handle data persistence, retrieval, and
/// business logic validation for chatModel operations.
abstract class ChatModelsRepository {
  Future<void> createChatModels(List<ChatModelToCreate> chatModels);

  Future<List<ChatModelWithProviderEntity>> getChatModels(
    ChatModelsFilter filter,
  );

  Future<ChatModelWithProviderEntity?> getChatModelById(String id);
}

/// Base exception for chatModel-related operations.
class ChatModelException implements Exception {
  /// Creates a new ChatModelException
  const ChatModelException(this.message, [this.cause]);

  /// Error message describing the exception
  final String message;

  /// Optional original exception that caused this exception
  final Exception? cause;

  @override
  String toString() {
    final causedBy = ' (Caused by: $cause)';
    return 'ChatModelException: $message${cause != null ? causedBy : ''}';
  }
}

/// Exception thrown when chatModel validation fails.
class ChatModelValidationException extends ChatModelException {
  /// Creates a new ChatModelValidationException
  const ChatModelValidationException(super.message, [super.cause]);
}

/// Exception thrown when a chatModel is not found.
class ChatModelNotFoundException extends ChatModelException {
  /// Creates a new ChatModelNotFoundException
  const ChatModelNotFoundException(this.chatModelId, [Exception? cause])
    : super('ChatModel with ID "$chatModelId" not found', cause);

  /// ID of the chatModel that was not found
  final int chatModelId;
}
