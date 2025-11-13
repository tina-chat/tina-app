import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/domain/enums/message_types.dart';
import 'package:tina_app/features/chats/providers/messages_providers.dart';
import 'package:tina_ui/ui.dart';

class ChatMessagesWidget extends HookConsumerWidget {
  const ChatMessagesWidget({super.key, required this.messages});

  final List<String> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

var encoder = const JsonEncoder.withIndent('  ');

String? _tryDecode(String? metadata) {
  if (metadata == null) return null;
  dynamic decoded;
  try {
    decoded = jsonDecode(metadata);
  } catch (e) {
    return metadata;
  }

  if (decoded is Map<String, dynamic>) {
    if (decoded.length == 1) {
      return _tryDecode(decoded.values.first);
    }
  }

  return encoder.convert(decoded);
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
      child: TinaColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.metadata?.toolCalls == null || message.content.isNotEmpty)
            TinaMessageBubble(
              key: ValueKey(message.id),
              content: message.content,
              isUser: message.isUser,
              timestamp: message.createdAt,
              status: _mapMessageStatus(message.status),
            ),
          if (message.metadata?.toolCalls != null) ...[
            for (var toolCall in message.metadata!.toolCalls)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.tinaColors.info,
                ),
                padding: EdgeInsetsDirectional.all(
                  context.tinaTheme.spacing.sm,
                ),
                margin: EdgeInsetsDirectional.all(context.tinaTheme.spacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: toolCall.name),
                          if (_tryDecode(toolCall.argumentsRaw) != null)
                            TextSpan(text: '( '),
                          TextSpan(text: _tryDecode(toolCall.argumentsRaw)),
                          TextSpan(text: ' )'),
                        ],
                      ),
                    ),
                    if (_tryDecode(toolCall.responseRaw) != null)
                      Text(_tryDecode(toolCall.responseRaw)!),
                  ],
                ),
              ),
          ],
        ],
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
