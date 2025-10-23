import 'package:flutter/material.dart';
import 'package:tina_app/domain/entities/chat_entities.dart';
import 'package:tina_ui/ui.dart';

class ChatMessagesWidget extends StatelessWidget {
  const ChatMessagesWidget({super.key, required this.messages});

  final List<ChatMessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return TinaMessageBubble(
          content: message.content,
          isUser: message.isUser,
          timestamp: message.createdAt,
          status: _mapMessageStatus(message.status),
        );
      },
    );
  }

  TinaMessageDeliveryStatus _mapMessageStatus(ChatMessageStatus status) {
    switch (status) {
      case ChatMessageStatus.sending:
        return TinaMessageDeliveryStatus.sending;
      case ChatMessageStatus.sent:
        return TinaMessageDeliveryStatus.sent;
      case ChatMessageStatus.delivered:
        return TinaMessageDeliveryStatus.delivered;
      case ChatMessageStatus.read:
        return TinaMessageDeliveryStatus.read;
      case ChatMessageStatus.error:
        return TinaMessageDeliveryStatus.error;
    }
  }
}
