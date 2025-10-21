import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tina_app/data/database/drift/daos/chat_models_dao.dart';
import 'package:tina_app/data/database/drift/tables/chat_models_table.dart';
import 'tables/workspaces_table.dart';
import 'daos/workspace_dao.dart';
import '../../../domain/enums/workspace_type.dart';
import '../../../domain/enums/chat_models_type.dart';

part 'app_database.g.dart';

/// Main application database using Drift.
///
/// This database manages all local data storage for the Tina application,
/// including workspaces and other application data.
@DriftDatabase(
  tables: [Workspaces, ChatModels],
  daos: [WorkspaceDao, ChatModelsDao],
)
class AppDatabase extends _$AppDatabase {
  /// Creates a new [AppDatabase] instance.
  ///
  /// If [connection] is provided, uses that connection.
  /// Otherwise, creates a default SQLite database connection.
  AppDatabase({QueryExecutor? connection})
    : super(connection ?? _openConnection());

  /// Database schema version.
  @override
  int get schemaVersion => 1;

  /// Migration logic for database schema upgrades.
  ///
  /// This method handles database migrations when the schema version changes.
  /// Currently, we're at version 1, so no migrations are needed yet.
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle future migrations here
        // Example:
        // if (from <= 1 && to >= 2) {
        //   await m.addColumn(workspaces, newColumn);
        // }
      },
    );
  }

  /// Creates a database connection using drift_flutter.
  ///
  /// This method sets up a cross-platform SQLite database connection
  /// with proper configuration for mobile and desktop platforms.
  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File('${dbFolder.path}/tina_app.db');
      return NativeDatabase(file);
    });
  }

  /// Creates a database connection for testing.
  ///
  /// This method creates an in-memory database suitable for unit tests.
  /// The database is isolated and doesn't persist data between test runs.
  static QueryExecutor createTestConnection() {
    return DatabaseConnection.delayed(
      Future(() {
        return DatabaseConnection(
          LazyDatabase(() async {
            // Use an in-memory database for testing
            return NativeDatabase.memory();
          }),
        );
      }),
    );
  }

  /// Initializes the database with default data.
  ///
  /// This method can be called to populate the database with
  /// initial data when the app first starts.
  Future<void> initializeWithDefaults() async {
    // Check if workspaces table is empty
    final workspaceCount = await customSelect(
      'SELECT COUNT(*) as count FROM workspaces',
    ).getSingle().then((result) => result.read<int>('count'));

    if (workspaceCount == 0) {
      await into(workspaces).insert(
        WorkspacesCompanion.insert(
          name: 'Default Workspace',
          type: WorkspaceType.local,
        ),
      );
    }
  }

  /// Performs database maintenance operations.
  ///
  /// This method can be called periodically to optimize the database,
  /// clean up old data, and perform other maintenance tasks.
  Future<void> performMaintenance() async {
    // Example maintenance tasks:
    // - Vacuum the database to reclaim space
    // - Update statistics
    // - Clean up orphaned records

    await customStatement('VACUUM');
    await customStatement('ANALYZE');
  }

  /// Gets database statistics for monitoring.
  ///
  /// Returns information about the database size, row counts, etc.
  Future<Map<String, dynamic>> getDatabaseStats() async {
    final stats = <String, dynamic>{};

    // Get workspace count
    final workspaceCount = await customSelect(
      'SELECT COUNT(*) as count FROM workspaces',
    ).getSingle().then((result) => result.read<int>('count'));
    stats['workspaceCount'] = workspaceCount;

    // Get database page count (approximate size)
    final pageCount = await customSelect(
      'SELECT page_count FROM pragma_page_count()',
    ).getSingle().then((result) => result.read<int>('page_count'));
    stats['pageCount'] = pageCount;

    // Get page size
    final pageSize = await customSelect(
      'SELECT page_size FROM pragma_page_size()',
    ).getSingle().then((result) => result.read<int>('page_size'));
    stats['pageSize'] = pageSize;

    // Calculate approximate database size
    stats['approximateSizeBytes'] = pageCount * pageSize;

    return stats;
  }
}
