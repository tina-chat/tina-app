import 'package:auravibes_app/domain/entities/model_providers_entities.dart';
import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:auravibes_app/features/models/models/add_model_provider_model.dart';
import 'package:auravibes_app/features/models/providers/model_providers_repository_providers.dart';
import 'package:auravibes_app/features/workspaces/providers/workspace_repository_providers.dart';
import 'package:riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_model_provider_providers.g.dart';

sealed class AddModelException implements Exception {}

class AddModelExceptionNoWorkspace implements AddModelException {}

class AddModelExceptionNoUnkown implements AddModelException {}

@riverpod
class AddModelProviderState extends _$AddModelProviderState {
  @override
  AddModelProviderModel build() {
    return const AddModelProviderModel();
  }

  void setName(String newName) {
    state = state.copyWith(
      name: newName,
    );
  }

  void setKey(String newKey) {
    state = state.copyWith(
      key: newKey,
    );
  }

  void setType(ChatModelType? newValue) {
    state = state.copyWith(
      type: newValue,
    );
  }

  void setUrl(String? newUrl) {
    state = state.copyWith(
      url: newUrl,
    );
  }

  Future<ModelProviderEntity?> addModelProvider() async {
    if (!state.isValid()) {
      return null;
    }

    try {
      final repo = ref.read(modelProvidersRepositoryProvider);
      final wRepo = ref.read(workspaceRepositoryProvider);

      final workspaces = await wRepo.getAllWorkspaces();
      final firstWorkspace = workspaces.firstOrNull;
      if (firstWorkspace == null) {
        throw AddModelExceptionNoWorkspace();
      }

      final provider = await repo.createModelProvider(
        ModelProviderToCreate(
          name: state.name!,
          type: state.type!,
          key: state.key!,
          url: state.url,
          workspaceId: firstWorkspace.id,
        ),
      );
      return provider;
    } on AddModelException catch (_) {
      rethrow;
    } on Exception catch (_) {
      throw AddModelExceptionNoUnkown();
    }
  }
}

final addChatModelMutationProvider = Mutation<void>();
