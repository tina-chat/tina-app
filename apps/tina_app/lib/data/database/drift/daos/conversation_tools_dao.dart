import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/conversation_disabled_tools_table.dart';

part 'conversation_tools_dao.g.dart';

@DriftAccessor(tables: [ConversationDisabledTools])
class ConversationToolsDao extends DatabaseAccessor<AppDatabase>
    with _$ConversationToolsDaoMixin {
  ConversationToolsDao(super.db);

  // Core operations for disabled tools
  Future<ConversationDisabledToolsTable?> getDisabledConversationTool(
    String conversationId,
    String toolType,
  ) =>
      (select(conversationDisabledTools)..where(
            (tbl) =>
                tbl.conversationId.equals(conversationId) &
                tbl.type.equals(toolType),
          ))
          .getSingleOrNull();

  Future<bool> disableConversationTool(String conversationId, String toolType) {
    return customUpdate(
      'INSERT OR REPLACE INTO conversation_disabled_tools (conversation_id, type, created_at, updated_at) '
      'VALUES (?, ?, datetime(\'now\'), datetime(\'now\'))',
      variables: [
        Variable.withString(conversationId),
        Variable.withString(toolType),
      ],
    ).then((count) => count > 0);
  }

  Future<bool> enableConversationTool(String conversationId, String toolType) =>
      (delete(conversationDisabledTools)..where(
            (tbl) =>
                tbl.conversationId.equals(conversationId) &
                tbl.type.equals(toolType),
          ))
          .go()
          .then((count) => count > 0);

  Future<bool> toggleConversationTool(
    String conversationId,
    String toolType,
  ) async {
    final isCurrentlyDisabled = await isConversationToolDisabled(
      conversationId,
      toolType,
    );
    if (isCurrentlyDisabled) {
      return enableConversationTool(conversationId, toolType);
    } else {
      return disableConversationTool(conversationId, toolType);
    }
  }

  Future<bool> isConversationToolDisabled(
    String conversationId,
    String toolType,
  ) =>
      (selectOnly(conversationDisabledTools)
            ..addColumns([conversationDisabledTools.id.count()])
            ..where(
              conversationDisabledTools.conversationId.equals(conversationId) &
                  conversationDisabledTools.type.equals(toolType),
            ))
          .map((row) => row.read(conversationDisabledTools.id.count()) ?? 0)
          .getSingle()
          .then((result) => result > 0);

  // Query operations for disabled tools
  Future<List<ConversationDisabledToolsTable>> getDisabledConversationTools(
    String conversationId,
  ) =>
      (select(conversationDisabledTools)
            ..where((tbl) => tbl.conversationId.equals(conversationId))
            ..orderBy([
              (tbl) =>
                  OrderingTerm(expression: tbl.type, mode: OrderingMode.asc),
            ]))
          .get();

  Future<int> getDisabledConversationToolsCount(String conversationId) =>
      (selectOnly(conversationDisabledTools)
            ..addColumns([conversationDisabledTools.id.count()])
            ..where(
              conversationDisabledTools.conversationId.equals(conversationId),
            ))
          .map((row) => row.read(conversationDisabledTools.id.count()) ?? 0)
          .getSingle();

  // Bulk operations
  Future<void> removeDisabledToolsForConversation(String conversationId) =>
      (delete(
        conversationDisabledTools,
      )..where((tbl) => tbl.conversationId.equals(conversationId))).go();

  Future<void> initializeConversationFromWorkspace(
    String conversationId,
    String workspaceId,
  ) async {
    // Note: This method is no longer needed since we don't copy workspace tools
    // We'll just ensure no disabled tools exist for the conversation initially
    await removeDisabledToolsForConversation(conversationId);
  }

  Future<void> copyConversationTools(
    String sourceConversationId,
    String targetConversationId,
  ) async {
    // Copy disabled tools from source conversation to target conversation
    final sourceDisabledTools = await getDisabledConversationTools(
      sourceConversationId,
    );

    for (final tool in sourceDisabledTools) {
      await disableConversationTool(targetConversationId, tool.type);
    }
  }
}
