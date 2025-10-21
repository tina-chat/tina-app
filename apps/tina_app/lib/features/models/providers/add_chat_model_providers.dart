import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/chat_model_model.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';
import 'package:tina_app/features/models/models/add_chat_model_model.dart';
import 'package:tina_app/features/models/providers/chat_models_repository_providers.dart';
import 'package:tina_app/features/workspaces/providers/workspace_repository_providers.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/experimental/mutation.dart';

part 'add_chat_model_providers.g.dart';

@riverpod
class AddChatModelState extends _$AddChatModelState {
  @override
  AddChatModelModel build() {
    return AddChatModelModel();
  }

  void setName(String newName) {
    state = state.copyWith(name: newName);
  }

  void setKey(String newKey) {
    state = state.copyWith(key: newKey);
  }

  void setType(ChatModelType? newValue) {
    state = state.copyWith(type: newValue);
  }

  Future<ChatModelEntity?> createChatModel() async {
    final repo = ref.read(chatModelRepositoryProvider);
    final wRepo = ref.read(workspaceRepositoryProvider);

    final name = state.name;
    final typeModel = state.type;
    final key = state.key;
    final url = state.url;

    if (name == null || typeModel == null || key == null) {
      return null;
    }
    final workspaces = await wRepo.getAllWorkspaces();
    final firstWorkspace = workspaces.firstOrNull;
    if (firstWorkspace == null) {
      return null;
    }

    return await repo.createChatModel(
      ChatModelToCreate(
        name: name,
        type: typeModel,
        key: key,
        url: url,
        workspaceId: firstWorkspace.id,
      ),
    );
    // ref.read(listenable)
  }
}

final addChatModelMutation = Mutation<void>();
