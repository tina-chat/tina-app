import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User Text Message', type: TinaMessageBubble)
Widget userTextMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const TinaMessageBubble(
      content: 'Hello! How can you help me with my Flutter project today?',
      isUser: true,
      status: TinaMessageDeliveryStatus.sent,
      contentType: TinaMessageContentType.text,
    ),
  );
}

@widgetbook.UseCase(name: 'AI Text Message', type: TinaMessageBubble)
Widget aiTextMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const TinaMessageBubble(
      content:
          'I\'d be happy to help you with your Flutter project! What specific area would you like assistance with?',
      isUser: false,
      status: TinaMessageDeliveryStatus.delivered,
      contentType: TinaMessageContentType.text,
    ),
  );
}

@widgetbook.UseCase(
  name: 'User Message with Timestamp',
  type: TinaMessageBubble,
)
Widget userMessageWithTimestampUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: TinaMessageBubble(
      content: 'Can you review this code snippet for me?',
      isUser: true,
      status: TinaMessageDeliveryStatus.read,
      contentType: TinaMessageContentType.text,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  );
}

@widgetbook.UseCase(name: 'AI Message with Timestamp', type: TinaMessageBubble)
Widget aiMessageWithTimestampUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: TinaMessageBubble(
      content:
          'Of course! Please share the code snippet and I\'ll provide feedback on best practices, potential improvements, and any issues I notice.',
      isUser: false,
      status: TinaMessageDeliveryStatus.delivered,
      contentType: TinaMessageContentType.text,
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
  );
}

@widgetbook.UseCase(name: 'Message Status States', type: TinaMessageBubble)
Widget messageStatusStatesUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const TinaMessageBubble(
          content: 'Sending message...',
          isUser: true,
          status: TinaMessageDeliveryStatus.sending,
          contentType: TinaMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const TinaMessageBubble(
          content: 'Message sent successfully',
          isUser: true,
          status: TinaMessageDeliveryStatus.sent,
          contentType: TinaMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const TinaMessageBubble(
          content: 'Message delivered to recipient',
          isUser: true,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const TinaMessageBubble(
          content: 'Message read by recipient',
          isUser: true,
          status: TinaMessageDeliveryStatus.read,
          contentType: TinaMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const TinaMessageBubble(
          content: 'Failed to send message',
          isUser: true,
          status: TinaMessageDeliveryStatus.error,
          contentType: TinaMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Image Message', type: TinaMessageBubble)
Widget imageMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        TinaMessageBubble(
          content: 'https://picsum.photos/300/200',
          isUser: true,
          status: TinaMessageDeliveryStatus.sent,
          contentType: TinaMessageContentType.image,
        ),
        SizedBox(height: 16),
        TinaMessageBubble(
          content:
              'That\'s a beautiful image! What would you like to know about it?',
          isUser: false,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'File Attachment Message', type: TinaMessageBubble)
Widget fileAttachmentMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        TinaMessageBubble(
          content: 'project_requirements.pdf',
          isUser: true,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.file,
        ),
        SizedBox(height: 16),
        TinaMessageBubble(
          content:
              'I\'ve received your project requirements document. Let me review it and provide feedback.',
          isUser: false,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Long Message Content', type: TinaMessageBubble)
Widget longMessageContentUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        TinaMessageBubble(
          content:
              'I need help with implementing a complex state management solution in Flutter. I\'m working on a large-scale application that needs to handle multiple data sources, real-time updates, and complex user interactions. What would be the best approach?',
          isUser: true,
          status: TinaMessageDeliveryStatus.read,
          contentType: TinaMessageContentType.text,
        ),
        SizedBox(height: 16),
        TinaMessageBubble(
          content:
              'For a large-scale Flutter application with complex state management needs, I\'d recommend considering the following approaches:\n\n1. **BLoC Pattern**: Excellent for complex business logic and testing\n2. **Riverpod**: Great for dependency injection and reactive programming\n3. **Redux**: If you need predictable state updates\n4. **GetX**: For rapid development with less boilerplate\n\nThe choice depends on your team\'s experience, project requirements, and long-term maintenance considerations. Would you like me to elaborate on any of these options?',
          isUser: false,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Conversation Flow', type: TinaMessageBubble)
Widget conversationFlowUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        TinaMessageBubble(
          content: 'Hi there! 👋',
          isUser: true,
          status: TinaMessageDeliveryStatus.read,
          contentType: TinaMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        const SizedBox(height: 8),
        TinaMessageBubble(
          content:
              'Hello! I\'m Tina, your AI assistant. How can I help you today?',
          isUser: false,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 9)),
        ),
        const SizedBox(height: 8),
        TinaMessageBubble(
          content: 'I\'m working on a Flutter app and need some guidance.',
          isUser: true,
          status: TinaMessageDeliveryStatus.read,
          contentType: TinaMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
        ),
        const SizedBox(height: 8),
        TinaMessageBubble(
          content:
              'Perfect! I\'d love to help with your Flutter development. What specific aspect are you working on?',
          isUser: false,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 7)),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Error Message Handling', type: TinaMessageBubble)
Widget errorMessageHandlingUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        TinaMessageBubble(
          content: 'This message failed to send due to network issues.',
          isUser: true,
          status: TinaMessageDeliveryStatus.error,
          contentType: TinaMessageContentType.text,
        ),
        SizedBox(height: 16),
        TinaMessageBubble(
          content: 'invalid-image-url',
          isUser: true,
          status: TinaMessageDeliveryStatus.error,
          contentType: TinaMessageContentType.image,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Width Messages', type: TinaMessageBubble)
Widget customWidthMessagesUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        TinaMessageBubble(
          content: 'Short message',
          isUser: true,
          status: TinaMessageDeliveryStatus.sent,
          contentType: TinaMessageContentType.text,
          maxWidth: 200,
        ),
        SizedBox(height: 16),
        TinaMessageBubble(
          content:
              'This is a longer message with custom max width that demonstrates how the bubble adapts to different width constraints.',
          isUser: false,
          status: TinaMessageDeliveryStatus.delivered,
          contentType: TinaMessageContentType.text,
          maxWidth: 300,
        ),
      ],
    ),
  );
}
