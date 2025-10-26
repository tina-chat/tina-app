import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/chats/widgets/chat_input_widget.dart';
import 'package:tina_app/features/models/widgets/select_chat_model.dart';
import 'package:tina_ui/ui.dart';

class NewChatScreen extends HookConsumerWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelIdState = useState<String?>(null);
    return TinaScreen(
      appBar: TinaAppBar(
        footer: SelectChatModelWidget(
          chatModelId: modelIdState.value,
          selectChatModelId: (value) {
            modelIdState.value = value;
          },
        ),
      ),
      child: Center(child: ChatInputWidget(onSendMessage: (message) {})),
    );
  }
}
