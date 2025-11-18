import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/tables/credentials_models_table.dart';
import 'package:auravibes_app/data/database/drift/tables/credentials_table.dart';
import 'package:drift/drift.dart';

part 'credential_models_dao.g.dart';

class CredentialsWithModels {
  CredentialsWithModels({
    required this.model,
    required this.credentials,
    required this.modelProvider,
  });

  final CredentialModelsTable model;
  final CredentialsTable credentials;
  final ApiModelProvidersTable modelProvider;
}

/// Data Access Object for workspace operations.
@DriftAccessor(tables: [CredentialModels, Credentials])
class CredentialModelsDao extends DatabaseAccessor<AppDatabase>
    with _$CredentialModelsDaoMixin {
  CredentialModelsDao(super.attachedDatabase);

  Future<void> insertCredentialsModels(
    List<CredentialModelsCompanion> modelProvidersToInsert,
  ) async {
    await batch((batch) {
      batch.insertAll(credentialModels, modelProvidersToInsert);
    });
  }

  Future<List<CredentialsWithModels>> getAllModelsByWorkspace({
    required List<String> workspaceIds,
  }) {
    final query = _queryJoins()
      ..where(credentials.workspaceId.isIn(workspaceIds));

    return query
        .map(
          _mapJoin,
        )
        .get();
  }

  Future<CredentialsWithModels?> getAllModelsById(String id) {
    final query = (_queryJoins()..where(credentialModels.id.equals(id)));

    return query
        .map(
          _mapJoin,
        )
        .getSingleOrNull();
  }

  JoinedSelectStatement<HasResultSet, dynamic> _queryJoins() {
    return select(credentialModels).join([
      innerJoin(
        credentials,
        credentials.id.equalsExp(credentialModels.credentialsId),
      ),
      innerJoin(
        apiModelProviders,
        apiModelProviders.id.equalsExp(credentials.modelId),
      ),
    ]);
  }

  CredentialsWithModels _mapJoin(TypedResult row) => CredentialsWithModels(
    credentials: row.readTable(credentials),
    model: row.readTable(credentialModels),
    modelProvider: row.readTable(apiModelProviders),
  );
}
