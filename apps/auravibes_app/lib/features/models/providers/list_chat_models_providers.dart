import 'package:auravibes_app/domain/entities/credentials_models_entities.dart';
import 'package:auravibes_app/features/models/providers/model_providers_repository_providers.dart';
import 'package:auravibes_app/features/workspaces/providers/workspace_repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_chat_models_providers.g.dart';

@riverpod
Future<List<CredentialsModelWithProviderEntity>> listCredentialsCredentials(
  Ref ref,
) async {
  final credentialsModelRepository = ref.watch(
    credentialsModelsRepositoryProvider,
  );
  final workspaceRepository = ref.watch(workspaceRepositoryProvider);

  final workspaces = await workspaceRepository.getAllWorkspaces();

  return credentialsModelRepository.getCredentialsModels(
    CredentialsModelsFilter(workspaces: workspaces.map((w) => w.id).toList()),
  );
}
