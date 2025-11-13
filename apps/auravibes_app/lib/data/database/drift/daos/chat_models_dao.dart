import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/tables/chat_models_table.dart';
import 'package:drift/drift.dart';

part 'chat_models_dao.g.dart';

class ChatModelWithProvider {
  ChatModelWithProvider(this.chatModel, this.modelProvider);

  final ChatModelsTable chatModel;
  final ModelProvidersTable modelProvider;
}

/// Data Access Object for workspace operations.
@DriftAccessor(tables: [ChatModels])
class ChatModelsDao extends DatabaseAccessor<AppDatabase>
    with _$ChatModelsDaoMixin {
  ChatModelsDao(super.db);

  Future<void> insertChatModels(
    List<ChatModelsCompanion> modelProvidersToInsert,
  ) async {
    await batch((batch) {
      batch.insertAll(chatModels, modelProvidersToInsert);
    });
  }

  Future<List<ChatModelWithProvider>> getAllChatModelsByWorkspace({
    required List<String> workspaceIds,
  }) {
    final query = (select(chatModels).join([
      innerJoin(
        modelProviders,
        modelProviders.id.equalsExp(chatModels.modelProviderId),
      ),
    ])..where(modelProviders.workspaceId.isIn(workspaceIds)));

    return query
        .map(
          (row) => ChatModelWithProvider(
            row.readTable(chatModels),
            row.readTable(modelProviders),
          ),
        )
        .get();
  }

  Future<ChatModelWithProvider?> getAllChatModelsById(String id) {
    final query = (select(chatModels).join([
      innerJoin(
        modelProviders,
        modelProviders.id.equalsExp(chatModels.modelProviderId),
      ),
    ])..where(chatModels.id.equals(id)));

    return query
        .map(
          (row) => ChatModelWithProvider(
            row.readTable(chatModels),
            row.readTable(modelProviders),
          ),
        )
        .getSingleOrNull();
  }
}
