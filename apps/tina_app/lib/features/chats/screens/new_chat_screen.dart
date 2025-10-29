import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/chats/widgets/chat_input_widget.dart';
import 'package:tina_app/features/models/widgets/select_chat_model.dart';
import 'package:tina_app/features/workspaces/providers/selected_workspace.dart';
import 'package:tina_app/providers/messages_manager_provider.dart';
import 'package:tina_app/router/app_router.dart';
import 'package:tina_ui/ui.dart';

class NewChatScreen extends HookConsumerWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelIdState = useState<String?>(null);
    final isLoading = useState(false);

    Future<void> handleSendMessage(String message) async {
      if (modelIdState.value == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a chat model')),
        );
        return;
      }

      isLoading.value = true;

      try {
        final workspaceId = await ref.read(
          selectedWorkspaceProvider.selectAsync((w) => w.id),
        );
        if (modelIdState.value == null) {
          throw Exception('no model id value');
        }

        final createdConversation = await ref
            .read(messagesManagerProvider.notifier)
            .addConversation(
              workspaceId: workspaceId,
              modelId: modelIdState.value!,
              message: message,
            );

        if (context.mounted) {
          CoversationRoute(chatId: createdConversation.id).replace(context);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      } finally {
        isLoading.value = false;
      }
    }

    return TinaScreen(
      appBar: TinaAppBar(
        footer: SelectChatModelWidget(
          chatModelId: modelIdState.value,
          selectChatModelId: (value) {
            modelIdState.value = value;
          },
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: ChatInputWidget(
              onSendMessage: (isLoading.value || modelIdState.value == null)
                  ? null
                  : handleSendMessage,
            ),
          ),
          if (isLoading.value)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
