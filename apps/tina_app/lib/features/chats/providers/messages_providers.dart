import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/core/exceptions/conversation_exceptions.dart';
import 'package:tina_app/domain/entities/conversation.dart';
import 'package:tina_app/domain/enums/message_types.dart';
import 'package:tina_app/features/chats/providers/conversation_providers.dart';
import 'package:tina_app/features/chats/providers/conversation_repository_provider.dart';
import 'package:tina_app/providers/messages_manager_provider.dart';

part 'messages_providers.g.dart';

final addMessageMutation = Mutation<MessageEntity>();
final deleteMessageMutation = Mutation<void>();
final updateMessageMutation = Mutation<MessageEntity>();

@riverpod
String conversationSelectedNotifier(Ref ref) =>
    throw const NoConversationSelectedException();

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

@Riverpod(dependencies: [conversationSelectedNotifier])
class ChatMessages extends _$ChatMessages {
  @override
  Future<List<MessageEntity>> build() async {
    final conversationId = ref.watch(conversationSelectedProvider);
    final messages = await ref
        .watch(messageRepositoryProvider)
        .getMessagesByConversation(conversationId);

    return messages;
  }

  Future<void> addMessage({
    required String content,
    required MessageType messageType,
  }) async {
    final conversationId = ref.read(conversationSelectedProvider);
    final messagesManager = ref.read(messagesManagerProvider.notifier);

    final (userMessage, systemMessage) = await messagesManager.sendMessage(
      conversationId: conversationId,
      message: content,
    );

    state = AsyncValue.data([...state.value ?? [], userMessage, systemMessage]);
  }
}

@Riverpod(dependencies: [ChatMessages])
Future<List<String>> messageList(Ref ref) async {
  final messages = await ref.watch(
    chatMessagesProvider.selectAsync(
      (messages) => messages.map((message) => message.id).toList(),
    ),
  );

  return messages;
}

@Riverpod(dependencies: [ChatMessages])
String messageIdNotifier(Ref ref) =>
    throw Exception('implement messageIdNotifier');

@Riverpod(dependencies: [messageIdNotifier, ChatMessages])
MessageEntity? messageConversation(Ref ref) {
  final messageId = ref.watch(messageIdProvider);

  final isLoading = ref.watch(
    chatMessagesProvider.select((value) => value.isLoading),
  );

  var messageEntity = ref.watch(
    chatMessagesProvider.select(
      (value) => value.value?.firstWhereOrNull((c) => c.id == messageId),
    ),
  );

  if (messageEntity == null && !isLoading) {
    ref.invalidate(chatMessagesProvider);
    messageEntity = ref.watch(
      chatMessagesProvider.select(
        (value) => value.value?.firstWhereOrNull((c) => c.id == messageId),
      ),
    );
  }

  if (messageEntity == null) return null;

  final updateMessage = ref.watch(
    messagesManagerProvider.select(
      (messages) => messages.firstWhereOrNull((message) {
        return message.responseMesageId == messageId;
      }),
    ),
  );

  if (updateMessage == null) return messageEntity;

  return messageEntity.copyWith(
    content: updateMessage.content,
    metadata: updateMessage.metadata,
    status: switch (updateMessage.status) {
      StreamingMessageStatus.created => MessageStatus.sending,
      StreamingMessageStatus.streaming => MessageStatus.sending,
      StreamingMessageStatus.done => MessageStatus.sent,
      StreamingMessageStatus.error => MessageStatus.error,
    },
  );
}
