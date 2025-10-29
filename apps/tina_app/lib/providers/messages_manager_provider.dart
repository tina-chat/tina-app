import 'dart:async';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langchain/langchain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/conversation.dart';
import 'package:tina_app/domain/enums/message_types.dart';
import 'package:tina_app/features/chats/providers/conversation_providers.dart';
import 'package:tina_app/features/chats/providers/conversation_repository_provider.dart';
import 'package:tina_app/features/models/providers/model_providers_repository_providers.dart';
import 'package:tina_app/services/chatbot_service/chatbot_service.dart';
import 'package:tina_app/utils/drain.dart';

part 'messages_manager_provider.freezed.dart';
part 'messages_manager_provider.g.dart';

enum StreamingMessageStatus { created, streaming, done, error }

@freezed
abstract class StreamingMessage with _$StreamingMessage {
  const factory StreamingMessage({
    required String messageId,
    required String conversationId,
    required String responseMesageId,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    required StreamingMessageStatus status,
  }) = _StreamingMessage;
}

@Riverpod(keepAlive: true)
class MessagesManagerNotifier extends _$MessagesManagerNotifier {
  final Map<String, StreamSubscription<ChatResult>> _subscriptions = {};
  final Map<String, StreamingDeltaPersister> _deltaPersisters = {};

  @override
  List<StreamingMessage> build() {
    ref.onDispose(() {
      for (final subscription in _subscriptions.values) {
        subscription.cancel();
      }

      for (final persister in _deltaPersisters.values) {
        persister.close();
      }
    });

    return [];
  }

  // Add a new stream to the management system
  void _addStream({
    required String messageId,
    required String conversationId,
    required String responseMessageId,
    required Stream<ChatResult> stream,
  }) {
    // Create streaming message entry
    final streamingMessage = StreamingMessage(
      messageId: messageId,
      conversationId: conversationId,
      responseMesageId: responseMessageId,
      content: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: StreamingMessageStatus.created,
    );

    // Add to state
    state = [...state, streamingMessage];

    // Create subscription with internal handlers
    final subscription = stream.listen(
      (data) => _handleIndividualStreamData(responseMessageId, data),
      onError: (error) =>
          _handleIndividualStreamError(responseMessageId, error),
      onDone: () => _handleIndividualStreamDone(responseMessageId),
    );

    final deltaPersister = StreamingDeltaPersister(
      appendDelta: (delta) {
        ref
            .read(messageRepositoryProvider)
            .appendToMessage(responseMessageId, delta);
      },
    );

    _deltaPersisters[responseMessageId] = deltaPersister;
    _subscriptions[responseMessageId] = subscription;
  }

  // Remove a specific stream
  void _removeStream(String messageId) {
    final subscription = _subscriptions.remove(messageId);
    subscription?.cancel();

    final persister = _deltaPersisters.remove(messageId);
    persister?.close();

    // Remove from state
    state = state.where((msg) => msg.messageId != messageId).toList();
  }

  void _handleIndividualStreamData(String messageId, ChatResult data) {
    final persister = _deltaPersisters[messageId];

    final delta = data.outputAsString;

    persister?.addDelta(delta);

    final streamingMessage = state.firstWhereOrNull((element) {
      return element.responseMesageId == messageId;
    });
    if (streamingMessage?.status == StreamingMessageStatus.created) {
      // mark message as sent
      final streamingMessageId = streamingMessage!.messageId;

      ref
          .read(messageRepositoryProvider)
          .updateMessage(
            streamingMessageId,
            MessageToUpdate(status: MessageStatus.sent),
          );
    }

    state = state.map((msg) {
      if (msg.responseMesageId == messageId) {
        return msg.copyWith(
          status: StreamingMessageStatus.streaming,
          content: msg.content + delta,
          updatedAt: DateTime.now(),
        );
      }
      return msg;
    }).toList();
  }

  void _handleIndividualStreamError(String messageId, Object error) {
    // TODO: Handle individual stream errors
    // Remove the failed stream
    _removeStream(messageId);

    // Optionally update UI to show error state
    // Could add error information to the message
  }

  void _handleIndividualStreamDone(String messageId) {
    // TODO: Handle individual stream completion
    // Remove the subscription but keep the message in state
    _subscriptions.remove(messageId);

    // Optionally update message status to "completed"
    state = state.map((msg) {
      if (msg.messageId == messageId) {
        return msg.copyWith(
          updatedAt: DateTime.now(),
          status: StreamingMessageStatus.done,
        );
      }
      return msg;
    }).toList();

    ref
        .read(messageRepositoryProvider)
        .updateMessage(messageId, MessageToUpdate(status: MessageStatus.sent));
  }

  Future<ConversationEntity> addConversation({
    required String workspaceId,
    required String modelId,
    required String message,
  }) async {
    // generate a title
    // store conversation
    // create message
    // start message streaming

    // Get chat model provider
    final chatModelsRepository = ref.read(chatModelsRepositoryProvider);
    final foundModel = await chatModelsRepository.getChatModelById(modelId);
    if (foundModel == null) {
      throw Exception('Selected model not found');
    }

    // Generate title for conversation
    final titleService = ChatbotService(foundModel);
    final title = await titleService.generateTitle(message);

    // Create conversation
    final conversation = await ref
        .read(conversationsListProvider.notifier)
        .addConversation(title, modelId);

    final createdMessage = await ref
        .read(messageRepositoryProvider)
        .createMessage(
          MessageToCreate(
            conversationId: conversation.id,
            content: message,
            messageType: MessageType.text,
            isUser: true,
            status: MessageStatus.sending,
          ),
        );

    // Create response message
    final responseMessage = await ref
        .read(messageRepositoryProvider)
        .createMessage(
          MessageToCreate(
            conversationId: conversation.id,
            content: '',
            messageType: MessageType.text,
            isUser: false,
            status: MessageStatus.sending,
          ),
        );

    final stream = titleService.sendMessage([createdMessage]);

    _addStream(
      messageId: createdMessage.id,
      conversationId: conversation.id,
      responseMessageId: responseMessage.id,
      stream: stream,
    );

    return conversation;
  }

  Future<(MessageEntity userMessage, MessageEntity systemMessage)> sendMessage({
    required String conversationId,
    required String message,
  }) async {
    final createdMessage = await ref
        .read(messageRepositoryProvider)
        .createMessage(
          MessageToCreate(
            conversationId: conversationId,
            content: message,
            messageType: MessageType.text,
            isUser: true,
            status: MessageStatus.sending,
          ),
        );
    final messages = await ref
        .read(messageRepositoryProvider)
        .getMessagesByConversation(conversationId);
    // Create response message
    final responseMessage = await ref
        .read(messageRepositoryProvider)
        .createMessage(
          MessageToCreate(
            conversationId: conversationId,
            content: '',
            messageType: MessageType.text,
            isUser: false,
            status: MessageStatus.sending,
          ),
        );

    // Get chat model provider
    final conversation = await ref
        .read(conversationRepositoryProvider)
        .getConversationById(conversationId);
    final modelId = conversation?.modelId;
    if (modelId == null) {
      throw Exception('no model id for conversation');
    }
    final chatModelsRepository = ref.read(chatModelsRepositoryProvider);
    final foundModel = await chatModelsRepository.getChatModelById(modelId);
    if (foundModel == null) {
      throw Exception('Selected model not found');
    }

    // Generate title for conversation
    final titleService = ChatbotService(foundModel);

    final stream = titleService.sendMessage(messages);
    _addStream(
      messageId: createdMessage.id,
      conversationId: conversationId,
      responseMessageId: responseMessage.id,
      stream: stream,
    );

    return (createdMessage, responseMessage);
  }
}
