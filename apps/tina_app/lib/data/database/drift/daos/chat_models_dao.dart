import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/chat_models_table.dart';
import '../app_database.dart';

part 'chat_models_dao.g.dart';

/// Data Access Object for workspace operations.
@DriftAccessor(tables: [ChatModels])
class ChatModelsDao extends DatabaseAccessor<AppDatabase>
    with _$ChatModelsDaoMixin {
  /// Creates a new [ChatModelsDao] instance.
  ChatModelsDao(super.db);

  Future<List<ChatModelsTable>> getAllChatModelsByWorkspace({
    required List<int> workspaceIds,
  }) {
    return (select(chatModels)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)])
          ..where((u) => u.workspace.isIn(workspaceIds)))
        .get();
  }

  Future<ChatModelsTable?> getChatModelById(int id) {
    return (select(
      chatModels,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertChatModel(ChatModelsCompanion chatModel) async {
    await into(chatModels).insert(chatModel);
    return chatModel.id.value;
  }
}
