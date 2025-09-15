import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Online Status', type: TinaConnectionStatus)
Widget onlineStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.online,
      size: TinaConnectionStatusSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Offline Status', type: TinaConnectionStatus)
Widget offlineStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.offline,
      size: TinaConnectionStatusSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Connecting Status', type: TinaConnectionStatus)
Widget connectingStatusUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.connecting,
      size: TinaConnectionStatusSize.medium,
    ),
  );
}

@widgetbook.UseCase(name: 'Online with Label', type: TinaConnectionStatus)
Widget onlineWithLabelUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.online,
      size: TinaConnectionStatusSize.medium,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Offline with Label', type: TinaConnectionStatus)
Widget offlineWithLabelUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.offline,
      size: TinaConnectionStatusSize.medium,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Connecting with Label', type: TinaConnectionStatus)
Widget connectingWithLabelUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.connecting,
      size: TinaConnectionStatusSize.medium,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Label - Connected', type: TinaConnectionStatus)
Widget customLabelConnectedUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.online,
      size: TinaConnectionStatusSize.medium,
      showLabel: true,
      customLabel: 'Connected to Server',
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Label - Disconnected', type: TinaConnectionStatus)
Widget customLabelDisconnectedUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.offline,
      size: TinaConnectionStatusSize.medium,
      showLabel: true,
      customLabel: 'No Internet Connection',
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Label - Reconnecting', type: TinaConnectionStatus)
Widget customLabelReconnectingUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.connecting,
      size: TinaConnectionStatusSize.medium,
      showLabel: true,
      customLabel: 'Reconnecting to AI...',
    ),
  );
}

@widgetbook.UseCase(name: 'Small Size', type: TinaConnectionStatus)
Widget smallSizeUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.online,
      size: TinaConnectionStatusSize.small,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Large Size', type: TinaConnectionStatus)
Widget largeSizeUseCase(BuildContext context) {
  return const Center(
    child: TinaConnectionStatus(
      status: TinaConnectionState.online,
      size: TinaConnectionStatusSize.large,
      showLabel: true,
    ),
  );
}

@widgetbook.UseCase(name: 'All Sizes Comparison', type: TinaConnectionStatus)
Widget allSizesComparisonUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Small Size', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.online,
        size: TinaConnectionStatusSize.small,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Medium Size', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.online,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Large Size', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.online,
        size: TinaConnectionStatusSize.large,
        showLabel: true,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Status States Comparison', type: TinaConnectionStatus)
Widget statusStatesComparisonUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Online Status', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.online,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Offline Status', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.offline,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
      ),
      SizedBox(height: 24),
      Text('Connecting Status', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.connecting,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Indicator Only Grid', type: TinaConnectionStatus)
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
              Center(child: Text('Size', style: TextStyle(fontWeight: FontWeight.bold))),
              Center(child: Text('Online', style: TextStyle(fontWeight: FontWeight.bold))),
              Center(child: Text('Offline', style: TextStyle(fontWeight: FontWeight.bold))),
              Center(child: Text('Connecting', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Small')),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.online,
                  size: TinaConnectionStatusSize.small,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.offline,
                  size: TinaConnectionStatusSize.small,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.connecting,
                  size: TinaConnectionStatusSize.small,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Medium')),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.online,
                  size: TinaConnectionStatusSize.medium,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.offline,
                  size: TinaConnectionStatusSize.medium,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.connecting,
                  size: TinaConnectionStatusSize.medium,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Large')),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.online,
                  size: TinaConnectionStatusSize.large,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.offline,
                  size: TinaConnectionStatusSize.large,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.connecting,
                  size: TinaConnectionStatusSize.large,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'With Labels Grid', type: TinaConnectionStatus)
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
              Center(child: Text('Size', style: TextStyle(fontWeight: FontWeight.bold))),
              Center(child: Text('Online', style: TextStyle(fontWeight: FontWeight.bold))),
              Center(child: Text('Offline', style: TextStyle(fontWeight: FontWeight.bold))),
              Center(child: Text('Connecting', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Small')),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.online,
                  size: TinaConnectionStatusSize.small,
                  showLabel: true,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.offline,
                  size: TinaConnectionStatusSize.small,
                  showLabel: true,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.connecting,
                  size: TinaConnectionStatusSize.small,
                  showLabel: true,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Medium')),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.online,
                  size: TinaConnectionStatusSize.medium,
                  showLabel: true,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.offline,
                  size: TinaConnectionStatusSize.medium,
                  showLabel: true,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.connecting,
                  size: TinaConnectionStatusSize.medium,
                  showLabel: true,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Center(child: Text('Large')),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.online,
                  size: TinaConnectionStatusSize.large,
                  showLabel: true,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.offline,
                  size: TinaConnectionStatusSize.large,
                  showLabel: true,
                ),
              ),
              const Center(
                child: TinaConnectionStatus(
                  status: TinaConnectionState.connecting,
                  size: TinaConnectionStatusSize.large,
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

@widgetbook.UseCase(name: 'In App Bar Context', type: TinaConnectionStatus)
Widget inAppBarContextUseCase(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Tina AI Assistant'),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: TinaConnectionStatus(
            status: TinaConnectionState.online,
            size: TinaConnectionStatusSize.small,
            showLabel: true,
            customLabel: 'AI Ready',
          ),
        ),
      ],
    ),
    body: const Center(
      child: Text('Connection status shown in app bar'),
    ),
  );
}

@widgetbook.UseCase(name: 'In Chat Context', type: TinaConnectionStatus)
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
              TinaConnectionStatus(
                status: TinaConnectionState.connecting,
                size: TinaConnectionStatusSize.small,
                showLabel: true,
                customLabel: 'Connecting to AI...',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Expanded(
          child: Center(
            child: Text('Chat messages would appear here'),
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Status Transitions Demo', type: TinaConnectionStatus)
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
      TinaConnectionStatus(
        status: TinaConnectionState.connecting,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Initializing...',
      ),
      SizedBox(height: 24),
      Text('2. Successfully connected:'),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.online,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Connected',
      ),
      SizedBox(height: 24),
      Text('3. Connection lost:'),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.offline,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Connection Lost',
      ),
      SizedBox(height: 24),
      Text('4. Attempting to reconnect:'),
      SizedBox(height: 8),
      TinaConnectionStatus(
        status: TinaConnectionState.connecting,
        size: TinaConnectionStatusSize.medium,
        showLabel: true,
        customLabel: 'Reconnecting...',
      ),
    ],
  );
}