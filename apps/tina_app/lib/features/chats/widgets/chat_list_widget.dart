import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/domain/entities/chat_entities.dart';
import 'package:tina_app/features/chats/providers/chat_providers.dart';
import 'package:tina_app/router/app_router.dart';
import 'package:tina_ui/ui.dart';

class ChatListWidget extends ConsumerWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatListAsync = ref.watch(chatListProvider);

    return switch (chatListAsync) {
      AsyncData(value: final chats) => () {
        if (chats.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];
            return _ChatTile(chat: chat);
          },
        );
      }(),
      AsyncLoading() => const Center(child: TinaSpinner()),
      AsyncError(error: final error, stackTrace: _) => Center(
        child: TinaText(
          style: TinaTextStyle.body,
          child: Text('Error loading chats: ${error.toString()}'),
        ),
      ),
    };
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaIcon(
              Icons.chat_outlined,
              size: TinaIconSize.extraLarge,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            TinaText(
              style: TinaTextStyle.heading3,
              child: Text('No Chats Yet'),
            ),
            const SizedBox(height: 8),
            TinaText(
              style: TinaTextStyle.body,
              textAlign: TextAlign.center,
              child: Text('Start your first conversation with Tina AI'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  const _ChatTile({required this.chat});

  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    return TinaCard(
      padding: TinaCardPadding.medium,
      // backgroundColor: Colors.red,
      onTap: () {
        CoversationRoute(chatId: chat.id).go(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (chat.isPinned) ...[
                          TinaIcon(
                            Icons.push_pin_outlined,
                            size: TinaIconSize.small,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: TinaText(
                            style: TinaTextStyle.heading6,
                            child: Text(
                              chat.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    TinaText(
                      style: TinaTextStyle.bodySmall,
                      color: TinaTextColor.onSurfaceVariant,
                      child: Text(
                        _formatDate(chat.updatedAt),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              if (chat.modelId != null) ...[
                const SizedBox(width: 8),
                TinaBadge.text(
                  variant: TinaBadgeVariant.info,
                  child: Text(chat.modelId!),
                ),
              ],
            ],
          ),
          if (chat.lastMessage != null) ...[
            const SizedBox(height: 8),
            TinaText(
              style: TinaTextStyle.bodySmall,
              color: TinaTextColor.onSurfaceVariant,
              child: Text(
                chat.lastMessage!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
