import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/chat_entities.dart';

part 'chat_providers.g.dart';

@riverpod
class ChatList extends _$ChatList {
  @override
  Future<List<ChatEntity>> build() async {
    // Mock data for now
    return _getMockChats();
  }

  Future<void> addChat(String title, {String? modelId}) async {
    final newChat = ChatEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      modelId: modelId,
    );

    state = AsyncValue.data([...state.value ?? [], newChat]);
  }

  Future<void> deleteChat(String chatId) async {
    state = AsyncValue.data([
      ...(state.value ?? []).where((chat) => chat.id != chatId),
    ]);
  }

  Future<void> updateChatTitle(String chatId, String newTitle) async {
    state = AsyncValue.data([
      ...(state.value ?? []).map((chat) {
        if (chat.id == chatId) {
          return chat.copyWith(title: newTitle, updatedAt: DateTime.now());
        }
        return chat;
      }),
    ]);
  }
}

@riverpod
class ChatMessages extends _$ChatMessages {
  @override
  Future<List<ChatMessageEntity>> build(String? chatId) async {
    if (chatId == null) {
      return [];
    }
    // Mock messages for the chat
    return _getMockMessages(chatId);
  }

  Future<void> addMessage(
    String content,
    bool isUser, {
    String? modelId,
  }) async {
    final newMessage = ChatMessageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: chatId ?? '',
      content: content,
      isUser: isUser,
      createdAt: DateTime.now(),
      modelId: modelId,
    );

    state = AsyncValue.data([...state.value ?? [], newMessage]);
  }
}

List<ChatEntity> _getMockChats() {
  return [
    ChatEntity(
      id: '1',
      title: 'Project Planning Discussion',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      updatedAt: DateTime.now().subtract(const Duration(minutes: 30)),
      lastMessage: 'Let\'s discuss the architecture for the new feature',
      modelId: 'gpt-4',
      isPinned: true,
    ),
    ChatEntity(
      id: '2',
      title: 'Code Review Help',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 3)),
      lastMessage: 'Can you help me review this pull request?',
      modelId: 'claude-3',
    ),
    ChatEntity(
      id: '3',
      title: 'Debugging Session',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      lastMessage: 'I\'m getting a null reference error',
      modelId: 'gpt-3.5-turbo',
    ),
    ChatEntity(
      id: '4',
      title: 'Learning Flutter',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      lastMessage: 'What are the best practices for state management?',
      modelId: 'claude-3-haiku',
    ),
  ];
}

List<ChatMessageEntity> _getMockMessages(String chatId) {
  // Return different mock messages based on chat ID
  switch (chatId) {
    case '1':
      return [
        ChatMessageEntity(
          id: '1-1',
          chatId: chatId,
          content: 'Hi! I need help planning a new feature for my app.',
          isUser: true,
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        ChatMessageEntity(
          id: '1-2',
          chatId: chatId,
          content:
              'I\'d be happy to help you plan your new feature! What kind of feature are you thinking about implementing?',
          isUser: false,
          createdAt: DateTime.now().subtract(
            const Duration(hours: 2, minutes: 5),
          ),
        ),
        ChatMessageEntity(
          id: '1-3',
          chatId: chatId,
          content:
              'I want to add a chat interface similar to what we have here, with support for multiple AI models.',
          isUser: true,
          createdAt: DateTime.now().subtract(
            const Duration(hours: 1, minutes: 50),
          ),
        ),
        ChatMessageEntity(
          id: '1-4',
          chatId: chatId,
          content: 'Let\'s discuss the architecture for the new feature',
          isUser: false,
          createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        ),
      ];
    case '2':
      return [
        ChatMessageEntity(
          id: '2-1',
          chatId: chatId,
          content: 'Can you help me review this pull request?',
          isUser: true,
          createdAt: DateTime.now().subtract(const Duration(hours: 4)),
        ),
        ChatMessageEntity(
          id: '2-2',
          chatId: chatId,
          content:
              'I\'d be glad to help review your pull request. Please share the details of what you\'ve changed and any specific concerns you have.',
          isUser: false,
          createdAt: DateTime.now().subtract(
            const Duration(hours: 3, minutes: 50),
          ),
        ),
      ];
    default:
      return [
        ChatMessageEntity(
          id: '$chatId-1',
          chatId: chatId,
          content: 'Hello! How can I help you today?',
          isUser: false,
          createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
      ];
  }
}
