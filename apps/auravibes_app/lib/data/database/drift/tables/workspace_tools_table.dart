import 'package:auravibes_app/data/database/drift/tables/common.dart';
import 'package:auravibes_app/data/database/drift/tables/workspaces_table.dart';
import 'package:drift/drift.dart';

@DataClassName('WorkspaceToolsTable')
class WorkspaceTools extends Table with TableMixin {
  /// Reference to the workspace this tool setting belongs to
  TextColumn get workspaceId => text().references(Workspaces, #id)();

  /// Type of tool (e.g., 'web_search', 'calculator', etc.)
  TextColumn get type => text()();

  /// Tool configuration as JSON (optional)
  TextColumn get config => text().nullable()();

  /// Whether the tool is enabled for this workspace
  BoolColumn get isEnabled => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {workspaceId, type};
}
