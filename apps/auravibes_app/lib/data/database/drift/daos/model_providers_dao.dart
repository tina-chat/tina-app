import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/tables/model_provider_table.dart';
import 'package:drift/drift.dart';

part 'model_providers_dao.g.dart';

/// Data Access Object for workspace operations.
@DriftAccessor(tables: [ModelProviders])
class ModelProvidersDao extends DatabaseAccessor<AppDatabase>
    with _$ModelProvidersDaoMixin {
  /// Creates a new [ModelProvidersDao] instance.
  ModelProvidersDao(super.attachedDatabase);

  Future<List<ModelProvidersTable>> getAllModelProvidersByWorkspace({
    required List<String> workspaceIds,
  }) {
    return (select(modelProviders)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)])
          ..where((u) => u.workspaceId.isIn(workspaceIds)))
        .get();
  }

  Future<ModelProvidersTable?> getModelProviderById(String id) {
    return (select(
      modelProviders,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<ModelProvidersTable> insertModelProvider(
    ModelProvidersCompanion modelProvider,
  ) async {
    return into(modelProviders).insertReturning(modelProvider);
  }
}
