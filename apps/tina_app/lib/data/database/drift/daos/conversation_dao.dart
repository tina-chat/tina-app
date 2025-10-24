import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/conversations_table.dart';

part 'conversation_dao.g.dart';

@DriftAccessor(tables: [Conversations])
class ConversationDao extends DatabaseAccessor<AppDatabase>
    with _$ConversationDaoMixin {
  ConversationDao(super.db);

  // Core CRUD operations
  Future<int> insertConversation(ConversationsCompanion conversation) =>
      into(conversations).insert(conversation);

  Future<ConversationsTable?> getConversationById(String id) => (select(
    conversations,
  )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<bool> updateConversation(
    String id,
    ConversationsCompanion companion,
  ) => (update(conversations)..where((tbl) => tbl.id.equals(id)))
      .write(companion)
      .then((count) => count > 0);

  Future<bool> deleteConversation(String id) => (delete(
    conversations,
  )..where((tbl) => tbl.id.equals(id))).go().then((count) => count > 0);

  // Business-specific queries
  Future<List<ConversationsTable>> getConversationsByWorkspace(
    String workspaceId,
  ) =>
      (select(conversations)
            ..where((tbl) => tbl.workspaceId.equals(workspaceId))
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.updatedAt,
                mode: OrderingMode.desc,
              ),
            ]))
          .get();

  Future<List<ConversationsTable>> getPinnedConversations(String workspaceId) =>
      (select(conversations)
            ..where(
              (tbl) =>
                  tbl.workspaceId.equals(workspaceId) &
                  tbl.isPinned.equals(true),
            )
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.updatedAt,
                mode: OrderingMode.desc,
              ),
            ]))
          .get();

  Future<int> getConversationCountByWorkspace(String workspaceId) =>
      (selectOnly(conversations)
            ..addColumns([conversations.id.count()])
            ..where(conversations.workspaceId.equals(workspaceId)))
          .map((row) => row.read(conversations.id.count()) ?? 0)
          .getSingle();

  Future<bool> conversationExists(String id) =>
      (selectOnly(conversations)
            ..addColumns([conversations.id.count()])
            ..where(conversations.id.equals(id)))
          .map((row) => row.read(conversations.id.count()) ?? 0)
          .getSingle()
          .then((result) => result > 0);

  Future<List<ConversationsTable>> searchConversationsByTitle(
    String workspaceId,
    String query,
  ) =>
      (select(conversations)
            ..where(
              (tbl) =>
                  tbl.workspaceId.equals(workspaceId) &
                  tbl.title.contains(query),
            )
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.updatedAt,
                mode: OrderingMode.desc,
              ),
            ]))
          .get();
}
