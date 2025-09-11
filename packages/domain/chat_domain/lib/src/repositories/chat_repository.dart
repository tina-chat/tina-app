import 'package:tina_core/tina_core.dart';
import '../entities/chat.dart';
import '../entities/message.dart';
import '../value_objects/chat_id.dart';
import '../value_objects/message_id.dart';

/// Repository interface for chat persistence operations.
///
/// This interface defines the contract for chat data access,
/// following the Repository pattern from DDD.
abstract class ChatRepository {
  /// Retrieves a chat by its ID
  Future<Result<Chat>> getChat(ChatId id);

  /// Retrieves all chats, optionally with their messages
  Future<Result<List<Chat>>> getAllChats({bool includeMessages = false});

  /// Creates a new chat
  Future<Result<Chat>> createChat(Chat chat);

  /// Updates an existing chat
  Future<Result<Chat>> updateChat(Chat chat);

  /// Deletes a chat and all its messages
  Future<Result<void>> deleteChat(ChatId id);

  /// Retrieves messages for a specific chat
  Future<Result<List<Message>>> getMessages(ChatId chatId);

  /// Retrieves a specific message by ID
  Future<Result<Message>> getMessage(MessageId id);

  /// Adds a message to a chat
  Future<Result<Message>> addMessage(Message message);

  /// Updates an existing message
  Future<Result<Message>> updateMessage(Message message);

  /// Deletes a message
  Future<Result<void>> deleteMessage(MessageId id);

  /// Searches for messages containing the given text
  Future<Result<List<Message>>> searchMessages(String query);

  /// Gets the most recent chats (for chat list display)
  Future<Result<List<Chat>>> getRecentChats({int limit = 50});

  /// Checks if a chat exists
  Future<Result<bool>> chatExists(ChatId id);

  /// Gets the total number of chats
  Future<Result<int>> getChatCount();

  /// Gets the total number of messages across all chats
  Future<Result<int>> getTotalMessageCount();
}
