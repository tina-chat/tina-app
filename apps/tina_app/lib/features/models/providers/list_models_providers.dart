import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/chat_model_model.dart';
import 'package:tina_app/features/models/providers/chat_models_repository_providers.dart';
import 'package:tina_app/features/workspaces/providers/workspace_repository_providers.dart';

part 'list_models_providers.g.dart';

@riverpod
Future<List<ChatModelEntity>> listModels(Ref ref) async {
  final chatModelRepository = ref.watch(chatModelRepositoryProvider);
  final workspaceRepository = ref.watch(workspaceRepositoryProvider);

  final workspaces = await workspaceRepository.getAllWorkspaces();

  return chatModelRepository.getChatModels(
    ChatModelFilter(workspaces: workspaces.map((w) => w.id).toList()),
  );
}
