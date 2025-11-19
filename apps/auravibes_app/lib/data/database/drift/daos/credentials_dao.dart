import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/tables/credentials_table.dart';
import 'package:drift/drift.dart';

part 'credentials_dao.g.dart';

/// Data Access Object for workspace operations.
@DriftAccessor(tables: [Credentials])
class CredentialsDao extends DatabaseAccessor<AppDatabase>
    with _$CredentialsDaoMixin {
  /// Creates a new [CredentialsDao] instance.
  CredentialsDao(super.attachedDatabase);

  Future<List<CredentialsTable>> getAllCredentialsByWorkspace({
    required List<String> workspaceIds,
  }) {
    return (select(credentials)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)])
          ..where((u) => u.workspaceId.isIn(workspaceIds)))
        .get();
  }

  Future<CredentialsTable?> getModelProviderById(String id) {
    return (select(
      credentials,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<CredentialsTable> insertModelProvider(
    CredentialsCompanion modelProvider,
  ) async {
    return into(credentials).insertReturning(modelProvider);
  }
}
