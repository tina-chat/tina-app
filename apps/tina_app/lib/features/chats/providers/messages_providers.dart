import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/conversation.dart';
import 'package:tina_app/domain/enums/message_types.dart';
import 'package:tina_app/features/chats/providers/conversation_providers.dart';
import 'package:tina_app/features/chats/providers/conversation_repository_provider.dart';
import 'package:tina_app/features/models/providers/list_chat_models_providers.dart';
import 'package:tina_app/services/chatbot_service/chatbot_service.dart';
import 'package:tina_app/utils/drain.dart';

part 'messages_providers.g.dart';

final addMessageMutation = Mutation<MessageEntity>();
final deleteMessageMutation = Mutation<void>();
final updateMessageMutation = Mutation<MessageEntity>();

@riverpod
String conversationSelectedNotifier(Ref ref) =>
    throw Exception('implement conversationSelectedNotifier');

@Riverpod(dependencies: [conversationSelectedNotifier])
class ConversationChatNotifier extends _$ConversationChatNotifier {
  @override
  Future<ConversationEntity?> build() async {
    final conversationId = ref.watch(conversationSelectedProvider);

    return ref
        .read(conversationRepositoryProvider)
        .getConversationById(conversationId);
  }

  Future<void> setModel(String? modelId) async {
    final id = state.value?.id;
    if (id == null) return;

    final updatedConversation = await ref
        .read(conversationsListProvider.notifier)
        .updateConversation(id, ConversationToUpdate(modelId: modelId));
    state = AsyncData(updatedConversation);
  }
}

@Riverpod(dependencies: [ConversationChatNotifier])
class ChatMessages extends _$ChatMessages {
  @override
  Future<List<MessageEntity>> build() async {
    final conversationId = ref.watch(
      conversationChatProvider.select((c) => c.value?.id),
    );

    if (conversationId == null) return [];
    return ref
        .watch(messageRepositoryProvider)
        .getMessagesByConversation(conversationId);
  }

  Future<void> addMessage({
    required String content,
    required MessageType messageType,
  }) async {
    final modelId = ref.watch(
      conversationChatProvider.select((c) => c.value?.modelId),
    );
    final conversationId = ref.watch(
      conversationChatProvider.select((c) => c.value?.id),
    );
    if (conversationId == null) return;

    final newMessage = await addMessageMutation(conversationId).run(ref, (tsx) {
      return tsx
          .get(messageRepositoryProvider)
          .createMessage(
            MessageToCreate(
              conversationId: conversationId,
              content: content,
              messageType: messageType,
              isUser: true,
              status: MessageStatus.sent,
            ),
          );
    });

    _sendingData(content, modelId);

    state = AsyncValue.data([...state.value ?? [], newMessage]);
  }

  void _sendingData(String content, String? modelId) async {
    final (conversationId, modelIdSelected) = ref.watch(
      conversationChatProvider.select((c) => (c.value?.id, c.value?.modelId)),
    );
    if (conversationId == null) return;
    if (modelIdSelected == null) return;

    final chatModels = ref.read(
      listChatModelProvidersProvider.select(
        (cm) => cm.value?.firstWhereOrNull(
          (model) => model.chatModel.id == modelIdSelected,
        ),
      ),
    );
    if (chatModels == null) return;

    final newMessage = await addMessageMutation(conversationId).run(ref, (tsx) {
      return tsx
          .get(messageRepositoryProvider)
          .createMessage(
            MessageToCreate(
              conversationId: conversationId,
              content: '',
              messageType: MessageType.text,
              isUser: true,
              status: MessageStatus.sending,
            ),
          );
    });

    state = AsyncData([...state.value ?? [], newMessage]);

    final deltaPersister = StreamingDeltaPersister(
      appendDelta: (delta) {
        ref
            .read(messageRepositoryProvider)
            .appendToMessage(newMessage.id, delta);
      },
    );
    ChatbotService(chatModels).sendMessage(content).listen((chatResult) {
      // print(data);
      final delta = chatResult.outputAsString;
      deltaPersister.addDelta(delta);
      state = AsyncData([
        ...state.value?.map((message) {
              if (message.id != newMessage.id) return message;
              return message.copyWith(content: message.content + delta);
            }) ??
            [],
      ]);
    });
  }
}
