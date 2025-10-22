import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/model_providers_entities.dart';
import 'package:tina_app/features/models/providers/model_providers_repository_providers.dart';
import 'package:tina_app/features/workspaces/providers/workspace_repository_providers.dart';

part 'list_models_providers.g.dart';

@riverpod
Future<List<ModelProviderEntity>> listModelProviders(Ref ref) async {
  final chatModelRepository = ref.watch(modelProvidersRepositoryProvider);
  final workspaceRepository = ref.watch(workspaceRepositoryProvider);

  final workspaces = await workspaceRepository.getAllWorkspaces();

  return chatModelRepository.getModelProviders(
    ModelProviderFilter(workspaces: workspaces.map((w) => w.id).toList()),
  );
}
