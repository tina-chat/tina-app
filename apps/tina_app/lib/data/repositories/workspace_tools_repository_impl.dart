import 'package:tina_app/data/database/drift/app_database.dart';
import 'package:tina_app/data/database/drift/daos/workspace_tools_dao.dart';
import 'package:tina_app/domain/entities/workspace_tool.dart';
import 'package:tina_app/domain/repositories/workspace_tools_repository.dart';
import 'package:tina_app/services/tools/tool_service.dart';

/// Implementation of the WorkspaceToolsRepository
class WorkspaceToolsRepositoryImpl implements WorkspaceToolsRepository {
  final AppDatabase _database;
  late WorkspaceToolsDao _dao;

  WorkspaceToolsRepositoryImpl(this._database) {
    _dao = _database.workspaceToolsDao;
  }

  @override
  Future<List<WorkspaceToolEntity>> getWorkspaceTools(
    String workspaceId,
  ) async {
    final results = await _dao.getWorkspaceTools(workspaceId);
    return results
        .map(
          (table) => WorkspaceToolEntity(
            workspaceId: table.workspaceId,
            type: table.type,
            config: table.config,
            isEnabled: table.isEnabled,
            createdAt: table.createdAt,
            updatedAt: table.updatedAt,
          ),
        )
        .toList();
  }

  @override
  Future<List<WorkspaceToolEntity>> getEnabledWorkspaceTools(
    String workspaceId,
  ) async {
    final results = await _dao.getEnabledWorkspaceTools(workspaceId);
    return results
        .map(
          (table) => WorkspaceToolEntity(
            workspaceId: table.workspaceId,
            type: table.type,
            config: table.config,
            isEnabled: table.isEnabled,
            createdAt: table.createdAt,
            updatedAt: table.updatedAt,
          ),
        )
        .toList();
  }

  @override
  Future<WorkspaceToolEntity?> getWorkspaceTool(
    String workspaceId,
    String toolType,
  ) async {
    final result = await _dao.getWorkspaceTool(workspaceId, toolType);
    if (result == null) return null;

    return WorkspaceToolEntity(
      workspaceId: result.workspaceId,
      type: result.type,
      config: result.config,
      isEnabled: result.isEnabled,
      createdAt: result.createdAt,
      updatedAt: result.updatedAt,
    );
  }

  @override
  Future<bool> setWorkspaceToolEnabled(
    String workspaceId,
    String toolType,
    bool isEnabled,
  ) async {
    try {
      return await _dao.setWorkspaceToolEnabled(
        workspaceId,
        toolType,
        isEnabled,
      );
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to set workspace tool enabled: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<bool> toggleWorkspaceTool(String workspaceId, String toolType) async {
    try {
      final tool = await getWorkspaceTool(workspaceId, toolType);
      final newStatus =
          tool?.isEnabled ?? ToolService.isToolEnabledByDefault(toolType);
      return await _dao.setWorkspaceToolEnabled(
        workspaceId,
        toolType,
        !newStatus,
      );
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to toggle workspace tool: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<bool> isWorkspaceToolEnabled(
    String workspaceId,
    String toolType,
  ) async {
    try {
      final result = await _dao.getWorkspaceTool(workspaceId, toolType);
      if (result == null) {
        return ToolService.isToolEnabledByDefault(toolType);
      }
      return result.isEnabled;
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to check workspace tool status: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<bool> removeWorkspaceTool(String workspaceId, String toolType) async {
    try {
      return await _dao.deleteWorkspaceTool(workspaceId, toolType);
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to remove workspace tool: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<int> getWorkspaceToolsCount(String workspaceId) async {
    try {
      return await _dao.getWorkspaceToolsCount(workspaceId);
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to count workspace tools: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<int> getEnabledWorkspaceToolsCount(String workspaceId) async {
    try {
      return await _dao.getEnabledWorkspaceToolsCount(workspaceId);
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to count enabled workspace tools: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<void> copyWorkspaceToolsToConversation(
    String workspaceId,
    String conversationId,
  ) async {
    try {
      // This method is no longer needed since we use disabled tools approach
      // Copying workspace tools to conversation is handled by the conversation tools repository
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to copy workspace tools to conversation: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<bool> validateWorkspaceToolSetting(
    String workspaceId,
    String toolType,
    bool isEnabled,
    String? config,
  ) async {
    try {
      // Check if workspace exists
      final workspace = await _database.workspaceDao.getWorkspaceById(
        workspaceId,
      );
      if (workspace == null) {
        throw WorkspaceToolsValidationException(
          'Workspace not found: $workspaceId',
        );
      }

      // Check if tool type is valid
      final availableTools = ToolService.getAvailableToolTypes();
      if (!availableTools.contains(toolType)) {
        throw WorkspaceToolsValidationException('Invalid tool type: $toolType');
      }

      // Validate config if provided
      if (config != null && config.isNotEmpty) {
        try {
          // Basic JSON validation - can be extended based on tool type requirements
          // This is a simple check, you might want to add more sophisticated validation
          if (config.trim().startsWith('{') && config.trim().endsWith('}')) {
            // It looks like JSON, could parse it if needed
          }
        } catch (e) {
          throw WorkspaceToolsValidationException(
            'Invalid config format: $config',
          );
        }
      }

      return true;
    } catch (e) {
      if (e is WorkspaceToolsValidationException) rethrow;
      throw WorkspaceToolsException(
        'Failed to validate workspace tool setting: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<String?> getWorkspaceToolConfig(
    String workspaceId,
    String toolType,
  ) async {
    try {
      final result = await _dao.getWorkspaceTool(workspaceId, toolType);
      return result?.config;
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to get workspace tool config: $e',
        e is Exception ? e : null,
      );
    }
  }

  @override
  Future<bool> updateWorkspaceToolConfig(
    String workspaceId,
    String toolType,
    String? config,
  ) async {
    try {
      return await _dao.updateWorkspaceToolConfig(
        workspaceId,
        toolType,
        config,
      );
    } catch (e) {
      throw WorkspaceToolsException(
        'Failed to update workspace tool config: $e',
        e is Exception ? e : null,
      );
    }
  }
}
