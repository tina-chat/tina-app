import 'package:drift/drift.dart';

import '../../domain/entities/workspace.dart';
import '../../domain/enums/workspace_type.dart';
import '../../domain/repositories/workspace_repository.dart';
import '../database/drift/app_database.dart';

/// Implementation of the [WorkspaceRepository] interface.
///
/// This class provides a concrete implementation of workspace data operations
/// using the Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class WorkspaceRepositoryImpl implements WorkspaceRepository {
  /// The database instance for workspace operations.
  final AppDatabase _database;

  /// Creates a new [WorkspaceRepositoryImpl] instance.
  ///
  /// [database] The database instance for workspace operations.
  WorkspaceRepositoryImpl(this._database);

  @override
  Future<List<WorkspaceEntity>> getAllWorkspaces() async {
    try {
      final workspaceTables = await _database.workspaceDao.getAllWorkspaces();
      return workspaceTables.map(_mapToWorkspace).toList();
    } catch (e) {
      throw WorkspaceException(
        'Failed to retrieve all workspaces',
        e as Exception,
      );
    }
  }

  @override
  Future<WorkspaceEntity?> getWorkspaceById(String id) async {
    try {
      final workspacesTable = await _database.workspaceDao.getWorkspaceById(id);
      return workspacesTable != null ? _mapToWorkspace(workspacesTable) : null;
    } catch (e) {
      throw WorkspaceException(
        'Failed to retrieve workspace with ID $id',
        e as Exception,
      );
    }
  }

  @override
  Future<List<WorkspaceEntity>> getWorkspacesByType(WorkspaceType type) async {
    try {
      final workspaceTables = await _database.workspaceDao.getWorkspacesByType(
        type,
      );
      return workspaceTables.map(_mapToWorkspace).toList();
    } catch (e) {
      throw WorkspaceException(
        'Failed to retrieve workspaces of type $type',
        e as Exception,
      );
    }
  }

  @override
  Future<WorkspaceEntity> createWorkspace(WorkspaceToCreate workspace) async {
    try {
      // Validate workspace before creating
      if (!await validateWorkspace(workspace)) {
        throw const WorkspaceValidationException('Invalid workspace data');
      }

      final workspaceCompanion = _mapToWorkspacesCompanion(workspace);
      final createdWorkspace = await _database.workspaceDao.insertWorkspace(
        workspaceCompanion,
      );

      return _mapToWorkspace(createdWorkspace);
    } catch (e) {
      if (e is WorkspaceException) rethrow;
      throw WorkspaceException('Failed to create workspace', e as Exception);
    }
  }

  @override
  Future<WorkspaceEntity> updateWorkspace(
    String id,
    WorkspaceToCreate workspace,
  ) async {
    try {
      // Validate workspace before updating
      if (!await validateWorkspace(workspace)) {
        throw const WorkspaceValidationException('Invalid workspace data');
      }

      // Check if workspace exists
      if (!await workspaceExists(id)) {
        throw WorkspaceNotFoundException(id);
      }

      final workspaceCompanion = _mapToWorkspacesCompanion(
        workspace,
        forUpdate: true,
      );
      final updated = await _database.workspaceDao.updateWorkspace(
        id,
        workspaceCompanion,
      );

      if (!updated) {
        throw WorkspaceException('Failed to update workspace with ID $id');
      }

      final updatedWorkspace = await _database.workspaceDao.getWorkspaceById(
        id,
      );

      if (updatedWorkspace == null) {
        throw WorkspaceException(
          'Failed to retrieve updated workspace with ID $id',
        );
      }

      return _mapToWorkspace(updatedWorkspace);
    } catch (e) {
      if (e is WorkspaceException) rethrow;
      throw WorkspaceException('Failed to update workspace', e as Exception);
    }
  }

  @override
  Future<bool> deleteWorkspace(String id) async {
    try {
      // Check if workspace exists
      if (!await workspaceExists(id)) {
        return false; // Return false instead of throwing for delete operations
      }

      final deleted = await _database.workspaceDao.deleteWorkspace(id);
      return deleted;
    } catch (e) {
      throw WorkspaceException('Failed to delete workspace', e as Exception);
    }
  }

  @override
  Future<bool> workspaceExists(String id) async {
    try {
      return await _database.workspaceDao.workspaceExists(id);
    } catch (e) {
      throw WorkspaceException(
        'Failed to check workspace existence',
        e as Exception,
      );
    }
  }

  @override
  Future<List<WorkspaceEntity>> searchWorkspacesByName(String query) async {
    try {
      final workspaceTables = await _database.workspaceDao
          .searchWorkspacesByName(query);
      return workspaceTables.map(_mapToWorkspace).toList();
    } catch (e) {
      throw WorkspaceException('Failed to search workspaces', e as Exception);
    }
  }

  @override
  Future<int> getWorkspaceCount() async {
    try {
      return await _database.workspaceDao.getWorkspaceCount();
    } catch (e) {
      throw WorkspaceException('Failed to get workspace count', e as Exception);
    }
  }

  @override
  Future<int> getWorkspaceCountByType(WorkspaceType type) async {
    try {
      return await _database.workspaceDao.getWorkspaceCountByType(type);
    } catch (e) {
      throw WorkspaceException(
        'Failed to get workspace count by type',
        e as Exception,
      );
    }
  }

  @override
  Future<bool> validateWorkspace(WorkspaceToCreate workspace) async {
    try {
      if (!workspace.isValid) {
        throw WorkspaceValidationException(
          _getValidationErrorToCreate(workspace),
        );
      }
      return true;
    } catch (e) {
      if (e is WorkspaceValidationException) rethrow;
      throw WorkspaceValidationException(
        'Workspace validation failed',
        e as Exception,
      );
    }
  }

  @override
  Future<bool> updateWorkspaceTimestamp(String id) async {
    try {
      // Check if workspace exists
      if (!await workspaceExists(id)) {
        return false; // Return false instead of throwing for update operations
      }

      final updated = await _database.workspaceDao.updateWorkspaceTimestamp(id);
      return updated;
    } catch (e) {
      throw WorkspaceException(
        'Failed to update workspace timestamp',
        e as Exception,
      );
    }
  }

  /// Maps a [workspacesTable] database record to a [WorkspaceEntity] domain entity.
  ///
  /// [workspacesTable] The database record to map.
  /// Returns the corresponding [WorkspaceEntity] entity.
  WorkspaceEntity _mapToWorkspace(WorkspacesTable workspacesTable) {
    return WorkspaceEntity(
      id: workspacesTable.id,
      name: workspacesTable.name,
      type: workspacesTable.type,
      url: workspacesTable.url,
      createdAt: workspacesTable.createdAt,
      updatedAt: workspacesTable.updatedAt,
    );
  }

  /// Maps a [WorkspaceEntity] domain entity to a [WorkspacesCompanion] for database operations.
  ///
  /// [workspace] The workspace entity to map.
  /// [forUpdate] Whether this mapping is for an update operation.
  /// Returns the corresponding [WorkspacesCompanion].
  WorkspacesCompanion _mapToWorkspacesCompanion(
    WorkspaceToCreate workspace, {
    bool forUpdate = false,
  }) {
    return WorkspacesCompanion(
      name: Value(workspace.name),
      type: Value(workspace.type),
      url: Value(workspace.url),
    );
  }

  /// Gets validation error message for a workspace.
  ///
  /// [workspace] The workspace to validate.
  /// Returns a string describing the validation error.
  String _getValidationErrorToCreate(WorkspaceToCreate workspace) {
    if (workspace.name.isEmpty) return 'Workspace name cannot be empty';
    if (workspace.type == WorkspaceType.local && workspace.url != null) {
      return 'Local workspace cannot have a URL';
    }
    if (workspace.type == WorkspaceType.remote &&
        (workspace.url == null || workspace.url!.isEmpty)) {
      return 'Remote workspace must have a URL';
    }
    return 'Unknown validation error';
  }
}
