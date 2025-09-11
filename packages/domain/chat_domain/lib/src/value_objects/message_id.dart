import 'package:equatable/equatable.dart';
import 'package:tina_core/tina_core.dart';

/// Unique identifier for a message within a chat.
class MessageId extends Equatable {
  const MessageId._(this.value);

  /// Creates a new MessageId with a generated UUID
  factory MessageId.generate() {
    return MessageId._(UuidGenerator.generate());
  }

  /// Creates a MessageId from an existing string value
  factory MessageId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('MessageId cannot be empty');
    }
    return MessageId._(value);
  }

  /// The string value of the message ID
  final String value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;
}
