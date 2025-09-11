/// Represents the role of a message sender in a chat conversation.
enum MessageRole {
  /// Message sent by the user
  user('user'),

  /// Message sent by the AI assistant
  assistant('assistant'),

  /// System message for context or instructions
  system('system'),

  /// Tool execution result message
  tool('tool');

  const MessageRole(this.value);

  /// The string representation of the message role
  final String value;

  /// Creates a MessageRole from a string value
  static MessageRole fromString(String value) {
    return MessageRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => throw ArgumentError('Invalid message role: $value'),
    );
  }

  @override
  String toString() => value;
}
