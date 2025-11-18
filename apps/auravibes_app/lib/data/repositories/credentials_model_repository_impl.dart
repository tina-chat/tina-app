import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/daos/credential_models_dao.dart';
import 'package:auravibes_app/data/database/drift/tables/api_model_provider_table.dart';
import 'package:auravibes_app/domain/entities/api_model_provider.dart';
import 'package:auravibes_app/domain/entities/credentials_entities.dart';
import 'package:auravibes_app/domain/entities/credentials_models_entities.dart';
import 'package:auravibes_app/domain/repositories/chat_models_repository.dart';
import 'package:auravibes_app/domain/repositories/workspace_repository.dart'
    show WorkspaceRepository;

/// Implementation of the [WorkspaceRepository] interface.
///
/// This class provides a concrete implementation of workspace data operations
/// using the Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class CredentialsModelsRepositoryImpl implements CredentialsModelsRepository {
  CredentialsModelsRepositoryImpl(this._database);
  final AppDatabase _database;

  @override
  Future<void> createCredentialsModels(
    List<CredentialModelToCreate> credentialsModels,
  ) async {
    await _database.credentialModelsDao.insertCredentialsModels(
      credentialsModels.map(_credentialsModelToCreateToCompanion).toList(),
    );
  }

  @override
  Future<List<CredentialsModelWithProviderEntity>> getCredentialsModels(
    CredentialsModelsFilter filter,
  ) async {
    final tableResults = await _database.credentialModelsDao
        .getAllModelsByWorkspace(workspaceIds: filter.workspaces ?? []);
    return tableResults.map(_withProviderTableToEntity).toList();
  }

  @override
  Future<CredentialsModelWithProviderEntity?> getCredentialsModelById(
    String id,
  ) async {
    final credentialsWithModels = await _database.credentialModelsDao
        .getAllModelsById(id);
    if (credentialsWithModels == null) return null;
    return _withProviderTableToEntity(credentialsWithModels);
  }

  CredentialModelsCompanion _credentialsModelToCreateToCompanion(
    CredentialModelToCreate credentialsModel,
  ) {
    return CredentialModelsCompanion(
      modelId: .new(credentialsModel.modelId),
      credentialsId: .new(credentialsModel.credentialsId),
    );
  }

  CredentialsModelWithProviderEntity _withProviderTableToEntity(
    CredentialsWithModels withProvider,
  ) {
    return CredentialsModelWithProviderEntity(
      credentialsModel: CredentialsModelEntity(
        id: withProvider.model.id,
        modelId: withProvider.model.modelId,
        credentialsId: withProvider.model.credentialsId,
        createdAt: withProvider.model.createdAt,
        updatedAt: withProvider.model.updatedAt,
      ),
      credentials: CredentialsEntity(
        id: withProvider.credentials.id,
        name: withProvider.credentials.name,
        key: withProvider.credentials.keyValue,
        createdAt: withProvider.credentials.createdAt,
        updatedAt: withProvider.credentials.updatedAt,
        workspaceId: withProvider.credentials.workspaceId,
        url: withProvider.credentials.url,
        modelId: withProvider.credentials.modelId,
      ),
      modelsProvider: ApiModelProviderEntity(
        id: withProvider.modelProvider.id,
        name: withProvider.modelProvider.name,
        type: _mapToTypeTable(withProvider.modelProvider.type),
        doc: withProvider.modelProvider.doc,
        url: withProvider.modelProvider.url,
      ),
    );
  }

  ModelProvidersType? _mapToTypeTable(ModelProvidersTableType? type) {
    if (type == null) return null;
    return switch (type) {
      .openai => .openai,
      .anthropic => .openai,
    };
  }
}
