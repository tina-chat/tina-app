import '../entities/conversation.dart';

/// Repository interface for conversation data operations.
///
/// This abstract class defines the contract for conversation data access,
/// following the Repository pattern from Clean Architecture.
/// Implementations should handle data persistence, retrieval, and
/// business logic validation for conversation operations.
abstract class ConversationRepository {
  /// Retrieves all conversations for a specific workspace.
  ///
  /// [workspaceId] The unique identifier of the workspace.
  /// Returns a list of conversations ordered by their last update date.
  /// Throws [ConversationException] if there's an error retrieving conversations.
  Future<List<ConversationEntity>> getConversationsByWorkspace(
    String workspaceId,
  );

  /// Retrieves a conversation by its unique identifier.
  ///
  /// [id] The unique identifier of the conversation to retrieve.
  /// Returns conversation with the given [id], or null if not found.
  /// Throws [ConversationException] if there's an error retrieving the conversation.
  Future<ConversationEntity?> getConversationById(String id);

  /// Retrieves pinned conversations for a specific workspace.
  ///
  /// [workspaceId] The unique identifier of the workspace.
  /// Returns a list of pinned conversations ordered by their last update date.
  /// Throws [ConversationException] if there's an error retrieving conversations.
  Future<List<ConversationEntity>> getPinnedConversations(String workspaceId);

  /// Creates a new conversation in the data source.
  ///
  /// [conversation] The conversation to create. The conversation should have a unique ID.
  /// Returns the created conversation with any system-generated values populated.
  /// Throws [ConversationValidationException] if conversation data is invalid.
  /// Throws [ConversationDuplicateException] if a conversation with the same ID already exists.
  /// Throws [ConversationException] if there's an error creating the conversation.
  Future<ConversationEntity> createConversation(
    ConversationToCreate conversation,
  );

  /// Updates an existing conversation in the data source.
  ///
  /// [id] The ID of the conversation to update.
  /// [conversation] The conversation with updated values. Must have a valid ID.
  /// Returns the updated conversation.
  /// Throws [ConversationValidationException] if conversation data is invalid.
  /// Throws [ConversationNotFoundException] if no conversation with the given ID exists.
  /// Throws [ConversationException] if there's an error updating the conversation.
  Future<ConversationEntity> updateConversation(
    String id,
    ConversationToUpdate conversation,
  );

  /// Deletes a conversation from the data source.
  ///
  /// [id] The unique identifier of the conversation to delete.
  /// Returns true if the conversation was successfully deleted, false if not found.
  /// Throws [ConversationException] if there's an error deleting the conversation.
  Future<bool> deleteConversation(String id);

  /// Checks if a conversation with the given ID exists.
  ///
  /// [id] The unique identifier to check.
  /// Returns true if the conversation exists, false otherwise.
  /// Throws [ConversationException] if there's an error checking existence.
  Future<bool> conversationExists(String id);

  /// Searches for conversations by title within a workspace.
  ///
  /// [workspaceId] The unique identifier of the workspace.
  /// [query] The search query string. The search is case-insensitive and
  /// matches conversations whose titles contain the query.
  /// Returns a list of matching conversations ordered by their last update date.
  /// Throws [ConversationException] if there's an error searching conversations.
  Future<List<ConversationEntity>> searchConversationsByTitle(
    String workspaceId,
    String query,
  );

  /// Gets the total count of conversations for a specific workspace.
  ///
  /// [workspaceId] The unique identifier of the workspace.
  /// Returns the total number of conversations in the workspace.
  /// Throws [ConversationException] if there's an error counting conversations.
  Future<int> getConversationCountByWorkspace(String workspaceId);

  /// Validates conversation data before creation or update.
  ///
  /// [conversation] The conversation to validate.
  /// Returns true if the conversation data is valid.
  /// Throws [ConversationValidationException] if conversation data is invalid.
  Future<bool> validateConversation(ConversationToCreate conversation);

  /// Updates the last updated timestamp for a conversation.
  ///
  /// [id] The unique identifier of the conversation to update.
  /// Returns true if the conversation was successfully updated, false if not found.
  /// Throws [ConversationException] if there's an error updating the timestamp.
  Future<bool> updateConversationTimestamp(String id);
}

/// Base exception for conversation-related operations.
class ConversationException implements Exception {
  /// Error message describing the exception
  final String message;

  /// Optional original exception that caused this exception
  final Exception? cause;

  /// Creates a new ConversationException
  const ConversationException(this.message, [this.cause]);

  @override
  String toString() =>
      'ConversationException: $message${cause != null ? ' (Caused by: $cause)' : ''}';
}

/// Exception thrown when conversation validation fails.
class ConversationValidationException extends ConversationException {
  /// Creates a new ConversationValidationException
  const ConversationValidationException(super.message, [super.cause]);
}

/// Exception thrown when a conversation is not found.
class ConversationNotFoundException extends ConversationException {
  /// ID of the conversation that was not found
  final String conversationId;

  /// Creates a new ConversationNotFoundException
  const ConversationNotFoundException(this.conversationId, [Exception? cause])
    : super('Conversation with ID "$conversationId" not found', cause);
}

/// Exception thrown when attempting to create a duplicate conversation.
class ConversationDuplicateException extends ConversationException {
  /// ID of the duplicate conversation
  final String conversationId;

  /// Creates a new ConversationDuplicateException
  const ConversationDuplicateException(this.conversationId, [Exception? cause])
    : super('Conversation with ID "$conversationId" already exists', cause);
}
