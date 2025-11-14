import 'package:auravibes_app/domain/entities/model_providers_entities.dart';
import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:auravibes_app/features/models/models/add_model_provider_model.dart';
import 'package:auravibes_app/features/models/providers/model_providers_repository_providers.dart';
import 'package:auravibes_app/features/workspaces/providers/workspace_repository_providers.dart';
import 'package:riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_model_provider_providers.g.dart';

@riverpod
class AddModelProviderState extends _$AddModelProviderState {
  @override
  AddModelProviderModel build() {
    return const AddModelProviderModel();
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

  Future<ModelProviderEntity?> addModelProvider() async {
    final repo = ref.read(modelProvidersRepositoryProvider);
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

    final provider = await repo.createModelProvider(
      ModelProviderToCreate(
        name: name,
        type: typeModel,
        key: key,
        url: url,
        workspaceId: firstWorkspace.id,
      ),
    );

    return provider;
  }
}

final addChatModelMutation = Mutation<void>();
