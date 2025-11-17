import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/tables/api_model_table.dart';
import 'package:drift/drift.dart';
import 'package:logging/logging.dart';

part 'api_models_dao.g.dart';

final _log = Logger('dao:api_models');

/// Data Access Object for API models operations.
@DriftAccessor(tables: [ApiModels])
class ApiModelsDao extends DatabaseAccessor<AppDatabase>
    with _$ApiModelsDaoMixin {
  /// Creates a new [ApiModelsDao] instance.
  ApiModelsDao(super.attachedDatabase);

  /// Retrieves all API models from the database.
  ///
  /// Returns a list of all models ordered by provider and name.
  Future<List<ApiModelsTable>> getAllModels() {
    return (select(apiModels)..orderBy([
          (t) => OrderingTerm(expression: t.modelProvider),
          (t) => OrderingTerm(expression: t.name),
        ]))
        .get();
  }

  /// Retrieves a model by its ID.
  ///
  /// Returns the model with the given [id], or null if not found.
  Future<ApiModelsTable?> getModelById(String id) {
    return (select(apiModels)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Retrieves models by their provider ID.
  ///
  /// Returns a list of models from the specified [providerId].
  Future<List<ApiModelsTable>> getModelsByProvider(String providerId) {
    return (select(apiModels)
          ..where((t) => t.modelProvider.equals(providerId))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
  }

  /// Inserts a new model into the database.
  ///
  /// Returns the inserted model.
  Future<ApiModelsTable> insertModel(ApiModelsCompanion model) {
    return into(apiModels).insertReturning(model);
  }

  /// Updates an existing model in the database.
  ///
  /// Updates the model with the given [id] using the provided [model] data.
  /// Returns true if a model was updated, false otherwise.
  Future<bool> updateModel(String id, ApiModelsCompanion model) async {
    final updateCount = await (update(
      apiModels,
    )..where((t) => t.id.equals(id))).write(model);
    return updateCount > 0;
  }

  /// Deletes a model from the database.
  ///
  /// Deletes the model with the given [id].
  /// Returns true if a model was deleted, false otherwise.
  Future<bool> deleteModel(String id) async {
    final deleteCount = await (delete(
      apiModels,
    )..where((t) => t.id.equals(id))).go();
    return deleteCount > 0;
  }

  /// Deletes all models from a specific provider.
  ///
  /// Deletes all models with the given [providerId].
  /// Returns the number of deleted models.
  Future<int> deleteModelsByProvider(String providerId) async {
    return (delete(
      apiModels,
    )..where((t) => t.modelProvider.equals(providerId))).go();
  }

  /// Checks if a model with the given [id] exists.
  ///
  /// Returns true if the model exists, false otherwise.
  Future<bool> modelExists(String id) async {
    final count =
        await (selectOnly(apiModels)
              ..addColumns([apiModels.id])
              ..where(apiModels.id.equals(id)))
            .get()
            .then((rows) => rows.length);
    return count > 0;
  }

  /// Searches for models by name.
  ///
  /// Returns a list of models whose names contain the [query] string.
  /// The search is case-insensitive.
  Future<List<ApiModelsTable>> searchModelsByName(String query) {
    return (select(apiModels)
          ..where((t) => t.name.contains(query))
          ..orderBy([
            (t) => OrderingTerm(expression: t.modelProvider),
            (t) => OrderingTerm(expression: t.name),
          ]))
        .get();
  }

  /// Gets the count of all models.
  ///
  /// Returns the total number of models in the database.
  Future<int> getModelCount() {
    return (selectOnly(
      apiModels,
    )..addColumns([apiModels.id])).get().then((rows) => rows.length);
  }

  /// Gets the count of models by provider.
  ///
  /// Returns the number of models with the specified [providerId].
  Future<int> getModelCountByProvider(String providerId) {
    return (selectOnly(apiModels)
          ..addColumns([apiModels.id])
          ..where(apiModels.modelProvider.equals(providerId)))
        .get()
        .then((rows) => rows.length);
  }

  /// Inserts or updates a model based on the ID.
  ///
  /// If a model with the given ID exists, it will be updated.
  /// Otherwise, a new model will be inserted.
  /// Returns the inserted/updated model.
  Future<ApiModelsTable> upsertModel(ApiModelsCompanion model) async {
    final existingModel = await getModelById(model.id.value);

    if (existingModel != null) {
      await updateModel(model.id.value, model);
      return (await getModelById(model.id.value))!;
    } else {
      return insertModel(model);
    }
  }

  /// Batch inserts multiple models into the database.
  ///
  /// Returns the list of inserted models.
  Future<List<ApiModelsTable>> batchInsertModels(
    List<ApiModelsCompanion> models,
  ) async {
    return transaction(() async {
      final results = <ApiModelsTable>[];
      for (final model in models) {
        try {
          final inserted = await insertModel(model);
          results.add(inserted);
        } on Exception catch (e) {
          // Continue with other models if one fails
          _log.severe('Failed to insert model ${model.id.value}: $e');
        }
      }
      return results;
    });
  }

  /// Batch upserts multiple models into the database.
  ///
  /// For each model, it will update if it exists or insert if it doesn't.
  /// Returns the list of inserted/updated models.
  Future<List<ApiModelsTable>> batchUpsertModels(
    List<ApiModelsCompanion> models,
  ) async {
    return transaction(() async {
      return [for (final model in models) await upsertModel(model)];
    });
  }

  /// Deletes all models from the database.
  ///
  /// Returns the number of deleted models.
  Future<int> deleteAllModels() async {
    return delete(apiModels).go();
  }

  /// Retrieves models within a cost range.
  ///
  /// Returns a list of models with input cost between [minInputCost] and
  /// [maxInputCost].
  Future<List<ApiModelsTable>> getModelsByCostRange(
    double minInputCost,
    double maxInputCost,
  ) {
    return (select(apiModels)
          ..where(
            (t) => t.costInput.isBetweenValues(minInputCost, maxInputCost),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.costInput),
            (t) => OrderingTerm(expression: t.name),
          ]))
        .get();
  }

  /// Retrieves models with minimum context limit.
  ///
  /// Returns a list of models with context limit >= [minContextLimit].
  Future<List<ApiModelsTable>> getModelsByMinContextLimit(int minContextLimit) {
    return (select(apiModels)
          ..where((t) => t.limitContext.isBiggerOrEqualValue(minContextLimit))
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.limitContext,
              mode: OrderingMode.desc,
            ),
            (t) => OrderingTerm(expression: t.name),
          ]))
        .get();
  }

  /// Retrieves open weights models.
  ///
  /// Returns a list of models that are open source.
  Future<List<ApiModelsTable>> getOpenWeightsModels() {
    return (select(apiModels)
          ..where((t) => t.openWeights.equals(true))
          ..orderBy([
            (t) => OrderingTerm(expression: t.modelProvider),
            (t) => OrderingTerm(expression: t.name),
          ]))
        .get();
  }

  /// Gets models sorted by cost efficiency.
  ///
  /// Returns models sorted by input cost in ascending order (cheapest first).
  Future<List<ApiModelsTable>> getModelsByCostEfficiency() {
    return (select(apiModels)..orderBy([
          (t) => OrderingTerm(expression: t.costInput),
          (t) => OrderingTerm(expression: t.costOutput),
          (t) => OrderingTerm(expression: t.name),
        ]))
        .get();
  }
}
