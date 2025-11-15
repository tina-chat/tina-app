enum MessagesTableType {
  text('text'),
  image('image'),
  toolCall('tool_call'),
  system('system')
  ;

  const MessagesTableType(this.value);
  final String value;
}

/// Enum representing the status of a message
enum MessageTableStatus {
  sending('sending'),
  sent('sent'),
  streaming('streaming'),
  delivered('delivered'),
  error('error')
  ;

  const MessageTableStatus(this.value);

  factory MessageTableStatus.fromString(String value) {
    switch (value.toLowerCase()) {
      case 'sending':
        return MessageTableStatus.sending;
      case 'sent':
        return MessageTableStatus.sent;
      case 'delivered':
        return MessageTableStatus.delivered;
      case 'error':
        return MessageTableStatus.error;
      case 'streaming':
        return MessageTableStatus.streaming;
      default:
        throw ArgumentError('Invalid message status: $value');
    }
  }
  final String value;
}
