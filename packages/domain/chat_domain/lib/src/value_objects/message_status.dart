/// Represents the status of a message in the chat system.
enum MessageStatus {
  /// Message is being composed or sent
  pending('pending'),

  /// Message has been successfully sent and stored
  sent('sent'),

  /// Message is currently being streamed (for AI responses)
  streaming('streaming'),

  /// Message sending failed
  failed('failed'),

  /// Message was cancelled during sending/streaming
  cancelled('cancelled');

  const MessageStatus(this.value);

  /// The string representation of the message status
  final String value;

  /// Creates a MessageStatus from a string value
  static MessageStatus fromString(String value) {
    return MessageStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => throw ArgumentError('Invalid message status: $value'),
    );
  }

  @override
  String toString() => value;
}
