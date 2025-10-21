import 'package:tina_app/domain/entities/chat_model_model.dart';

/// Repository interface for chatModel data operations.
///
/// This abstract class defines the contract for chatModel data access,
/// following the Repository pattern from Clean Architecture.
/// Implementations should handle data persistence, retrieval, and
/// business logic validation for chatModel operations.
abstract class ChatModelsRepository {
  Future<List<ChatModelEntity>> getChatModels(ChatModelFilter filter);

  Future<ChatModelEntity> createChatModel(ChatModelToCreate workspace);
}

/// Base exception for chatModel-related operations.
class ChatModelException implements Exception {
  /// Error message describing the exception
  final String message;

  /// Optional original exception that caused this exception
  final Exception? cause;

  /// Creates a new ChatModelException
  const ChatModelException(this.message, [this.cause]);

  @override
  String toString() =>
      'ChatModelException: $message${cause != null ? ' (Caused by: $cause)' : ''}';
}

/// Exception thrown when chatModel validation fails.
class ChatModelValidationException extends ChatModelException {
  /// Creates a new ChatModelValidationException
  const ChatModelValidationException(super.message, [super.cause]);
}

/// Exception thrown when a chatModel is not found.
class ChatModelNotFoundException extends ChatModelException {
  /// ID of the chatModel that was not found
  final int chatModelId;

  /// Creates a new ChatModelNotFoundException
  const ChatModelNotFoundException(this.chatModelId, [Exception? cause])
    : super('ChatModel with ID "$chatModelId" not found', cause);
}
