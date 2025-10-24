import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/enums/message_table_enums.dart';
import 'package:tina_app/domain/enums/message_types.dart';

import '../../domain/entities/conversation.dart';
import '../../domain/repositories/message_repository.dart';
import '../database/drift/app_database.dart';

/// Implementation of [MessageRepository] interface.
///
/// This class provides a concrete implementation of message data operations
/// using Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class MessageRepositoryImpl implements MessageRepository {
  /// The database instance for message operations.
  final AppDatabase _database;

  /// Creates a new [MessageRepositoryImpl] instance.
  ///
  /// [database] The database instance for message operations.
  MessageRepositoryImpl(this._database);

  @override
  Future<List<MessageEntity>> getMessagesByConversation(
    String conversationId,
  ) async {
    try {
      final messageTables = await _database.messageDao
          .getMessagesByConversation(conversationId);
      return messageTables.map(_mapToMessage).toList();
    } catch (e) {
      throw MessageException(
        'Failed to retrieve messages for conversation $conversationId',
        e as Exception,
      );
    }
  }

  @override
  Future<List<MessageEntity>> getMessagesByConversationPaginated(
    String conversationId,
    int limit,
    int offset,
  ) async {
    try {
      final messageTables = await _database.messageDao
          .getMessagesByConversationPaginated(conversationId, limit, offset);
      return messageTables.map(_mapToMessage).toList();
    } catch (e) {
      throw MessageException(
        'Failed to retrieve paginated messages for conversation $conversationId',
        e as Exception,
      );
    }
  }

  @override
  Future<List<MessageEntity>> getMessagesByType(
    String conversationId,
    MessageType messageType,
  ) async {
    try {
      final messageTables = await _database.messageDao.getMessagesByType(
        conversationId,
        _messageTypeToTableType(messageType),
      );
      return messageTables.map(_mapToMessage).toList();
    } catch (e) {
      throw MessageException(
        'Failed to retrieve messages of type $messageType for conversation $conversationId',
        e as Exception,
      );
    }
  }

  @override
  Future<List<MessageEntity>> getUserMessages(String conversationId) async {
    try {
      final messageTables = await _database.messageDao.getUserMessages(
        conversationId,
      );
      return messageTables.map(_mapToMessage).toList();
    } catch (e) {
      throw MessageException(
        'Failed to retrieve user messages for conversation $conversationId',
        e as Exception,
      );
    }
  }

  @override
  Future<List<MessageEntity>> getSystemMessages(String conversationId) async {
    try {
      final messageTables = await _database.messageDao.getSystemMessages(
        conversationId,
      );
      return messageTables.map(_mapToMessage).toList();
    } catch (e) {
      throw MessageException(
        'Failed to retrieve system messages for conversation $conversationId',
        e as Exception,
      );
    }
  }

  @override
  Future<MessageEntity?> getMessageById(String id) async {
    try {
      final messageTable = await _database.messageDao.getMessageById(id);
      return messageTable != null ? _mapToMessage(messageTable) : null;
    } catch (e) {
      throw MessageException(
        'Failed to retrieve message with ID $id',
        e as Exception,
      );
    }
  }

  @override
  Future<MessageEntity> createMessage(MessageToCreate message) async {
    try {
      // Validate message before creating
      if (!await validateMessage(message)) {
        throw const MessageValidationException('Invalid message data');
      }

      final messageCompanion = _mapToMessagesCompanion(message);
      final createdMessage = await _database.messageDao.insertMessage(
        messageCompanion,
      );

      return _mapToMessage(createdMessage);
    } catch (e) {
      if (e is MessageException) rethrow;
      throw MessageException('Failed to create message', e as Exception);
    }
  }

  @override
  Future<MessageEntity> updateMessage(
    String id,
    MessageToCreate message,
  ) async {
    try {
      // Validate message before updating
      if (!await validateMessage(message)) {
        throw const MessageValidationException('Invalid message data');
      }

      // Check if message exists
      if (!await messageExists(id)) {
        throw MessageNotFoundException(id);
      }

      final messageCompanion = _mapToMessagesCompanion(
        message,
        forUpdate: true,
      );
      final updated = await _database.messageDao.updateMessage(
        id,
        messageCompanion,
      );

      if (!updated) {
        throw MessageException('Failed to update message with ID $id');
      }

      final updatedMessage = await _database.messageDao.getMessageById(id);

      if (updatedMessage == null) {
        throw MessageException(
          'Failed to retrieve updated message with ID $id',
        );
      }

      return _mapToMessage(updatedMessage);
    } catch (e) {
      if (e is MessageException) rethrow;
      throw MessageException('Failed to update message', e as Exception);
    }
  }

  @override
  Future<bool> deleteMessage(String id) async {
    try {
      // Check if message exists
      if (!await messageExists(id)) {
        return false; // Return false instead of throwing for delete operations
      }

      final deleted = await _database.messageDao.deleteMessage(id);
      return deleted;
    } catch (e) {
      throw MessageException('Failed to delete message', e as Exception);
    }
  }

  @override
  Future<bool> messageExists(String id) async {
    try {
      return await _database.messageDao.messageExists(id);
    } catch (e) {
      throw MessageException(
        'Failed to check message existence',
        e as Exception,
      );
    }
  }

  @override
  Future<List<MessageEntity>> getMessagesByStatus(
    String conversationId,
    MessageStatus status,
  ) async {
    try {
      final messageTables = await _database.messageDao.getMessagesByStatus(
        conversationId,
        status.value,
      );
      return messageTables.map(_mapToMessage).toList();
    } catch (e) {
      throw MessageException(
        'Failed to retrieve messages with status $status for conversation $conversationId',
        e as Exception,
      );
    }
  }

  @override
  Future<int> getMessageCountByConversation(String conversationId) async {
    try {
      return await _database.messageDao.getMessageCountByConversation(
        conversationId,
      );
    } catch (e) {
      throw MessageException('Failed to get message count', e as Exception);
    }
  }

  @override
  Future<bool> validateMessage(MessageToCreate message) async {
    try {
      if (!message.isValid) {
        throw MessageValidationException(_getValidationErrorToCreate(message));
      }
      return true;
    } catch (e) {
      if (e is MessageValidationException) rethrow;
      throw MessageValidationException(
        'Message validation failed',
        e as Exception,
      );
    }
  }

  /// Maps a [messageTable] database record to a [MessageEntity] domain entity.
  ///
  /// [messageTable] The database record to map.
  /// Returns the corresponding [MessageEntity] entity.
  MessageEntity _mapToMessage(MessagesTable messageTable) {
    return MessageEntity(
      id: messageTable.id,
      conversationId: messageTable.conversationId,
      content: messageTable.content,
      messageType: MessageType.fromString(messageTable.messageType.value),
      isUser: messageTable.isUser,
      status: _messageTableStatusToEntityStatus(messageTable.status),
      metadata: messageTable.metadata,
      createdAt: messageTable.createdAt,
      updatedAt: messageTable.updatedAt,
    );
  }

  /// Maps a [MessageEntity] domain entity to a [MessagesCompanion] for database operations.
  ///
  /// [message] The message entity to map.
  /// [forUpdate] Whether this mapping is for an update operation.
  /// Returns a corresponding [MessagesCompanion].
  MessagesCompanion _mapToMessagesCompanion(
    MessageToCreate message, {
    bool forUpdate = false,
  }) {
    return MessagesCompanion(
      conversationId: Value(message.conversationId),
      content: Value(message.content),
      messageType: Value(_messageTypeToTableType(message.messageType)),
      isUser: Value(message.isUser),
      status: Value(
        _messageStatusToTableStatus(message.status ?? MessageStatus.sending),
      ),
      metadata: Value(message.metadata),
    );
  }

  /// Gets validation error message for a message.
  ///
  /// [message] The message to validate.
  /// Returns a string describing the validation error.
  String _getValidationErrorToCreate(MessageToCreate message) {
    if (message.content.isEmpty) return 'Message content cannot be empty';
    if (message.conversationId.isEmpty) {
      return 'Conversation ID cannot be empty';
    }
    return 'Unknown validation error';
  }

  MessageStatus _messageTableStatusToEntityStatus(MessageTableStatus status) {
    return switch (status) {
      MessageTableStatus.sent => MessageStatus.sent,
      MessageTableStatus.sending => MessageStatus.sending,
      MessageTableStatus.read => MessageStatus.read,
      MessageTableStatus.error => MessageStatus.error,
      MessageTableStatus.delivered => MessageStatus.delivered,
    };
  }

  MessageTableStatus _messageStatusToTableStatus(MessageStatus status) {
    return switch (status) {
      MessageStatus.sent => MessageTableStatus.sent,
      MessageStatus.sending => MessageTableStatus.sending,
      MessageStatus.read => MessageTableStatus.read,
      MessageStatus.error => MessageTableStatus.error,
      MessageStatus.delivered => MessageTableStatus.delivered,
    };
  }

  MessagesTableType _messageTypeToTableType(MessageType messageType) {
    return switch (messageType) {
      MessageType.text => MessagesTableType.text,
      MessageType.image => MessagesTableType.image,
      MessageType.toolCall => MessagesTableType.toolCall,
      MessageType.system => MessagesTableType.system,
    };
  }
}
