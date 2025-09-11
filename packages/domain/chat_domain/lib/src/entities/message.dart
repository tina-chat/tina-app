import 'package:equatable/equatable.dart';
import '../value_objects/message_id.dart';
import '../value_objects/chat_id.dart';
import '../value_objects/message_role.dart';
import '../value_objects/message_status.dart';

/// Represents a message within a chat conversation.
class Message extends Equatable {
  const Message._({
    required this.id,
    required this.chatId,
    required this.role,
    required this.content,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.toolTraceJson,
    this.backendId,
    this.backendType,
    this.backendParamsJson,
  });

  /// Creates a new user message
  factory Message.createUser({
    required ChatId chatId,
    required String content,
    MessageId? id,
    DateTime? createdAt,
  }) {
    return Message._(
      id: id ?? MessageId.generate(),
      chatId: chatId,
      role: MessageRole.user,
      content: content,
      status: MessageStatus.pending,
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  /// Creates a new assistant message
  factory Message.createAssistant({
    required ChatId chatId,
    required String content,
    MessageId? id,
    DateTime? createdAt,
    String? backendId,
    String? backendType,
    String? backendParamsJson,
  }) {
    return Message._(
      id: id ?? MessageId.generate(),
      chatId: chatId,
      role: MessageRole.assistant,
      content: content,
      status: MessageStatus.streaming,
      createdAt: createdAt ?? DateTime.now(),
      backendId: backendId,
      backendType: backendType,
      backendParamsJson: backendParamsJson,
    );
  }

  /// Creates a system message
  factory Message.createSystem({
    required ChatId chatId,
    required String content,
    MessageId? id,
    DateTime? createdAt,
  }) {
    return Message._(
      id: id ?? MessageId.generate(),
      chatId: chatId,
      role: MessageRole.system,
      content: content,
      status: MessageStatus.sent,
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  /// Creates a tool message
  factory Message.createTool({
    required ChatId chatId,
    required String content,
    required String toolTraceJson,
    MessageId? id,
    DateTime? createdAt,
  }) {
    return Message._(
      id: id ?? MessageId.generate(),
      chatId: chatId,
      role: MessageRole.tool,
      content: content,
      status: MessageStatus.sent,
      createdAt: createdAt ?? DateTime.now(),
      toolTraceJson: toolTraceJson,
    );
  }

  /// Unique identifier for this message
  final MessageId id;

  /// ID of the chat this message belongs to
  final ChatId chatId;

  /// Role of the message sender
  final MessageRole role;

  /// Content of the message
  final String content;

  /// Current status of the message
  final MessageStatus status;

  /// When the message was created
  final DateTime createdAt;

  /// When the message was last updated
  final DateTime? updatedAt;

  /// JSON trace of tool execution (if applicable)
  final String? toolTraceJson;

  /// ID of the backend that generated this message
  final String? backendId;

  /// Type of the backend (llm, orchestrator, mcp)
  final String? backendType;

  /// JSON parameters used for backend configuration
  final String? backendParamsJson;

  /// Updates the message content (for streaming messages)
  Message updateContent(String newContent) {
    return Message._(
      id: id,
      chatId: chatId,
      role: role,
      content: newContent,
      status: status,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      toolTraceJson: toolTraceJson,
      backendId: backendId,
      backendType: backendType,
      backendParamsJson: backendParamsJson,
    );
  }

  /// Updates the message status
  Message updateStatus(MessageStatus newStatus) {
    return Message._(
      id: id,
      chatId: chatId,
      role: role,
      content: content,
      status: newStatus,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      toolTraceJson: toolTraceJson,
      backendId: backendId,
      backendType: backendType,
      backendParamsJson: backendParamsJson,
    );
  }

  /// Marks the message as completed
  Message markAsCompleted() {
    return updateStatus(MessageStatus.sent);
  }

  /// Marks the message as failed
  Message markAsFailed() {
    return updateStatus(MessageStatus.failed);
  }

  /// Marks the message as cancelled
  Message markAsCancelled() {
    return updateStatus(MessageStatus.cancelled);
  }

  /// Whether this message is from a user
  bool get isUser => role == MessageRole.user;

  /// Whether this message is from an assistant
  bool get isAssistant => role == MessageRole.assistant;

  /// Whether this message is a system message
  bool get isSystem => role == MessageRole.system;

  /// Whether this message is a tool message
  bool get isTool => role == MessageRole.tool;

  /// Whether this message is currently being streamed
  bool get isStreaming => status == MessageStatus.streaming;

  /// Whether this message has been sent successfully
  bool get isSent => status == MessageStatus.sent;

  /// Whether this message failed to send
  bool get isFailed => status == MessageStatus.failed;

  /// Whether this message is pending
  bool get isPending => status == MessageStatus.pending;

  @override
  List<Object?> get props => [
    id,
    chatId,
    role,
    content,
    status,
    createdAt,
    updatedAt,
    toolTraceJson,
    backendId,
    backendType,
    backendParamsJson,
  ];

  @override
  String toString() => 'Message(id: $id, role: $role, status: $status)';
}
