import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/messages_table.dart';

part 'message_dao.g.dart';

@DriftAccessor(tables: [Messages])
class MessageDao extends DatabaseAccessor<AppDatabase> with _$MessageDaoMixin {
  MessageDao(super.db);

  // Core CRUD operations
  Future<int> insertMessage(MessagesCompanion message) =>
      into(messages).insert(message);

  Future<MessagesTable?> getMessageById(String id) =>
      (select(messages)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<bool> updateMessage(String id, MessagesCompanion companion) =>
      (update(messages)..where((tbl) => tbl.id.equals(id)))
          .write(companion)
          .then((count) => count > 0);

  Future<bool> deleteMessage(String id) => (delete(
    messages,
  )..where((tbl) => tbl.id.equals(id))).go().then((count) => count > 0);

  // Business-specific queries
  Future<List<MessagesTable>> getMessagesByConversation(
    String conversationId,
  ) =>
      (select(messages)
            ..where((tbl) => tbl.conversationId.equals(conversationId))
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.asc,
              ),
            ]))
          .get();

  Future<List<MessagesTable>> getMessagesByConversationPaginated(
    String conversationId,
    int limit,
    int offset,
  ) =>
      (select(messages)
            ..where((tbl) => tbl.conversationId.equals(conversationId))
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.asc,
              ),
            ])
            ..limit(limit, offset: offset))
          .get();

  Future<List<MessagesTable>> getMessagesByType(
    String conversationId,
    String messageType,
  ) =>
      (select(messages)
            ..where(
              (tbl) =>
                  tbl.conversationId.equals(conversationId) &
                  tbl.messageType.equals(messageType),
            )
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.desc,
              ),
            ]))
          .get();

  Future<List<MessagesTable>> getUserMessages(String conversationId) =>
      (select(messages)
            ..where(
              (tbl) =>
                  tbl.conversationId.equals(conversationId) &
                  tbl.isUser.equals(true),
            )
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.desc,
              ),
            ]))
          .get();

  Future<List<MessagesTable>> getSystemMessages(String conversationId) =>
      (select(messages)
            ..where(
              (tbl) =>
                  tbl.conversationId.equals(conversationId) &
                  tbl.isUser.equals(false),
            )
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.desc,
              ),
            ]))
          .get();

  Future<int> getMessageCountByConversation(String conversationId) =>
      (selectOnly(messages)
            ..addColumns([messages.id.count()])
            ..where(messages.conversationId.equals(conversationId)))
          .map((row) => row.read(messages.id.count()) ?? 0)
          .getSingle();

  Future<bool> messageExists(String id) =>
      (selectOnly(messages)
            ..addColumns([messages.id.count()])
            ..where(messages.id.equals(id)))
          .map((row) => row.read(messages.id.count()) ?? 0)
          .getSingle()
          .then((result) => result > 0);

  Future<List<MessagesTable>> getMessagesByStatus(
    String conversationId,
    String status,
  ) =>
      (select(messages)
            ..where(
              (tbl) =>
                  tbl.conversationId.equals(conversationId) &
                  tbl.status.equals(status),
            )
            ..orderBy([
              (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.desc,
              ),
            ]))
          .get();
}
