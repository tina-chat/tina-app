import 'package:flutter/material.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/widgets/text_locale.dart';
import 'package:tina_ui/ui.dart';

class ChatInputWidget extends StatefulWidget {
  const ChatInputWidget({super.key, required this.onSendMessage});

  final Function(String message) onSendMessage;

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final _controller = TextEditingController();
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEmpty = _controller.text.trim().isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TinaInput(
        controller: _controller,
        footer: Row(
          children: [
            Expanded(child: Container()),

            TinaButton(
              onPressed: _isEmpty ? null : () => _sendMessage(_controller.text),
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
          if (value.trim().isNotEmpty) {
            _sendMessage(value);
          }
        },
      ),
    );
  }

  void _sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      widget.onSendMessage(message.trim());
      _controller.clear();
    }
  }
}
