import 'package:riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/conversation.dart';
import 'package:tina_app/features/chats/providers/conversation_repository_provider.dart';
import 'package:tina_app/features/workspaces/providers/selected_workspace.dart';

part 'conversation_providers.g.dart';

final addConversationMutation = Mutation<ConversationEntity>();
final deleteConversationMutation = Mutation<void>();
final updateConversationMutation = Mutation<ConversationEntity>();

@riverpod
class ConversationsList extends _$ConversationsList {
  @override
  Future<List<ConversationEntity>> build() async {
    final conversationRepository = ref.watch(conversationRepositoryProvider);

    final selectedWorkspace = await ref.watch(selectedWorkspaceProvider.future);

    return conversationRepository.getConversationsByWorkspace(
      selectedWorkspace.id,
    );
  }

  Future<ConversationEntity> addConversation(
    String title, [
    String? modelId,
  ]) async {
    final newConversation = await addConversationMutation.run(ref, (tsx) async {
      final selectedWorkspace = await tsx.get(selectedWorkspaceProvider.future);
      final conversationRepository = tsx.get(conversationRepositoryProvider);

      return await conversationRepository.createConversation(
        ConversationToCreate(
          title: title,
          workspaceId: selectedWorkspace.id,
          modelId: modelId,
        ),
      );
    });

    state = AsyncData([newConversation, ...state.value ?? []]);

    return newConversation;
  }

  Future<void> deleteConversation(String conversationId) async {
    await deleteConversationMutation(conversationId).run(ref, (tsx) {
      final conversationRepository = tsx.get(conversationRepositoryProvider);
      return conversationRepository.deleteConversation(conversationId);
    });
    state = AsyncData([
      ...(state.value ?? []).where((chat) => chat.id != conversationId),
    ]);
  }

  Future<ConversationEntity> updateConversation(
    String conversationId,
    ConversationToUpdate conversation,
  ) async {
    final updatedConverstaion = await updateConversationMutation(conversationId)
        .run(ref, (tsx) {
          final conversationRepository = tsx.get(
            conversationRepositoryProvider,
          );
          return conversationRepository.updateConversation(
            conversationId,
            conversation,
          );
        });
    state = AsyncData([
      ...(state.value ?? []).map((conversation) {
        return conversation.id == conversationId
            ? updatedConverstaion
            : conversation;
      }),
    ]);
    return updatedConverstaion;
  }
}
