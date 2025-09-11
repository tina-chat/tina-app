import 'package:equatable/equatable.dart';
import '../value_objects/chat_id.dart';
import 'message.dart';

/// Represents a chat conversation aggregate root.
///
/// This is the main aggregate in the chat domain, responsible for
/// maintaining chat state and enforcing business rules.
class Chat extends Equatable {
  const Chat._({
    required this.id,
    required this.title,
    required this.createdAt,
    this.updatedAt,
    this.workflowId,
    this.messages = const [],
  });

  /// Creates a new chat conversation
  factory Chat.create({
    required String title,
    ChatId? id,
    DateTime? createdAt,
    String? workflowId,
  }) {
    return Chat._(
      id: id ?? ChatId.generate(),
      title: title.trim(),
      createdAt: createdAt ?? DateTime.now(),
      workflowId: workflowId,
    );
  }

  /// Creates a chat with existing data (for reconstruction from storage)
  factory Chat.fromData({
    required ChatId id,
    required String title,
    required DateTime createdAt,
    DateTime? updatedAt,
    String? workflowId,
    List<Message> messages = const [],
  }) {
    return Chat._(
      id: id,
      title: title,
      createdAt: createdAt,
      updatedAt: updatedAt,
      workflowId: workflowId,
      messages: List.unmodifiable(messages),
    );
  }

  /// Unique identifier for this chat
  final ChatId id;

  /// Title of the chat conversation
  final String title;

  /// When the chat was created
  final DateTime createdAt;

  /// When the chat was last updated
  final DateTime? updatedAt;

  /// ID of the workflow associated with this chat
  final String? workflowId;

  /// Messages in this chat (ordered by creation time)
  final List<Message> messages;

  /// Updates the chat title
  Chat updateTitle(String newTitle) {
    if (newTitle.trim().isEmpty) {
      throw ArgumentError('Chat title cannot be empty');
    }

    return Chat._(
      id: id,
      title: newTitle.trim(),
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      workflowId: workflowId,
      messages: messages,
    );
  }

  /// Associates a workflow with this chat
  Chat associateWorkflow(String newWorkflowId) {
    return Chat._(
      id: id,
      title: title,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      workflowId: newWorkflowId,
      messages: messages,
    );
  }

  /// Adds a message to this chat
  Chat addMessage(Message message) {
    if (message.chatId != id) {
      throw ArgumentError('Message chatId does not match this chat');
    }

    final updatedMessages = [...messages, message];

    return Chat._(
      id: id,
      title: title,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      workflowId: workflowId,
      messages: List.unmodifiable(updatedMessages),
    );
  }

  /// Updates an existing message in this chat
  Chat updateMessage(Message updatedMessage) {
    if (updatedMessage.chatId != id) {
      throw ArgumentError('Message chatId does not match this chat');
    }

    final messageIndex = messages.indexWhere((m) => m.id == updatedMessage.id);
    if (messageIndex == -1) {
      throw ArgumentError('Message not found in this chat');
    }

    final updatedMessages = [...messages];
    updatedMessages[messageIndex] = updatedMessage;

    return Chat._(
      id: id,
      title: title,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      workflowId: workflowId,
      messages: List.unmodifiable(updatedMessages),
    );
  }

  /// Removes a message from this chat
  Chat removeMessage(Message message) {
    final updatedMessages = messages.where((m) => m.id != message.id).toList();

    return Chat._(
      id: id,
      title: title,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      workflowId: workflowId,
      messages: List.unmodifiable(updatedMessages),
    );
  }

  /// Gets the last message in this chat
  Message? get lastMessage {
    return messages.isEmpty ? null : messages.last;
  }

  /// Gets the number of messages in this chat
  int get messageCount => messages.length;

  /// Whether this chat has any messages
  bool get hasMessages => messages.isNotEmpty;

  /// Whether this chat is empty
  bool get isEmpty => messages.isEmpty;

  /// Gets user messages only
  List<Message> get userMessages {
    return messages.where((m) => m.isUser).toList();
  }

  /// Gets assistant messages only
  List<Message> get assistantMessages {
    return messages.where((m) => m.isAssistant).toList();
  }

  /// Gets messages that are currently streaming
  List<Message> get streamingMessages {
    return messages.where((m) => m.isStreaming).toList();
  }

  /// Whether this chat has any streaming messages
  bool get hasStreamingMessages => streamingMessages.isNotEmpty;

  /// Gets a preview of the chat (first few words of the last message)
  String get preview {
    if (lastMessage == null) {
      return 'No messages yet';
    }

    final content = lastMessage!.content.trim();
    if (content.length <= 50) {
      return content;
    }

    return '${content.substring(0, 47)}...';
  }

  @override
  List<Object?> get props => [
    id,
    title,
    createdAt,
    updatedAt,
    workflowId,
    messages,
  ];

  @override
  String toString() =>
      'Chat(id: $id, title: $title, messageCount: $messageCount)';
}
