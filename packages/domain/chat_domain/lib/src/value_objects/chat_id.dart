import 'package:equatable/equatable.dart';
import 'package:tina_core/tina_core.dart';

/// Unique identifier for a chat conversation.
class ChatId extends Equatable {
  const ChatId._(this.value);

  /// Creates a new ChatId with a generated UUID
  factory ChatId.generate() {
    return ChatId._(UuidGenerator.generate());
  }

  /// Creates a ChatId from an existing string value
  factory ChatId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('ChatId cannot be empty');
    }
    return ChatId._(value);
  }

  /// The string value of the chat ID
  final String value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;
}
