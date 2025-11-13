import 'package:auravibes_app/domain/entities/workspace.dart';
import 'package:auravibes_app/features/workspaces/providers/workspace_repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_workspace.g.dart';

@riverpod
class SelectedWorkspace extends _$SelectedWorkspace {
  @override
  Future<WorkspaceEntity> build() async {
    final workspaceRepository = ref.read(workspaceRepositoryProvider);
    final workspace = await workspaceRepository.getAllWorkspaces();
    return workspace.first;
  }
}
