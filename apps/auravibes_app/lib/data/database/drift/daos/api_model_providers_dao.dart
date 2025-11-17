import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/tables/api_model_provider_table.dart';
import 'package:drift/drift.dart';

part 'api_model_providers_dao.g.dart';

/// Data Access Object for API model providers operations.
@DriftAccessor(tables: [ApiModelProviders])
class ApiModelProvidersDao extends DatabaseAccessor<AppDatabase>
    with _$ApiModelProvidersDaoMixin {
  /// Creates a new [ApiModelProvidersDao] instance.
  ApiModelProvidersDao(super.attachedDatabase);

  /// Retrieves all API model providers from the database.
  ///
  /// Returns a list of all providers ordered by their name.
  Future<List<ApiModelProvidersTable>> getAllProviders() {
    return (select(
      apiModelProviders,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
  }

  /// Retrieves a provider by its ID.
  ///
  /// Returns the provider with the given [id], or null if not found.
  Future<ApiModelProvidersTable?> getProviderById(String id) {
    return (select(
      apiModelProviders,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Retrieves providers by their type.
  ///
  /// Returns a list of providers with the specified [type].
  Future<List<ApiModelProvidersTable>> getProvidersByType(String type) {
    return (select(apiModelProviders)
          ..where((t) => t.type.equals(type))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
  }

  /// Inserts a new provider into the database.
  ///
  /// Returns the inserted provider.
  Future<ApiModelProvidersTable> insertProvider(
    ApiModelProvidersCompanion provider,
  ) {
    return into(apiModelProviders).insertReturning(provider);
  }

  /// Updates an existing provider in the database.
  ///
  /// Updates the provider with the given [id] using the provided [provider]
  /// data.
  /// Returns true if a provider was updated, false otherwise.
  Future<bool> updateProvider(
    String id,
    ApiModelProvidersCompanion provider,
  ) async {
    final updateCount = await (update(
      apiModelProviders,
    )..where((t) => t.id.equals(id))).write(provider);
    return updateCount > 0;
  }

  /// Deletes a provider from the database.
  ///
  /// Deletes the provider with the given [id].
  /// Returns true if a provider was deleted, false otherwise.
  Future<bool> deleteProvider(String id) async {
    final deleteCount = await (delete(
      apiModelProviders,
    )..where((t) => t.id.equals(id))).go();
    return deleteCount > 0;
  }

  /// Checks if a provider with the given [id] exists.
  ///
  /// Returns true if the provider exists, false otherwise.
  Future<bool> providerExists(String id) async {
    final count =
        await (selectOnly(apiModelProviders)
              ..addColumns([apiModelProviders.id])
              ..where(apiModelProviders.id.equals(id)))
            .get()
            .then((rows) => rows.length);
    return count > 0;
  }

  /// Searches for providers by name.
  ///
  /// Returns a list of providers whose names contain the [query] string.
  /// The search is case-insensitive.
  Future<List<ApiModelProvidersTable>> searchProvidersByName(String query) {
    return (select(apiModelProviders)
          ..where((t) => t.name.contains(query))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
  }

  /// Gets the count of all providers.
  ///
  /// Returns the total number of providers in the database.
  Future<int> getProviderCount() {
    return (selectOnly(
      apiModelProviders,
    )..addColumns([apiModelProviders.id])).get().then((rows) => rows.length);
  }

  /// Inserts or updates a provider based on the ID.
  ///
  /// If a provider with the given ID exists, it will be updated.
  /// Otherwise, a new provider will be inserted.
  /// Returns the inserted/updated provider.
  Future<ApiModelProvidersTable> upsertProvider(
    ApiModelProvidersCompanion provider,
  ) async {
    final existingProvider = await getProviderById(provider.id.value);

    if (existingProvider != null) {
      await updateProvider(provider.id.value, provider);
      return (await getProviderById(provider.id.value))!;
    } else {
      return insertProvider(provider);
    }
  }

  /// Batch inserts multiple providers into the database.
  ///
  /// Returns the list of inserted providers.
  Future<List<ApiModelProvidersTable>> batchInsertProviders(
    List<ApiModelProvidersCompanion> providers,
  ) async {
    return transaction(() async {
      return [for (final provider in providers) await insertProvider(provider)];
    });
  }

  /// Deletes all providers from the database.
  ///
  /// Returns the number of deleted providers.
  Future<int> deleteAllProviders() async {
    return delete(apiModelProviders).go();
  }
}
