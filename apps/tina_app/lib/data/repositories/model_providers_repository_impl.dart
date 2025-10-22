import 'package:drift/drift.dart';
import 'package:tina_app/domain/entities/chat_model_model.dart';
import '../database/drift/app_database.dart';
import '../../domain/repositories/model_providers_repository.dart';

/// Implementation of the [WorkspaceRepository] interface.
///
/// This class provides a concrete implementation of workspace data operations
/// using the Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class ModelProvidersRepositoryImpl implements ModelProvidersRepository {
  final AppDatabase _database;

  ModelProvidersRepositoryImpl(this._database);

  @override
  Future<ModelProviderEntity> createModelProvider(
    ModelProviderToCreate workspace,
  ) async {
    final createdId = await _database.modelProvidersDao.insertModelProvider(
      _modelProviderToCreateToCompanion(workspace),
    );

    final createdChatModel = await _database.modelProvidersDao
        .getModelProviderById(createdId);

    if (createdChatModel == null) {
      throw ModelProviderNotFoundException(createdId);
    }

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
      workspace: Value(workspace.workspaceId),
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
      workspaceId: chatModel.workspace,
    );
  }
}
