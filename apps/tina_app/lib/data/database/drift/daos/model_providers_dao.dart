import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/model_provider_table.dart';
import '../app_database.dart';

part 'model_providers_dao.g.dart';

/// Data Access Object for workspace operations.
@DriftAccessor(tables: [ModelProviders])
class ModelProvidersDao extends DatabaseAccessor<AppDatabase>
    with _$ModelProvidersDaoMixin {
  /// Creates a new [ModelProvidersDao] instance.
  ModelProvidersDao(super.db);

  Future<List<ModelProvidersTable>> getAllModelProvidersByWorkspace({
    required List<int> workspaceIds,
  }) {
    return (select(modelProviders)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)])
          ..where((u) => u.workspace.isIn(workspaceIds)))
        .get();
  }

  Future<ModelProvidersTable?> getModelProviderById(int id) {
    return (select(
      modelProviders,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertModelProvider(ModelProvidersCompanion modelProvider) async {
    return await into(modelProviders).insert(modelProvider);
  }
}
