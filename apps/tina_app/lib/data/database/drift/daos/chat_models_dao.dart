import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/chat_models_table.dart';
import '../app_database.dart';

part 'chat_models_dao.g.dart';

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
}
