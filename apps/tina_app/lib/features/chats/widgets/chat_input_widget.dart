import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/widgets/text_locale.dart';
import 'package:tina_ui/ui.dart';

class ChatInputWidget extends HookConsumerWidget {
  const ChatInputWidget({super.key, required this.onSendMessage});

  final void Function(String message)? onSendMessage;

  @override
  Widget build(BuildContext context, ref) {
    final controller = useTextEditingController();

    final isEmpty = useListenableSelector(
      controller,
      () => controller.text.trim().isEmpty,
    );

    final sendMessage = useMemoized<void Function()?>(
      () => (isEmpty || onSendMessage == null)
          ? null
          : () {
              final message = controller.text.trim();
              onSendMessage!(message);
              controller.clear();
            },
      [controller, onSendMessage, isEmpty],
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: TinaInput(
        controller: controller,
        footer: Row(
          children: [
            Expanded(child: Container()),

            TinaButton(
              onPressed: sendMessage,
              size: TinaButtonSize.small,
              child: const TinaIcon(Icons.arrow_upward),
            ),
          ],
        ),
        placeholder: TextLocale(
          LocaleKeys.chats_screens_chat_conversation_message_placeholder,
        ),
        maxLines: 2,
        textInputAction: TextInputAction.send,
        onSubmitted: (value) {
          sendMessage?.call();
        },
      ),
    );
  }
}
