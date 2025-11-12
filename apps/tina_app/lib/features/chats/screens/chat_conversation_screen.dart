import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/domain/enums/message_types.dart';
import 'package:tina_app/features/chats/providers/messages_providers.dart';
import 'package:tina_app/features/chats/widgets/chat_input_widget.dart';
import 'package:tina_app/features/chats/widgets/chat_messages_widget.dart';
import 'package:tina_app/features/models/widgets/select_chat_model.dart';
import 'package:tina_app/features/tools/widgets/tools_management_modal.dart';
import 'package:tina_app/widgets/app_error.dart';
import 'package:tina_ui/ui.dart';

class ChatConversationScreen extends ConsumerWidget {
  const ChatConversationScreen({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [conversationSelectedProvider.overrideWithValue(chatId)],
      child: _ChatConversationScreen(),
    );
  }
}

class _ChatConversationScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final messagesAsync = ref.watch(messageListProvider);

    final modelId = ref.watch(
      conversationChatProvider.select((c) => c.value?.modelId),
    );

    final onToolsPress = useCallback(() async {
      // Try to get conversation info

      final conversation = await ref.read(conversationChatProvider.future);
      if (conversation == null) return;
      final conversationId = conversation.id;
      final workspaceId = conversation.workspaceId;

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => ToolsManagementModal(
            conversationId: conversationId,
            workspaceId: workspaceId,
          ),
        );
      }
    }, [ref]);

    return TinaScreen(
      appBar: TinaAppBar(
        actions: [
          IconButton(
            icon: const TinaIcon(Icons.more_vert),
            onPressed: () {
              // TODO: Show chat options
            },
          ),
        ],
        footer: SelectChatModelWidget(
          chatModelId: modelId,
          selectChatModelId: ref
              .watch(conversationChatProvider.notifier)
              .setModel,
        ),
      ),
      child: switch (messagesAsync) {
        AsyncData(value: final messages) => Column(
          children: [
            Expanded(child: ChatMessagesWidget(messages: messages)),
            ChatInputWidget(
              onToolsPress: onToolsPress,
              onSendMessage: (message) {
                ref
                    .read(chatMessagesProvider.notifier)
                    .addMessage(
                      content: message,
                      messageType: MessageType.text,
                    );
              },
            ),
          ],
        ),
        AsyncLoading() => const Center(child: TinaSpinner()),
        AsyncError(:final error, :final stackTrace) => AppErrorWidget(
          error: error,
          stackTrace: stackTrace,
        ),
      },
    );
  }
}
