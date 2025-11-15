enum MessageType {
  text('text'),
  image('image'),
  toolCall('tool_call'),
  system('system')
  ;

  const MessageType(this.value);

  factory MessageType.fromString(String value) {
    switch (value.toLowerCase()) {
      case 'text':
        return MessageType.text;
      case 'image':
        return MessageType.image;
      case 'tool_call':
        return MessageType.toolCall;
      case 'system':
        return MessageType.system;
      default:
        throw ArgumentError('Invalid message type: $value');
    }
  }
  final String value;

  String get displayName {
    switch (this) {
      case MessageType.text:
        return 'Text';
      case MessageType.image:
        return 'Image';
      case MessageType.toolCall:
        return 'Tool Call';
      case MessageType.system:
        return 'System';
    }
  }
}

/// Enum representing the status of a message
enum MessageStatus {
  sending('sending'),
  streaming('streaming'),
  sent('sent'),
  delivered('delivered'),
  error('error')
  ;

  const MessageStatus(this.value);

  factory MessageStatus.fromString(String value) {
    switch (value.toLowerCase()) {
      case 'sending':
        return MessageStatus.sending;
      case 'sent':
        return MessageStatus.sent;
      case 'delivered':
        return MessageStatus.delivered;
      case 'error':
        return MessageStatus.error;
      case 'streaming':
        return MessageStatus.streaming;
      default:
        throw ArgumentError('Invalid message status: $value');
    }
  }
  final String value;

  String get displayName {
    switch (this) {
      case MessageStatus.sending:
        return 'Sending';
      case MessageStatus.sent:
        return 'Sent';
      case MessageStatus.delivered:
        return 'Delivered';
      case MessageStatus.error:
        return 'Error';

      case MessageStatus.streaming:
        return 'Streaming';
    }
  }
}
