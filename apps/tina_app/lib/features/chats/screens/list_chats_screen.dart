import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/chats/widgets/chat_list_widget.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/router/app_router.dart';
import 'package:tina_app/widgets/text_locale.dart';
import 'package:tina_ui/ui.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TinaScreen(
      appBar: TinaAppBar(
        title: TextLocale(LocaleKeys.chats_screens_chats_list_title),
      ),
      child: TinaColumn(
        children: [
          Row(
            children: [
              TinaButton(
                onPressed: () {
                  NewChatRoute().go(context);
                },
                child: TextLocale(LocaleKeys.chats_screens_chats_list_add_chat),
              ),
            ],
          ),

          Expanded(child: ChatListWidget()),
        ],
      ),
    );
  }
}
