import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/common.dart';
import '../../../../domain/enums/workspace_type.dart';

/// Table definition for workspaces in the database.
@DataClassName('WorkspaceTable')
class Workspaces extends Table with TableMixin {
  /// Human-readable name of the workspace
  TextColumn get name => text()();

  /// Type of workspace (local or remote)
  /// Stored as string to handle enum conversion
  TextColumn get type => textEnum<WorkspaceType>()();

  /// URL for remote workspaces, null for local workspaces
  TextColumn get url => text().nullable()();
}
