import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User Text Message', type: AuraMessageBubble)
Widget userTextMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const AuraMessageBubble(
      content: 'Hello! How can you help me with my Flutter project today?',
      isUser: true,
      status: AuraMessageDeliveryStatus.sent,
      contentType: AuraMessageContentType.text,
    ),
  );
}

@widgetbook.UseCase(name: 'AI Text Message', type: AuraMessageBubble)
Widget aiTextMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const AuraMessageBubble(
      content:
          'I\'d be happy to help you with your Flutter project! What specific area would you like assistance with?',
      isUser: false,
      status: AuraMessageDeliveryStatus.delivered,
      contentType: AuraMessageContentType.text,
    ),
  );
}

@widgetbook.UseCase(
  name: 'User Message with Timestamp',
  type: AuraMessageBubble,
)
Widget userMessageWithTimestampUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: AuraMessageBubble(
      content: 'Can you review this code snippet for me?',
      isUser: true,
      status: AuraMessageDeliveryStatus.read,
      contentType: AuraMessageContentType.text,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  );
}

@widgetbook.UseCase(name: 'AI Message with Timestamp', type: AuraMessageBubble)
Widget aiMessageWithTimestampUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: AuraMessageBubble(
      content:
          'Of course! Please share the code snippet and I\'ll provide feedback on best practices, potential improvements, and any issues I notice.',
      isUser: false,
      status: AuraMessageDeliveryStatus.delivered,
      contentType: AuraMessageContentType.text,
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
  );
}

@widgetbook.UseCase(name: 'Message Status States', type: AuraMessageBubble)
Widget messageStatusStatesUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AuraMessageBubble(
          content: 'Sending message...',
          isUser: true,
          status: AuraMessageDeliveryStatus.sending,
          contentType: AuraMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const AuraMessageBubble(
          content: 'Message sent successfully',
          isUser: true,
          status: AuraMessageDeliveryStatus.sent,
          contentType: AuraMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const AuraMessageBubble(
          content: 'Message delivered to recipient',
          isUser: true,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const AuraMessageBubble(
          content: 'Message read by recipient',
          isUser: true,
          status: AuraMessageDeliveryStatus.read,
          contentType: AuraMessageContentType.text,
        ),
        const SizedBox(height: 8),
        const AuraMessageBubble(
          content: 'Failed to send message',
          isUser: true,
          status: AuraMessageDeliveryStatus.error,
          contentType: AuraMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Image Message', type: AuraMessageBubble)
Widget imageMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        AuraMessageBubble(
          content: 'https://picsum.photos/300/200',
          isUser: true,
          status: AuraMessageDeliveryStatus.sent,
          contentType: AuraMessageContentType.image,
        ),
        SizedBox(height: 16),
        AuraMessageBubble(
          content:
              'That\'s a beautiful image! What would you like to know about it?',
          isUser: false,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'File Attachment Message', type: AuraMessageBubble)
Widget fileAttachmentMessageUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        AuraMessageBubble(
          content: 'project_requirements.pdf',
          isUser: true,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.file,
        ),
        SizedBox(height: 16),
        AuraMessageBubble(
          content:
              'I\'ve received your project requirements document. Let me review it and provide feedback.',
          isUser: false,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Long Message Content', type: AuraMessageBubble)
Widget longMessageContentUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        AuraMessageBubble(
          content:
              'I need help with implementing a complex state management solution in Flutter. I\'m working on a large-scale application that needs to handle multiple data sources, real-time updates, and complex user interactions. What would be the best approach?',
          isUser: true,
          status: AuraMessageDeliveryStatus.read,
          contentType: AuraMessageContentType.text,
        ),
        SizedBox(height: 16),
        AuraMessageBubble(
          content:
              'For a large-scale Flutter application with complex state management needs, I\'d recommend considering the following approaches:\n\n1. **BLoC Pattern**: Excellent for complex business logic and testing\n2. **Riverpod**: Great for dependency injection and reactive programming\n3. **Redux**: If you need predictable state updates\n4. **GetX**: For rapid development with less boilerplate\n\nThe choice depends on your team\'s experience, project requirements, and long-term maintenance considerations. Would you like me to elaborate on any of these options?',
          isUser: false,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.text,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Conversation Flow', type: AuraMessageBubble)
Widget conversationFlowUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        AuraMessageBubble(
          content: 'Hi there! 👋',
          isUser: true,
          status: AuraMessageDeliveryStatus.read,
          contentType: AuraMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        const SizedBox(height: 8),
        AuraMessageBubble(
          content:
              'Hello! I\'m Aura, your AI assistant. How can I help you today?',
          isUser: false,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 9)),
        ),
        const SizedBox(height: 8),
        AuraMessageBubble(
          content: 'I\'m working on a Flutter app and need some guidance.',
          isUser: true,
          status: AuraMessageDeliveryStatus.read,
          contentType: AuraMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
        ),
        const SizedBox(height: 8),
        AuraMessageBubble(
          content:
              'Perfect! I\'d love to help with your Flutter development. What specific aspect are you working on?',
          isUser: false,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 7)),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Error Message Handling', type: AuraMessageBubble)
Widget errorMessageHandlingUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        AuraMessageBubble(
          content: 'This message failed to send due to network issues.',
          isUser: true,
          status: AuraMessageDeliveryStatus.error,
          contentType: AuraMessageContentType.text,
        ),
        SizedBox(height: 16),
        AuraMessageBubble(
          content: 'invalid-image-url',
          isUser: true,
          status: AuraMessageDeliveryStatus.error,
          contentType: AuraMessageContentType.image,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Width Messages', type: AuraMessageBubble)
Widget customWidthMessagesUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        AuraMessageBubble(
          content: 'Short message',
          isUser: true,
          status: AuraMessageDeliveryStatus.sent,
          contentType: AuraMessageContentType.text,
          maxWidth: 200,
        ),
        SizedBox(height: 16),
        AuraMessageBubble(
          content:
              'This is a longer message with custom max width that demonstrates how the bubble adapts to different width constraints.',
          isUser: false,
          status: AuraMessageDeliveryStatus.delivered,
          contentType: AuraMessageContentType.text,
          maxWidth: 300,
        ),
      ],
    ),
  );
}
