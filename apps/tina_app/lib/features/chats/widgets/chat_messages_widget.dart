import 'package:flutter/material.dart';
import 'package:tina_app/domain/entities/conversation.dart';
import 'package:tina_app/domain/enums/message_types.dart';
import 'package:tina_ui/ui.dart';

class ChatMessagesWidget extends StatelessWidget {
  const ChatMessagesWidget({super.key, required this.messages});

  final List<MessageEntity> messages;

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

  TinaMessageDeliveryStatus _mapMessageStatus(MessageStatus status) {
    return switch (status) {
      MessageStatus.sending => TinaMessageDeliveryStatus.sending,
      MessageStatus.sent => TinaMessageDeliveryStatus.sent,
      MessageStatus.delivered => TinaMessageDeliveryStatus.delivered,
      MessageStatus.read => TinaMessageDeliveryStatus.read,
      MessageStatus.error => TinaMessageDeliveryStatus.error,
    };
  }
}
