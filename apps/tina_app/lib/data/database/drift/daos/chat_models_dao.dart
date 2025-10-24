import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/chat_models_table.dart';

import '../app_database.dart';

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
    required List<int> workspaceIds,
  }) {
    final query = (select(chatModels).join([
      innerJoin(
        modelProviders,
        modelProviders.id.equalsExp(chatModels.modelProvider),
      ),
    ])..where(modelProviders.workspace.isIn(workspaceIds)));

    return query
        .map(
          (row) => ChatModelWithProvider(
            row.readTable(chatModels),
            row.readTable(modelProviders),
          ),
        )
        .get();
  }
}
