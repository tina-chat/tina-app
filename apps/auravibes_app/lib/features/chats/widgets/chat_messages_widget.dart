import 'dart:convert';

import 'package:auravibes_app/domain/enums/message_types.dart';
import 'package:auravibes_app/features/chats/providers/messages_providers.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatMessagesWidget extends HookConsumerWidget {
  const ChatMessagesWidget({required this.messages, super.key});

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

JsonEncoder encoder = const JsonEncoder.withIndent('  ');

String? _tryDecode(Object? metadata) {
  if (metadata == null) return null;
  dynamic decoded;
  try {
    if (metadata is String) {
      decoded = jsonDecode(metadata);
    }
  } on Exception catch (_) {
    return metadata.toString();
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
      duration: const Duration(microseconds: 200),
      alignment: Alignment.topLeft,
      child: AuraColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.metadata?.toolCalls == null || message.content.isNotEmpty)
            AuraMessageBubble(
              key: ValueKey(message.id),
              content: message.content,
              isUser: message.isUser,
              timestamp: message.createdAt,
              status: _mapMessageStatus(message.status),
            ),
          if (message.metadata?.toolCalls != null) ...[
            for (final toolCall in message.metadata!.toolCalls)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.auraColors.info,
                ),
                padding: EdgeInsetsDirectional.all(
                  context.auraTheme.spacing.sm,
                ),
                margin: EdgeInsetsDirectional.all(context.auraTheme.spacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: toolCall.name),
                          if (_tryDecode(toolCall.argumentsRaw) != null)
                            const TextSpan(text: '( '),
                          TextSpan(text: _tryDecode(toolCall.argumentsRaw)),
                          const TextSpan(text: ' )'),
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

  AuraMessageDeliveryStatus _mapMessageStatus(MessageStatus status) {
    return switch (status) {
      MessageStatus.sending => AuraMessageDeliveryStatus.sending,
      MessageStatus.sent => AuraMessageDeliveryStatus.sent,
      MessageStatus.delivered => AuraMessageDeliveryStatus.delivered,
      MessageStatus.streaming => AuraMessageDeliveryStatus.sending,
      MessageStatus.error => AuraMessageDeliveryStatus.error,
    };
  }
}
