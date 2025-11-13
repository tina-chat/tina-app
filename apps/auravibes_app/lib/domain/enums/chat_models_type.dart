/// Enum representing the type of chat model.
enum ChatModelType {
  openai('openai'),
  anthropic('anthropic');

  final String value;

  /// Creates a new ChatModelType with the given string value
  const ChatModelType(this.value);

  /// Creates a ChatModelType from a string value
  ///
  /// Throws [ArgumentError] if the value is not a valid chat model type
  factory ChatModelType.fromString(String value) {
    switch (value.toLowerCase()) {
      case 'openai':
        return ChatModelType.openai;
      case 'anthropic':
        return ChatModelType.anthropic;
      default:
        throw ArgumentError('Invalid chat model type: $value');
    }
  }

  @override
  String toString() => value;
}
