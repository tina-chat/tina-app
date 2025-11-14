import 'package:auravibes_app/i18n/locale_keys.dart';
import 'package:auravibes_app/widgets/text_locale.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatInputWidget extends HookConsumerWidget {
  const ChatInputWidget({
    required this.onSendMessage,
    required this.onToolsPress,
    super.key,
  });

  final void Function(String message)? onSendMessage;
  final VoidCallback? onToolsPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      child: AuraInput(
        controller: controller,
        footer: Row(
          children: [
            if (onToolsPress != null)
              // Tools button - always show, modal will handle availability
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: AuraButton(
                  onPressed: onToolsPress,
                  variant: AuraButtonVariant.secondary,
                  size: AuraButtonSize.small,
                  child: const AuraIcon(Icons.build_circle_outlined),
                ),
              ),

            const Spacer(),

            // Send button
            AuraButton(
              onPressed: sendMessage,
              size: AuraButtonSize.small,
              child: const AuraIcon(Icons.arrow_upward),
            ),
          ],
        ),
        placeholder: const TextLocale(
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
