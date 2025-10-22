import 'package:drift/drift.dart';
import 'package:tina_app/domain/repositories/chat_models_repository.dart';
import '../database/drift/app_database.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';

/// Implementation of the [WorkspaceRepository] interface.
///
/// This class provides a concrete implementation of workspace data operations
/// using the Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class ChatModelsRepositoryImpl implements ChatModelsRepository {
  final AppDatabase _database;

  ChatModelsRepositoryImpl(this._database);

  @override
  Future<void> createChatModels(List<ChatModelToCreate> chatModels) async {
    await _database.chatModelsDao.insertChatModels(
      chatModels.map(_chatModelToCreateToCompanion).toList(),
    );
  }

  ChatModelsCompanion _chatModelToCreateToCompanion(
    ChatModelToCreate chatModel,
  ) {
    return ChatModelsCompanion(
      displayName: Value(chatModel.displayName),
      modelId: Value(chatModel.modelId),
      modelProvider: Value(chatModel.modelProvider),
      modelType: Value(chatModel.modelType),
    );
  }
}
