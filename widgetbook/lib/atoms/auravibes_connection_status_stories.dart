import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Online Status', type: AuraConnectionStatus)
Widget onlineStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.online,
      size: AuraConnectionStatusSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Offline Status', type: AuraConnectionStatus)
Widget offlineStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.offline,
      size: AuraConnectionStatusSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Connecting Status', type: AuraConnectionStatus)
Widget connectingStatusUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.connecting,
      size: AuraConnectionStatusSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Online with Label', type: AuraConnectionStatus)
Widget onlineWithLabelUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.online,
      size: AuraConnectionStatusSize.medium,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Offline with Label', type: AuraConnectionStatus)
Widget offlineWithLabelUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.offline,
      size: AuraConnectionStatusSize.medium,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Connecting with Label', type: AuraConnectionStatus)
Widget connectingWithLabelUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.connecting,
      size: AuraConnectionStatusSize.medium,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Label - Connected',
  type: AuraConnectionStatus,
)
Widget customLabelConnectedUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.online,
      size: AuraConnectionStatusSize.medium,
      showLabel: true,
      customLabel: 'Connected to Server',
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Label - Disconnected',
  type: AuraConnectionStatus,
)
Widget customLabelDisconnectedUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.offline,
      size: AuraConnectionStatusSize.medium,
      showLabel: true,
      customLabel: 'No Internet Connection',
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Label - Reconnecting',
  type: AuraConnectionStatus,
)
Widget customLabelReconnectingUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.connecting,
      size: AuraConnectionStatusSize.medium,
      showLabel: true,
      customLabel: 'Reconnecting to AI...',
    ),
  );
}

@widgetbook.UseCase(name: 'Small Size', type: AuraConnectionStatus)
Widget smallSizeUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.online,
      size: AuraConnectionStatusSize.small,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Large Size', type: AuraConnectionStatus)
Widget largeSizeUseCase(BuildContext context) {
  return const Center(
    child: AuraConnectionStatus(
      status: AuraConnectionState.online,
      size: AuraConnectionStatusSize.large,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'All Sizes Comparison', type: AuraConnectionStatus)
Widget allSizesComparisonUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Small Size', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.online,
        size: AuraConnectionStatusSize.small,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Medium Size', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.online,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Large Size', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.online,
        size: AuraConnectionStatusSize.large,
        showLabel: true,
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Status States Comparison',
  type: AuraConnectionStatus,
)
Widget statusStatesComparisonUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Online Status', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.online,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Offline Status', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.offline,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Connecting Status', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.connecting,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Indicator Only Grid', type: AuraConnectionStatus)
Widget indicatorOnlyGridUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Connection Status Indicators (No Labels)',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 24),
      Table(
        defaultColumnWidth: const FixedColumnWidth(120),
        children: [
          const TableRow(
            children: [
              Center(
                child: Text(
                  'Size',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Online',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Offline',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Connecting',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Small')),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.online,
                  size: AuraConnectionStatusSize.small,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.offline,
                  size: AuraConnectionStatusSize.small,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.connecting,
                  size: AuraConnectionStatusSize.small,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Medium')),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.online,
                  size: AuraConnectionStatusSize.medium,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.offline,
                  size: AuraConnectionStatusSize.medium,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.connecting,
                  size: AuraConnectionStatusSize.medium,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Large')),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.online,
                  size: AuraConnectionStatusSize.large,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.offline,
                  size: AuraConnectionStatusSize.large,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.connecting,
                  size: AuraConnectionStatusSize.large,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'With Labels Grid', type: AuraConnectionStatus)
Widget withLabelsGridUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Connection Status with Labels',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 24),
      Table(
        defaultColumnWidth: const FixedColumnWidth(140),
        children: [
          const TableRow(
            children: [
              Center(
                child: Text(
                  'Size',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Online',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Offline',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Connecting',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Small')),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.online,
                  size: AuraConnectionStatusSize.small,
                  showLabel: true,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.offline,
                  size: AuraConnectionStatusSize.small,
                  showLabel: true,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.connecting,
                  size: AuraConnectionStatusSize.small,
                  showLabel: true,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Medium')),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.online,
                  size: AuraConnectionStatusSize.medium,
                  showLabel: true,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.offline,
                  size: AuraConnectionStatusSize.medium,
                  showLabel: true,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.connecting,
                  size: AuraConnectionStatusSize.medium,
                  showLabel: true,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Large')),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.online,
                  size: AuraConnectionStatusSize.large,
                  showLabel: true,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.offline,
                  size: AuraConnectionStatusSize.large,
                  showLabel: true,
                ),
              ),
              const Center(
                child: AuraConnectionStatus(
                  status: AuraConnectionState.connecting,
                  size: AuraConnectionStatusSize.large,
                  showLabel: true,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'In App Bar Context', type: AuraConnectionStatus)
Widget inAppBarContextUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Aura AI Assistant'),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: AuraConnectionStatus(
            status: AuraConnectionState.online,
            size: AuraConnectionStatusSize.small,
            showLabel: true,
            customLabel: 'AI Ready',
          ),
        ),
      ],
    ),
    body: const Center(child: Text('Connection status shown in app bar')),
  );
}

@widgetbook.UseCase(name: 'In Chat Context', type: AuraConnectionStatus)
Widget inChatContextUseCase(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chat_bubble_outline, size: 16),
              SizedBox(width: 8),
              Text('Chat Status:'),
              SizedBox(width: 8),
              AuraConnectionStatus(
                status: AuraConnectionState.connecting,
                size: AuraConnectionStatusSize.small,
                showLabel: true,
                customLabel: 'Connecting to AI...',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Expanded(
          child: Center(child: Text('Chat messages would appear here')),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Status Transitions Demo', type: AuraConnectionStatus)
Widget statusTransitionsDemoUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Status Transitions',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      SizedBox(height: 24),
      Text('1. Starting connection:'),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.connecting,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Initializing...',
      ),
      SizedBox(height: 24),
      Text('2. Successfully connected:'),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.online,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Connected',
      ),
      SizedBox(height: 24),
      Text('3. Connection lost:'),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.offline,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Connection Lost',
      ),
      SizedBox(height: 24),
      Text('4. Attempting to reconnect:'),
      SizedBox(height: 8),
      AuraConnectionStatus(
        status: AuraConnectionState.connecting,
        size: AuraConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Reconnecting...',
      ),
    ],
  );
}
