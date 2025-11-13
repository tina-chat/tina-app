import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/app_database.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/domain/entities/model_providers_entities.dart';
import 'package:tina_app/domain/repositories/model_providers_repository.dart';
import 'package:tina_app/domain/repositories/workspace_repository.dart'
    show WorkspaceRepository;
import 'package:tina_app/services/model_provider_services/model_provider_services.dart';

/// Implementation of the [WorkspaceRepository] interface.
///
/// This class provides a concrete implementation of workspace data operations
/// using the Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class ModelProvidersRepositoryImpl implements ModelProvidersRepository {
  ModelProvidersRepositoryImpl(this._database);
  final AppDatabase _database;

  @override
  Future<ModelProviderEntity> createModelProvider(
    ModelProviderToCreate workspace,
  ) async {
    final models = await ModelProviderServices().getChatModels(
      ModelProvider(
        type: workspace.type,
        key: workspace.key,
        url: workspace.url,
      ),
    );
    if (models == null) {
      throw ModelProviderNotModelsException(workspace.type);
    }

    final createdChatModel = await _database.modelProvidersDao
        .insertModelProvider(_modelProviderToCreateToCompanion(workspace));

    final chatModels = models
        .map((model) => model.copyWith(modelProviderId: createdChatModel.id))
        .toList();

    await _database.chatModelsDao.insertChatModels(
      chatModels.map(_chatModelToCreateToCompanion).toList(),
    );

    return _modelProviderTableToEntity(createdChatModel);
  }

  @override
  Future<List<ModelProviderEntity>> getModelProviders(
    ModelProviderFilter filter,
  ) async {
    if (filter.workspaces?.isNotEmpty != true) {
      return [];
    }
    final chatModels = await _database.modelProvidersDao
        .getAllModelProvidersByWorkspace(workspaceIds: filter.workspaces!);

    return chatModels.map(_modelProviderTableToEntity).toList();
  }

  ModelProvidersCompanion _modelProviderToCreateToCompanion(
    ModelProviderToCreate workspace,
  ) {
    return ModelProvidersCompanion(
      name: Value(workspace.name),
      type: Value(workspace.type),
      keyValue: Value(workspace.key),
      url: Value(workspace.url),
      workspaceId: Value(workspace.workspaceId),
    );
  }

  ModelProviderEntity _modelProviderTableToEntity(
    ModelProvidersTable chatModel,
  ) {
    return ModelProviderEntity(
      id: chatModel.id,
      name: chatModel.name,
      type: chatModel.type,
      key: chatModel.keyValue,
      url: chatModel.url,
      createdAt: chatModel.createdAt,
      updatedAt: chatModel.updatedAt,
      workspaceId: chatModel.workspaceId,
    );
  }

  ChatModelsCompanion _chatModelToCreateToCompanion(
    ChatModelToCreate chatModel,
  ) {
    return ChatModelsCompanion(
      displayName: Value(chatModel.displayName),
      modelId: Value(chatModel.modelId),
      modelProviderId: Value(chatModel.modelProviderId),
      modelType: Value(chatModel.modelType),
    );
  }
}
