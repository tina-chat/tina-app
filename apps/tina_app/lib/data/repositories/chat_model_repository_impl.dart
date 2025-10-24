import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/daos/chat_models_dao.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/domain/entities/model_providers_entities.dart';
import 'package:tina_app/domain/repositories/chat_models_repository.dart';

import '../database/drift/app_database.dart';

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

  @override
  Future<List<ChatModelWithProviderEntity>> getChatModels(
    ChatModelsFilter filter,
  ) async {
    final tableResults = await _database.chatModelsDao
        .getAllChatModelsByWorkspace(workspaceIds: filter.workspaces ?? []);
    return tableResults.map(_withProviderTableToEntity).toList();
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

  ChatModelWithProviderEntity _withProviderTableToEntity(
    ChatModelWithProvider withProvider,
  ) {
    return ChatModelWithProviderEntity(
      chatModel: ChatModelEntity(
        id: withProvider.chatModel.id,
        displayName: withProvider.chatModel.displayName,
        modelId: withProvider.chatModel.modelId,
        modelType: withProvider.chatModel.modelType,
        createdAt: withProvider.chatModel.createdAt,
        updatedAt: withProvider.chatModel.updatedAt,
        modelProviderId: withProvider.chatModel.modelProvider,
      ),
      modelProvider: ModelProviderEntity(
        id: withProvider.modelProvider.id,
        name: withProvider.modelProvider.name,
        type: withProvider.modelProvider.type,
        key: withProvider.modelProvider.keyValue,
        createdAt: withProvider.modelProvider.createdAt,
        updatedAt: withProvider.modelProvider.updatedAt,
        workspaceId: withProvider.modelProvider.workspace,
      ),
    );
  }
}
