import 'package:equatable/equatable.dart';
import '../entities/chat.dart';
import '../value_objects/chat_id.dart';

/// Base class for all chat-related domain events
abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

/// Event fired when a new chat is created
class ChatCreated extends ChatEvent {
  const ChatCreated({required this.chat, required this.timestamp});

  final Chat chat;
  final DateTime timestamp;

  @override
  List<Object?> get props => [chat, timestamp];

  @override
  String toString() => 'ChatCreated(chatId: ${chat.id}, timestamp: $timestamp)';
}

/// Event fired when a chat is updated
class ChatUpdated extends ChatEvent {
  const ChatUpdated({required this.chat, required this.timestamp});

  final Chat chat;
  final DateTime timestamp;

  @override
  List<Object?> get props => [chat, timestamp];

  @override
  String toString() => 'ChatUpdated(chatId: ${chat.id}, timestamp: $timestamp)';
}

/// Event fired when a chat is deleted
class ChatDeleted extends ChatEvent {
  const ChatDeleted({required this.chatId, required this.timestamp});

  final ChatId chatId;
  final DateTime timestamp;

  @override
  List<Object?> get props => [chatId, timestamp];

  @override
  String toString() => 'ChatDeleted(chatId: $chatId, timestamp: $timestamp)';
}

/// Event fired when a chat title is updated
class ChatTitleUpdated extends ChatEvent {
  const ChatTitleUpdated({
    required this.chatId,
    required this.oldTitle,
    required this.newTitle,
    required this.timestamp,
  });

  final ChatId chatId;
  final String oldTitle;
  final String newTitle;
  final DateTime timestamp;

  @override
  List<Object?> get props => [chatId, oldTitle, newTitle, timestamp];

  @override
  String toString() =>
      'ChatTitleUpdated(chatId: $chatId, oldTitle: $oldTitle, newTitle: $newTitle)';
}
