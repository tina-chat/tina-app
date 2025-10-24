enum MessagesTableType {
  text('text'),
  image('image'),
  toolCall('tool_call'),
  system('system');

  const MessagesTableType(this.value);
  final String value;
}

/// Enum representing the status of a message
enum MessageTableStatus {
  sending('sending'),
  sent('sent'),
  delivered('delivered'),
  read('read'),
  error('error');

  const MessageTableStatus(this.value);
  final String value;

  factory MessageTableStatus.fromString(String value) {
    switch (value.toLowerCase()) {
      case 'sending':
        return MessageTableStatus.sending;
      case 'sent':
        return MessageTableStatus.sent;
      case 'delivered':
        return MessageTableStatus.delivered;
      case 'read':
        return MessageTableStatus.read;
      case 'error':
        return MessageTableStatus.error;
      default:
        throw ArgumentError('Invalid message status: $value');
    }
  }
}
