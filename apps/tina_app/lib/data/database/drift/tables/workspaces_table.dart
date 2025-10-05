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
  TextColumn get type => text()();

  /// URL for remote workspaces, null for local workspaces
  TextColumn get url => text().nullable()();

  /// Convert WorkspaceType enum to string for storage
  static String workspaceTypeToString(WorkspaceType type) {
    return type.value;
  }

  /// Convert string from storage to WorkspaceType enum
  static WorkspaceType stringToWorkspaceType(String value) {
    return WorkspaceType.fromString(value);
  }
}
