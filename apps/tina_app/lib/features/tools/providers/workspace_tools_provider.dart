import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/data/repositories/workspace_tools_repository_impl.dart';
import 'package:tina_app/domain/entities/workspace_tool.dart';
import 'package:tina_app/domain/repositories/workspace_tools_repository.dart';
import 'package:tina_app/features/workspaces/providers/selected_workspace.dart';
import 'package:tina_app/providers/app_providers.dart';
import 'package:tina_app/services/tools/tool_service.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';

part 'workspace_tools_provider.g.dart';

typedef WorkspaceTool = (UserToolType, WorkspaceToolEntity?);

@riverpod
WorkspaceToolsRepository workspaceToolsRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  return WorkspaceToolsRepositoryImpl(appDatabase);
}

@Riverpod(dependencies: [])
int workspaceToolIndexNotifier(Ref ref) =>
    throw Exception('implement workspaceToolIndexNotifier');

@riverpod
class WorkspaceToolsNotifier extends _$WorkspaceToolsNotifier {
  late WorkspaceToolsRepository _repository;
  late String _workspaceId;

  @override
  Future<List<WorkspaceTool>> build() async {
    _repository = ref.watch(workspaceToolsRepositoryProvider);
    _workspaceId = await ref.watch(
      selectedWorkspaceProvider.selectAsync((w) => w.id),
    );

    final workspaceTools = await _repository.getWorkspaceTools(_workspaceId);

    return ToolService.getTypes().map((toolType) {
      final workspaceTool = workspaceTools.firstWhereOrNull(
        (wt) => wt.type == toolType,
      );
      return (toolType, workspaceTool);
    }).toList();
  }

  void _replaceTools(List<WorkspaceToolEntity> workspaceTools) {
    if (state case AsyncData(:final value)) {
      state = AsyncData(
        value.map((wt) {
          final workspaceTool = workspaceTools.firstWhereOrNull(
            (element) => element.type == wt.$1.value,
          );
          if (workspaceTool != null) {
            return (wt.$1, workspaceTool);
          }
          return wt;
        }).toList(),
      );
    }
  }

  void _removeTools(List<UserToolType> toolTypes) {
    if (state case AsyncData(:final value)) {
      state = AsyncData(
        value.map((wt) {
          if (toolTypes.contains(wt.$1)) {
            return (wt.$1, null);
          }
          return wt;
        }).toList(),
      );
    }
  }

  /// Enable or disable a workspace tool
  Future<bool> setToolEnabled(String toolType, bool isEnabled) async {
    try {
      final newTool = await _repository.setWorkspaceToolEnabled(
        _workspaceId,
        toolType,
        isEnabled,
      );
      _replaceTools([newTool]);
      return true;
    } catch (e) {
      print('Failed to set workspace tool $toolType enabled: $e');
      return false;
    }
  }

  /// Update workspace tool configuration
  Future<void> updateToolConfig(String toolType, String? config) async {
    final success = await _repository.updateWorkspaceToolConfig(
      _workspaceId,
      toolType,
      config,
    );
    _replaceTools(success);
  }

  /// Remove a workspace tool
  Future<bool> removeTool(UserToolType toolType) async {
    try {
      final success = await _repository.removeWorkspaceTool(
        _workspaceId,
        toolType.value,
      );
      _removeTools([toolType]);
      return success;
    } catch (e) {
      print('Failed to remove workspace tool $toolType: $e');
      return false;
    }
  }
}

@Riverpod(dependencies: [workspaceToolIndexNotifier])
WorkspaceTool? workspaceToolRow(Ref ref) {
  final workspaceToolIndex = ref.watch(workspaceToolIndexProvider);
  return ref.watch(
    workspaceToolsProvider.select((e) => e.value?[workspaceToolIndex]),
  );
}
