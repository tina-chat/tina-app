import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/domain/entities/credentials_entities.dart';
import 'package:auravibes_app/domain/entities/credentials_models_entities.dart';
import 'package:auravibes_app/domain/repositories/model_providers_repository.dart';
import 'package:auravibes_app/domain/repositories/workspace_repository.dart'
    show WorkspaceRepository;
import 'package:auravibes_app/services/model_provider_services/model_provider_services.dart';
import 'package:drift/drift.dart';

/// Implementation of the [WorkspaceRepository] interface.
///
/// This class provides a concrete implementation of workspace data operations
/// using the Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class CredentialsRepositoryImpl implements CredentialsRepository {
  CredentialsRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Future<CredentialsEntity> createCredential(
    CredentialsToCreate credentials,
  ) async {
    final modelProvider = await _database.apiModelProvidersDao.getProviderById(
      credentials.modelId,
    );
    if (modelProvider == null) {
      throw ModelProviderNotModelIdException(credentials.modelId);
    }
    final modelType = modelProvider.type;
    if (modelType == null) {
      ModelProviderNoTypeException(credentials.modelId);
    }
    final models = await ModelProviderServices().getCredentialsModels(
      ModelProvider(
        type: .fromString(modelType!.value),
        key: credentials.key,
        url: credentials.url ?? modelProvider.url,
      ),
    );
    if (models == null) {
      throw ModelProviderNotModelsException(credentials.modelId);
    }

    final createdCredentialsModel = await _database.credentialsDao
        .insertModelProvider(_modelProviderToCreateToCompanion(credentials));

    final credentialsModels = models
        .map(
          (model) => model.copyWith(credentialsId: createdCredentialsModel.id),
        )
        .toList();

    await _database.credentialModelsDao.insertCredentialsModels(
      credentialsModels.map(_credentialsModelToCreateToCompanion).toList(),
    );

    return _modelProviderTableToEntity(createdCredentialsModel);
  }

  @override
  Future<List<CredentialsEntity>> getCredentials(
    ModelProviderFilter filter,
  ) async {
    if (filter.workspaces?.isNotEmpty != true) {
      return [];
    }
    final credentialsModels = await _database.credentialsDao
        .getAllCredentialsByWorkspace(workspaceIds: filter.workspaces!);

    return credentialsModels.map(_modelProviderTableToEntity).toList();
  }

  CredentialsCompanion _modelProviderToCreateToCompanion(
    CredentialsToCreate credentials,
  ) {
    return CredentialsCompanion(
      name: .new(credentials.name),
      keyValue: .new(credentials.key),
      url: .absentIfNull(credentials.url),
      workspaceId: .new(credentials.workspaceId),
      modelId: .new(credentials.modelId),
    );
  }

  CredentialsEntity _modelProviderTableToEntity(
    CredentialsTable credentialsModel,
  ) {
    return CredentialsEntity(
      id: credentialsModel.id,
      name: credentialsModel.name,
      modelId: credentialsModel.modelId,
      key: credentialsModel.keyValue,
      url: credentialsModel.url,
      createdAt: credentialsModel.createdAt,
      updatedAt: credentialsModel.updatedAt,
      workspaceId: credentialsModel.workspaceId,
    );
  }

  CredentialModelsCompanion _credentialsModelToCreateToCompanion(
    CredentialModelToCreate credentialsModel,
  ) {
    return CredentialModelsCompanion(
      modelId: Value(credentialsModel.modelId),
      credentialsId: .new(credentialsModel.credentialsId),
    );
  }
}
