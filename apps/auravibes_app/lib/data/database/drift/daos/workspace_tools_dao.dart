import 'package:auravibes_app/data/database/drift/app_database.dart';
import 'package:auravibes_app/data/database/drift/tables/workspace_tools_table.dart';
import 'package:drift/drift.dart';

part 'workspace_tools_dao.g.dart';

@DriftAccessor(tables: [WorkspaceTools])
class WorkspaceToolsDao extends DatabaseAccessor<AppDatabase>
    with _$WorkspaceToolsDaoMixin {
  WorkspaceToolsDao(super.db);

  // Core operations
  Future<WorkspaceToolsTable?> getWorkspaceTool(
    String workspaceId,
    String toolType,
  ) =>
      (select(workspaceTools)..where(
            (tbl) =>
                tbl.workspaceId.equals(workspaceId) & tbl.type.equals(toolType),
          ))
          .getSingleOrNull();

  Future<WorkspaceToolsTable> setWorkspaceToolEnabled(
    String workspaceId,
    String toolType,
    bool isEnabled,
  ) {
    return into(workspaceTools).insertReturning(
      WorkspaceToolsCompanion(
        workspaceId: Value(workspaceId),
        type: Value(toolType),
        isEnabled: Value(isEnabled),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<bool> toggleWorkspaceTool(String workspaceId, String toolType) {
    return customUpdate(
      "UPDATE workspace_tools SET is_enabled = NOT is_enabled, updated_at = datetime('now') "
      'WHERE workspace_id = ? AND type = ?',
      variables: [
        Variable.withString(workspaceId),
        Variable.withString(toolType),
      ],
    ).then((count) => count > 0);
  }

  Future<List<WorkspaceToolsTable>> updateWorkspaceToolConfig(
    String workspaceId,
    String toolType,
    String? config,
  ) {
    return update(workspaceTools).writeReturning(
      WorkspaceToolsCompanion(
        workspaceId: Value(workspaceId),
        type: Value(toolType),
        config: Value(config),
      ),
    );
  }

  Future<bool> deleteWorkspaceTool(String workspaceId, String toolType) =>
      (delete(workspaceTools)..where(
            (tbl) =>
                tbl.workspaceId.equals(workspaceId) & tbl.type.equals(toolType),
          ))
          .go()
          .then((count) => count > 0);

  // Query operations
  Future<List<WorkspaceToolsTable>> getWorkspaceTools(String workspaceId) =>
      (select(workspaceTools)
            ..where((tbl) => tbl.workspaceId.equals(workspaceId))
            ..orderBy([
              (tbl) => OrderingTerm(expression: tbl.type),
            ]))
          .get();

  Future<List<WorkspaceToolsTable>> getEnabledWorkspaceTools(
    String workspaceId,
  ) =>
      (select(workspaceTools)
            ..where(
              (tbl) =>
                  tbl.workspaceId.equals(workspaceId) &
                  tbl.isEnabled.equals(true),
            )
            ..orderBy([
              (tbl) => OrderingTerm(expression: tbl.type),
            ]))
          .get();

  Future<bool> isWorkspaceToolEnabled(String workspaceId, String toolType) =>
      (selectOnly(workspaceTools)
            ..addColumns([workspaceTools.id.count()])
            ..where(
              workspaceTools.workspaceId.equals(workspaceId) &
                  workspaceTools.type.equals(toolType) &
                  workspaceTools.isEnabled.equals(true),
            ))
          .map((row) => row.read(workspaceTools.id.count()) ?? 0)
          .getSingle()
          .then((result) => result > 0);

  Future<String?> getWorkspaceToolConfig(String workspaceId, String toolType) =>
      (selectOnly(workspaceTools)
            ..addColumns([workspaceTools.config])
            ..where(
              workspaceTools.workspaceId.equals(workspaceId) &
                  workspaceTools.type.equals(toolType),
            ))
          .map((row) => row.read(workspaceTools.config))
          .getSingleOrNull();

  Future<int> getWorkspaceToolsCount(String workspaceId) =>
      (selectOnly(workspaceTools)
            ..addColumns([workspaceTools.id.count()])
            ..where(workspaceTools.workspaceId.equals(workspaceId)))
          .map((row) => row.read(workspaceTools.id.count()) ?? 0)
          .getSingle();

  Future<int> getEnabledWorkspaceToolsCount(String workspaceId) =>
      (selectOnly(workspaceTools)
            ..addColumns([workspaceTools.id.count()])
            ..where(
              workspaceTools.workspaceId.equals(workspaceId) &
                  workspaceTools.isEnabled.equals(true),
            ))
          .map((row) => row.read(workspaceTools.id.count()) ?? 0)
          .getSingle();
}
