import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default Typing Indicator', type: TinaTypingIndicator)
Widget defaultTypingIndicatorUseCase(BuildContext context) {
  return const Center(
    child: TinaTypingIndicator(),
  );
}

@widgetbook.UseCase(name: 'Small Typing Indicator', type: TinaTypingIndicator)
Widget smallTypingIndicatorUseCase(BuildContext context) {
  return const Center(
    child: TinaTypingIndicator(
      size: TinaTypingIndicatorSize.small,
    ),
  );
}

@widgetbook.UseCase(name: 'Medium Typing Indicator', type: TinaTypingIndicator)
Widget mediumTypingIndicatorUseCase(BuildContext context) {
  return const Center(
    child: TinaTypingIndicator(
      size: TinaTypingIndicatorSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Large Typing Indicator', type: TinaTypingIndicator)
Widget largeTypingIndicatorUseCase(BuildContext context) {
  return const Center(
    child: TinaTypingIndicator(
      size: TinaTypingIndicatorSize.large,
    ),
  );
}

@widgetbook.UseCase(name: 'All Sizes Comparison', type: TinaTypingIndicator)
Widget allSizesComparisonUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.small,
            ),
            SizedBox(width: 16),
            Text('Small'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
            ),
            SizedBox(width: 16),
            Text('Medium'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.large,
            ),
            SizedBox(width: 16),
            Text('Large'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors', type: TinaTypingIndicator)
Widget customColorsUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
              color: Colors.blue,
            ),
            SizedBox(width: 16),
            Text('Blue'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
              color: Colors.green,
            ),
            SizedBox(width: 16),
            Text('Green'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
              color: Colors.purple,
            ),
            SizedBox(width: 16),
            Text('Purple'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
              color: Colors.orange,
            ),
            SizedBox(width: 16),
            Text('Orange'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Without Container', type: TinaTypingIndicator)
Widget withoutContainerUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('With Container (Default):'),
        SizedBox(height: 16),
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.medium,
          showContainer: true,
        ),
        SizedBox(height: 32),
        Text('Without Container:'),
        SizedBox(height: 16),
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.medium,
          showContainer: false,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Animation Duration', type: TinaTypingIndicator)
Widget customAnimationDurationUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
              animationDuration: Duration(milliseconds: 300),
            ),
            SizedBox(width: 16),
            Text('Fast (300ms)'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
              animationDuration: Duration(milliseconds: 600),
            ),
            SizedBox(width: 16),
            Text('Normal (600ms)'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaTypingIndicator(
              size: TinaTypingIndicatorSize.medium,
              animationDuration: Duration(milliseconds: 1200),
            ),
            SizedBox(width: 16),
            Text('Slow (1200ms)'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Chat Interface Context', type: TinaTypingIndicator)
Widget chatInterfaceContextUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        // User message
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(left: 50, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16).copyWith(
                bottomRight: const Radius.circular(4),
              ),
            ),
            child: const Text(
              'Can you help me with Flutter development?',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // AI typing indicator
        const TinaTypingIndicator(
          size: TinaTypingIndicatorSize.medium,
          showContainer: true,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Multiple Typing Indicators', type: TinaTypingIndicator)
Widget multipleTypingIndicatorsUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Column(
      children: [
        // First typing indicator
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.small,
          showContainer: true,
        ),
        SizedBox(height: 16),
        // Second typing indicator
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.medium,
          showContainer: true,
          color: Colors.blue,
        ),
        SizedBox(height: 16),
        // Third typing indicator
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.large,
          showContainer: true,
          color: Colors.green,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Conversation Flow with Typing', type: TinaTypingIndicator)
Widget conversationFlowWithTypingUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        // User message 1
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(left: 50, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16).copyWith(
                bottomRight: const Radius.circular(4),
              ),
            ),
            child: const Text(
              'Hello!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 8),
        
        // AI response
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(right: 50, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16).copyWith(
                bottomLeft: const Radius.circular(4),
              ),
            ),
            child: const Text(
              'Hi there! How can I help you today?',
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(height: 8),
        
        // User message 2
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(left: 50, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16).copyWith(
                bottomRight: const Radius.circular(4),
              ),
            ),
            child: const Text(
              'I need help with state management in Flutter.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        
        // AI typing indicator
        const TinaTypingIndicator(
          size: TinaTypingIndicatorSize.medium,
          showContainer: true,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Minimal Dots Only', type: TinaTypingIndicator)
Widget minimalDotsOnlyUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Dots only (no container):'),
        SizedBox(height: 16),
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.small,
          showContainer: false,
        ),
        SizedBox(height: 24),
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.medium,
          showContainer: false,
        ),
        SizedBox(height: 24),
        TinaTypingIndicator(
          size: TinaTypingIndicatorSize.large,
          showContainer: false,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Dark Theme Context', type: TinaTypingIndicator)
Widget darkThemeContextUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.grey[900],
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            children: [
              Text(
                'Dark Theme Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TinaTypingIndicator(
                size: TinaTypingIndicatorSize.medium,
                color: Colors.white70,
                showContainer: false,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}