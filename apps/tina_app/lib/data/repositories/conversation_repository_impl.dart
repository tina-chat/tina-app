import 'package:drift/drift.dart';

import '../../domain/entities/conversation.dart';
import '../../domain/repositories/conversation_repository.dart';
import '../database/drift/app_database.dart';

/// Implementation of [ConversationRepository] interface.
///
/// This class provides a concrete implementation of conversation data operations
/// using Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class ConversationRepositoryImpl implements ConversationRepository {
  /// The database instance for conversation operations.
  final AppDatabase _database;

  /// Creates a new [ConversationRepositoryImpl] instance.
  ///
  /// [database] The database instance for conversation operations.
  ConversationRepositoryImpl(this._database);

  @override
  Future<List<ConversationEntity>> getConversationsByWorkspace(
    String workspaceId,
  ) async {
    try {
      final conversationTables = await _database.conversationDao
          .getConversationsByWorkspace(workspaceId);
      return conversationTables.map(_mapToConversation).toList();
    } catch (e) {
      throw ConversationException(
        'Failed to retrieve conversations for workspace $workspaceId',
        e as Exception,
      );
    }
  }

  @override
  Future<ConversationEntity?> getConversationById(String id) async {
    try {
      final conversationTable = await _database.conversationDao
          .getConversationById(id);
      return conversationTable != null
          ? _mapToConversation(conversationTable)
          : null;
    } catch (e) {
      throw ConversationException(
        'Failed to retrieve conversation with ID $id',
        e as Exception,
      );
    }
  }

  @override
  Future<List<ConversationEntity>> getPinnedConversations(
    String workspaceId,
  ) async {
    try {
      final conversationTables = await _database.conversationDao
          .getPinnedConversations(workspaceId);
      return conversationTables.map(_mapToConversation).toList();
    } catch (e) {
      throw ConversationException(
        'Failed to retrieve pinned conversations for workspace $workspaceId',
        e as Exception,
      );
    }
  }

  @override
  Future<ConversationEntity> createConversation(
    ConversationToCreate conversation,
  ) async {
    try {
      // Validate conversation before creating
      if (!await validateConversation(conversation)) {
        throw const ConversationValidationException(
          'Invalid conversation data',
        );
      }

      final conversationCompanion = _mapToConversationsCompanion(conversation);
      final createdConversation = await _database.conversationDao
          .insertConversation(conversationCompanion);

      return _mapToConversation(createdConversation);
    } catch (e) {
      if (e is ConversationException) rethrow;
      throw ConversationException(
        'Failed to create conversation',
        e as Exception,
      );
    }
  }

  @override
  Future<ConversationEntity> updateConversation(
    String id,
    ConversationToUpdate conversation,
  ) async {
    try {
      // Validate conversation before updating
      if (!_validateConversationUpdate(conversation)) {
        throw const ConversationValidationException(
          'Invalid conversation data',
        );
      }

      // Check if conversation exists
      if (!await conversationExists(id)) {
        throw ConversationNotFoundException(id);
      }

      final conversationCompanion = _mapUpdateToConversationsCompanion(
        conversation,
      );
      final updated = await _database.conversationDao.updateConversation(
        id,
        conversationCompanion,
      );

      if (!updated) {
        throw ConversationException(
          'Failed to update conversation with ID $id',
        );
      }

      final updatedConversation = await _database.conversationDao
          .getConversationById(id);

      if (updatedConversation == null) {
        throw ConversationException(
          'Failed to retrieve updated conversation with ID $id',
        );
      }

      return _mapToConversation(updatedConversation);
    } catch (e) {
      if (e is ConversationException) rethrow;
      throw ConversationException(
        'Failed to update conversation',
        e as Exception,
      );
    }
  }

  @override
  Future<bool> deleteConversation(String id) async {
    try {
      // Check if conversation exists
      if (!await conversationExists(id)) {
        return false; // Return false instead of throwing for delete operations
      }

      final deleted = await _database.conversationDao.deleteConversation(id);
      return deleted;
    } catch (e) {
      throw ConversationException(
        'Failed to delete conversation',
        e as Exception,
      );
    }
  }

  @override
  Future<bool> conversationExists(String id) async {
    try {
      return await _database.conversationDao.conversationExists(id);
    } catch (e) {
      throw ConversationException(
        'Failed to check conversation existence',
        e as Exception,
      );
    }
  }

  @override
  Future<List<ConversationEntity>> searchConversationsByTitle(
    String workspaceId,
    String query,
  ) async {
    try {
      final conversationTables = await _database.conversationDao
          .searchConversationsByTitle(workspaceId, query);
      return conversationTables.map(_mapToConversation).toList();
    } catch (e) {
      throw ConversationException(
        'Failed to search conversations',
        e as Exception,
      );
    }
  }

  @override
  Future<int> getConversationCountByWorkspace(String workspaceId) async {
    try {
      return await _database.conversationDao.getConversationCountByWorkspace(
        workspaceId,
      );
    } catch (e) {
      throw ConversationException(
        'Failed to get conversation count',
        e as Exception,
      );
    }
  }

  @override
  Future<bool> validateConversation(ConversationToCreate conversation) async {
    try {
      if (!conversation.isValid) {
        throw ConversationValidationException(
          _getValidationErrorToCreate(conversation),
        );
      }
      return true;
    } catch (e) {
      if (e is ConversationValidationException) rethrow;
      throw ConversationValidationException(
        'Conversation validation failed',
        e as Exception,
      );
    }
  }

  bool _validateConversationUpdate(ConversationToUpdate conversation) {
    try {
      if (!conversation.isValid) {
        throw ConversationValidationException(
          _getValidationErrorToUpdate(conversation),
        );
      }
      return true;
    } catch (e) {
      if (e is ConversationValidationException) rethrow;
      throw ConversationValidationException(
        'Conversation validation failed',
        e as Exception,
      );
    }
  }

  @override
  Future<bool> updateConversationTimestamp(String id) async {
    try {
      // Check if conversation exists
      if (!await conversationExists(id)) {
        return false; // Return false instead of throwing for update operations
      }

      final updated = await _database.conversationDao.updateConversation(
        id,
        ConversationsCompanion(updatedAt: Value(DateTime.now())),
      );
      return updated;
    } catch (e) {
      throw ConversationException(
        'Failed to update conversation timestamp',
        e as Exception,
      );
    }
  }

  /// Maps a [conversationTable] database record to a [ConversationEntity] domain entity.
  ///
  /// [conversationTable] The database record to map.
  /// Returns the corresponding [ConversationEntity] entity.
  ConversationEntity _mapToConversation(ConversationsTable conversationTable) {
    return ConversationEntity(
      id: conversationTable.id,
      title: conversationTable.title,
      workspaceId: conversationTable.workspaceId,
      modelId: conversationTable.modelId,
      isPinned: conversationTable.isPinned,
      createdAt: conversationTable.createdAt,
      updatedAt: conversationTable.updatedAt,
    );
  }

  /// Maps a [ConversationEntity] domain entity to a [ConversationsCompanion] for database operations.
  ///
  /// [conversation] The conversation entity to map.
  /// [forUpdate] Whether this mapping is for an update operation.
  /// Returns the corresponding [ConversationsCompanion].
  ConversationsCompanion _mapToConversationsCompanion(
    ConversationToCreate conversation,
  ) {
    return ConversationsCompanion(
      title: Value(conversation.title),
      workspaceId: Value(conversation.workspaceId),
      modelId: Value(conversation.modelId),
      isPinned: Value(conversation.isPinned ?? false),
    );
  }

  ConversationsCompanion _mapUpdateToConversationsCompanion(
    ConversationToUpdate conversation,
  ) {
    return ConversationsCompanion(
      title: Value.absentIfNull(conversation.title!),
      modelId: Value.absentIfNull(conversation.modelId),
      isPinned: Value.absentIfNull(conversation.isPinned),
    );
  }

  /// Gets validation error message for a conversation.
  ///
  /// [conversation] The conversation to validate.
  /// Returns a string describing the validation error.
  String _getValidationErrorToCreate(ConversationToCreate conversation) {
    if (conversation.title.isEmpty) return 'Conversation title cannot be empty';
    if (conversation.workspaceId.isEmpty) return 'Workspace ID cannot be empty';
    return 'Unknown validation error';
  }

  /// Gets validation error message for a conversation.
  ///
  /// [conversation] The conversation to validate.
  /// Returns a string describing the validation error.
  String _getValidationErrorToUpdate(ConversationToUpdate conversation) {
    if (conversation.title != null && conversation.title!.isEmpty) {
      return 'Conversation title cannot be empty';
    }
    if (conversation.modelId != null && conversation.modelId!.isEmpty) {
      return 'Model ID cannot be empty';
    }
    return 'Unknown validation error';
  }
}
