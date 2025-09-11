import 'package:equatable/equatable.dart';
import '../entities/message.dart';
import '../value_objects/message_id.dart';
import '../value_objects/chat_id.dart';

/// Base class for all message-related domain events
abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

/// Event fired when a new message is sent
class MessageSent extends MessageEvent {
  const MessageSent({required this.message, required this.timestamp});

  final Message message;
  final DateTime timestamp;

  @override
  List<Object?> get props => [message, timestamp];

  @override
  String toString() =>
      'MessageSent(messageId: ${message.id}, chatId: ${message.chatId})';
}

/// Event fired when a message is updated (e.g., during streaming)
class MessageUpdated extends MessageEvent {
  const MessageUpdated({required this.message, required this.timestamp});

  final Message message;
  final DateTime timestamp;

  @override
  List<Object?> get props => [message, timestamp];

  @override
  String toString() =>
      'MessageUpdated(messageId: ${message.id}, status: ${message.status})';
}

/// Event fired when a message is deleted
class MessageDeleted extends MessageEvent {
  const MessageDeleted({
    required this.messageId,
    required this.chatId,
    required this.timestamp,
  });

  final MessageId messageId;
  final ChatId chatId;
  final DateTime timestamp;

  @override
  List<Object?> get props => [messageId, chatId, timestamp];

  @override
  String toString() => 'MessageDeleted(messageId: $messageId, chatId: $chatId)';
}

/// Event fired when a message streaming starts
class MessageStreamingStarted extends MessageEvent {
  const MessageStreamingStarted({
    required this.message,
    required this.timestamp,
  });

  final Message message;
  final DateTime timestamp;

  @override
  List<Object?> get props => [message, timestamp];

  @override
  String toString() => 'MessageStreamingStarted(messageId: ${message.id})';
}

/// Event fired when a message streaming completes
class MessageStreamingCompleted extends MessageEvent {
  const MessageStreamingCompleted({
    required this.message,
    required this.timestamp,
  });

  final Message message;
  final DateTime timestamp;

  @override
  List<Object?> get props => [message, timestamp];

  @override
  String toString() => 'MessageStreamingCompleted(messageId: ${message.id})';
}

/// Event fired when a message streaming fails
class MessageStreamingFailed extends MessageEvent {
  const MessageStreamingFailed({
    required this.messageId,
    required this.chatId,
    required this.error,
    required this.timestamp,
  });

  final MessageId messageId;
  final ChatId chatId;
  final String error;
  final DateTime timestamp;

  @override
  List<Object?> get props => [messageId, chatId, error, timestamp];

  @override
  String toString() =>
      'MessageStreamingFailed(messageId: $messageId, error: $error)';
}
