import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Sending Status', type: AuraMessageStatus)
Widget sendingStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraMessageStatus(
      status: AuraMessageDeliveryStatus.sending,
      size: AuraMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Sent Status', type: AuraMessageStatus)
Widget sentStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraMessageStatus(
      status: AuraMessageDeliveryStatus.sent,
      size: AuraMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Delivered Status', type: AuraMessageStatus)
Widget deliveredStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraMessageStatus(
      status: AuraMessageDeliveryStatus.delivered,
      size: AuraMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Read Status', type: AuraMessageStatus)
Widget readStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraMessageStatus(
      status: AuraMessageDeliveryStatus.read,
      size: AuraMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Error Status', type: AuraMessageStatus)
Widget errorStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraMessageStatus(
      status: AuraMessageDeliveryStatus.error,
      size: AuraMessageStatusSize.medium,
      showAnimation: true,
    ),
  );
}

@widgetbook.UseCase(name: 'All Status States', type: AuraMessageStatus)
Widget allStatusStatesUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.sending,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.sent,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.delivered,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.read,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.error,
              size: AuraMessageStatusSize.medium,
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

@widgetbook.UseCase(name: 'Size Variants', type: AuraMessageStatus)
Widget sizeVariantsUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.delivered,
              size: AuraMessageStatusSize.small,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.delivered,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.delivered,
              size: AuraMessageStatusSize.large,
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

@widgetbook.UseCase(name: 'Custom Colors', type: AuraMessageStatus)
Widget customColorsUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.sent,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.delivered,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.read,
              size: AuraMessageStatusSize.medium,
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

@widgetbook.UseCase(name: 'Without Animation', type: AuraMessageStatus)
Widget withoutAnimationUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.sending,
              size: AuraMessageStatusSize.medium,
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
            AuraMessageStatus(
              status: AuraMessageDeliveryStatus.delivered,
              size: AuraMessageStatusSize.medium,
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

@widgetbook.UseCase(name: 'Message Timeline', type: AuraMessageStatus)
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              AuraMessageStatus(
                status: AuraMessageDeliveryStatus.sending,
                size: AuraMessageStatusSize.small,
                showAnimation: true,
              ),
              SizedBox(width: 8),
              Text('Message is being sent...'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              AuraMessageStatus(
                status: AuraMessageDeliveryStatus.sent,
                size: AuraMessageStatusSize.small,
                showAnimation: true,
              ),
              SizedBox(width: 8),
              Text('Message sent successfully'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              AuraMessageStatus(
                status: AuraMessageDeliveryStatus.delivered,
                size: AuraMessageStatusSize.small,
                showAnimation: true,
              ),
              SizedBox(width: 8),
              Text('Message delivered to recipient'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              AuraMessageStatus(
                status: AuraMessageDeliveryStatus.read,
                size: AuraMessageStatusSize.small,
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

@widgetbook.UseCase(name: 'Chat Interface Context', type: AuraMessageStatus)
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
                    borderRadius: BorderRadius.circular(
                      16,
                    ).copyWith(bottomRight: const Radius.circular(4)),
                  ),
                  child: const Text(
                    'Hey! How are you doing?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                const AuraMessageStatus(
                  status: AuraMessageDeliveryStatus.read,
                  size: AuraMessageStatusSize.small,
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
                    borderRadius: BorderRadius.circular(
                      16,
                    ).copyWith(bottomRight: const Radius.circular(4)),
                  ),
                  child: const Text(
                    'This message is still sending...',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                const AuraMessageStatus(
                  status: AuraMessageDeliveryStatus.sending,
                  size: AuraMessageStatusSize.small,
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
