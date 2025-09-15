import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Sending Status', type: TinaMessageStatus)
Widget sendingStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaMessageStatus(
      status: TinaMessageDeliveryStatus.sending,
      size: TinaMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Sent Status', type: TinaMessageStatus)
Widget sentStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaMessageStatus(
      status: TinaMessageDeliveryStatus.sent,
      size: TinaMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Delivered Status', type: TinaMessageStatus)
Widget deliveredStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaMessageStatus(
      status: TinaMessageDeliveryStatus.delivered,
      size: TinaMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Read Status', type: TinaMessageStatus)
Widget readStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaMessageStatus(
      status: TinaMessageDeliveryStatus.read,
      size: TinaMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Error Status', type: TinaMessageStatus)
Widget errorStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaMessageStatus(
      status: TinaMessageDeliveryStatus.error,
      size: TinaMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'All Status States', type: TinaMessageStatus)
Widget allStatusStatesUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sending,
              size: TinaMessageStatusSize.medium,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Sending'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              size: TinaMessageStatusSize.medium,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Sent'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.delivered,
              size: TinaMessageStatusSize.medium,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Delivered'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.read,
              size: TinaMessageStatusSize.medium,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Read'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.error,
              size: TinaMessageStatusSize.medium,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Error'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Size Variants', type: TinaMessageStatus)
Widget sizeVariantsUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.delivered,
              size: TinaMessageStatusSize.small,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Small'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.delivered,
              size: TinaMessageStatusSize.medium,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Medium'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.delivered,
              size: TinaMessageStatusSize.large,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Large'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors', type: TinaMessageStatus)
Widget customColorsUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sent,
              size: TinaMessageStatusSize.medium,
              color: Colors.purple,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Purple'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.delivered,
              size: TinaMessageStatusSize.medium,
              color: Colors.orange,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Orange'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.read,
              size: TinaMessageStatusSize.medium,
              color: Colors.teal,
              showAnimation: true,
            ),
            SizedBox(width: 16),
            Text('Teal'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Without Animation', type: TinaMessageStatus)
Widget withoutAnimationUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.sending,
              size: TinaMessageStatusSize.medium,
              showAnimation: false,
            ),
            SizedBox(width: 16),
            Text('Sending (No Animation)'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaMessageStatus(
              status: TinaMessageDeliveryStatus.delivered,
              size: TinaMessageStatusSize.medium,
              showAnimation: false,
            ),
            SizedBox(width: 16),
            Text('Delivered (No Animation)'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Message Timeline', type: TinaMessageStatus)
Widget messageTimelineUseCase(BuildContext context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(24),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message Status Timeline',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              TinaMessageStatus(
                status: TinaMessageDeliveryStatus.sending,
                size: TinaMessageStatusSize.small,
                showAnimation: true,
              ),
              SizedBox(width: 8),
              Text('Message is being sent...'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              TinaMessageStatus(
                status: TinaMessageDeliveryStatus.sent,
                size: TinaMessageStatusSize.small,
                showAnimation: true,
              ),
              SizedBox(width: 8),
              Text('Message sent successfully'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              TinaMessageStatus(
                status: TinaMessageDeliveryStatus.delivered,
                size: TinaMessageStatusSize.small,
                showAnimation: true,
              ),
              SizedBox(width: 8),
              Text('Message delivered to recipient'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              TinaMessageStatus(
                status: TinaMessageDeliveryStatus.read,
                size: TinaMessageStatusSize.small,
                showAnimation: true,
              ),
              SizedBox(width: 8),
              Text('Message read by recipient'),
            ],
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Chat Interface Context', type: TinaMessageStatus)
Widget chatInterfaceContextUseCase(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        // Simulated message bubble with status
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(left: 50, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16).copyWith(
                      bottomRight: const Radius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Hey! How are you doing?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                const TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.read,
                  size: TinaMessageStatusSize.small,
                  showAnimation: true,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Another message with different status
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(left: 50, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16).copyWith(
                      bottomRight: const Radius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'This message is still sending...',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                const TinaMessageStatus(
                  status: TinaMessageDeliveryStatus.sending,
                  size: TinaMessageStatusSize.small,
                  showAnimation: true,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}