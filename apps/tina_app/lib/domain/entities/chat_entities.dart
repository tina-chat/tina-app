class ChatEntity {
  const ChatEntity({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.lastMessage,
    this.modelId,
    this.isPinned = false,
  });

  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? lastMessage;
  final String? modelId;
  final bool isPinned;

  ChatEntity copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? lastMessage,
    String? modelId,
    bool? isPinned,
  }) {
    return ChatEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastMessage: lastMessage ?? this.lastMessage,
      modelId: modelId ?? this.modelId,
      isPinned: isPinned ?? this.isPinned,
    );
  }
}

class ChatMessageEntity {
  const ChatMessageEntity({
    required this.id,
    required this.chatId,
    required this.content,
    required this.isUser,
    required this.createdAt,
    this.status = ChatMessageStatus.sent,
    this.modelId,
  });

  final String id;
  final String chatId;
  final String content;
  final bool isUser;
  final DateTime createdAt;
  final ChatMessageStatus status;
  final String? modelId;
}

enum ChatMessageStatus { sending, sent, delivered, read, error }
