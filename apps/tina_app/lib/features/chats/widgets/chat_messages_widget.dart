import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/domain/enums/message_types.dart';
import 'package:tina_app/features/chats/providers/messages_providers.dart';
import 'package:tina_ui/ui.dart';

class ChatMessagesWidget extends HookWidget {
  const ChatMessagesWidget({super.key, required this.messages});

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    final data = useMemoized(() => messages.reversed.toList(), [messages]);
    final controller = useScrollController();

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(16),
      reverse: true,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      itemCount: data.length,
      cacheExtent: 500,
      itemBuilder: (context, index) {
        final messageId = data[index];

        return ProviderScope(
          overrides: [messageIdProvider.overrideWithValue(messageId)],
          child: _ChatMessageRow(key: ValueKey(messageId)),
        );
      },
    );
  }
}

class _ChatMessageRow extends HookConsumerWidget {
  const _ChatMessageRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(messageConversationProvider);
    if (message == null) {
      return const SizedBox.shrink();
    }
    return AnimatedSize(
      duration: Duration(microseconds: 200),
      alignment: Alignment.topLeft,
      child: TinaMessageBubble(
        key: ValueKey(message.id),
        content: message.content,
        isUser: message.isUser,
        timestamp: message.createdAt,
        status: _mapMessageStatus(message.status),
      ),
    );
  }

  TinaMessageDeliveryStatus _mapMessageStatus(MessageStatus status) {
    return switch (status) {
      MessageStatus.sending => TinaMessageDeliveryStatus.sending,
      MessageStatus.sent => TinaMessageDeliveryStatus.sent,
      MessageStatus.delivered => TinaMessageDeliveryStatus.delivered,
      MessageStatus.streaming => TinaMessageDeliveryStatus.sending,
      MessageStatus.error => TinaMessageDeliveryStatus.error,
    };
  }
}
