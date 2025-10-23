import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/chats/providers/chat_providers.dart';
import 'package:tina_app/features/chats/widgets/chat_input_widget.dart';
import 'package:tina_app/features/chats/widgets/chat_messages_widget.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/widgets/text_locale.dart';
import 'package:tina_ui/ui.dart';

class ChatConversationScreen extends ConsumerStatefulWidget {
  const ChatConversationScreen({super.key, this.chatId});

  final String? chatId;

  @override
  ConsumerState<ChatConversationScreen> createState() =>
      _ChatConversationScreenState();
}

class _ChatConversationScreenState
    extends ConsumerState<ChatConversationScreen> {
  String? _selectedModelId;

  final List<String> _mockModels = [
    'gpt-4',
    'gpt-3.5-turbo',
    'claude-3',
    'claude-3-haiku',
  ];

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(chatMessagesProvider(widget.chatId));

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
        footer: TinaDropdownSelector<String>(
          value: _selectedModelId,
          onChanged: (value) {
            setState(() {
              _selectedModelId = value;
            });
          },
          placeholder: const TextLocale(
            LocaleKeys.chats_screens_chat_conversation_select_model_selctor,
          ),
          options: _mockModels
              .map(
                (model) => TinaDropdownOption(value: model, child: Text(model)),
              )
              .toList(),
        ),
      ),
      child: switch (messagesAsync) {
        AsyncData(value: final messages) => Column(
          children: [
            Expanded(child: ChatMessagesWidget(messages: messages)),
            ChatInputWidget(
              onSendMessage: (message) {
                ref
                    .read(chatMessagesProvider(widget.chatId).notifier)
                    .addMessage(message, true, modelId: _selectedModelId);

                // Simulate AI response
                Future.delayed(const Duration(seconds: 1), () {
                  ref
                      .read(chatMessagesProvider(widget.chatId).notifier)
                      .addMessage(
                        'This is a mock AI response to: "$message"',
                        false,
                        modelId: _selectedModelId,
                      );
                });
              },
            ),
          ],
        ),
        AsyncLoading() => const Center(child: TinaSpinner()),
        AsyncError(error: final error, stackTrace: _) => Center(
          child: TinaText(
            style: TinaTextStyle.body,
            child: Text('Error loading messages: ${error.toString()}'),
          ),
        ),
      },
    );
  }
}
