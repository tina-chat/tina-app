import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/features/models/providers/model_providers_repository_providers.dart';
import 'package:tina_app/features/workspaces/providers/workspace_repository_providers.dart';

part 'list_chat_models_providers.g.dart';

@riverpod
Future<List<ChatModelWithProviderEntity>> listChatModelProviders(
  Ref ref,
) async {
  final chatModelRepository = ref.watch(chatModelsRepositoryProvider);
  final workspaceRepository = ref.watch(workspaceRepositoryProvider);

  final workspaces = await workspaceRepository.getAllWorkspaces();

  return chatModelRepository.getChatModels(
    ChatModelsFilter(workspaces: workspaces.map((w) => w.id).toList()),
  );
}
