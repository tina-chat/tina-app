import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Container', type: AuraContainer)
Widget basicContainerUseCase(BuildContext context) {
  return Center(
    child: AuraContainer(
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.grey.shade100,
      borderRadius: 8.0,
      child: const AuraText(
        style: AuraTextStyle.body,
        child: Text('Basic Container'),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Container with Shadow', type: AuraContainer)
Widget containerShadowUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        AuraContainer(
          padding: const EdgeInsets.all(16),
          shadow: AuraContainerShadow.none,
          backgroundColor: Colors.white,
          child: const AuraText(
            style: AuraTextStyle.body,
            child: Text('No Shadow'),
          ),
        ),
        const SizedBox(height: 24),
        AuraContainer(
          padding: const EdgeInsets.all(16),
          shadow: AuraContainerShadow.sm,
          backgroundColor: Colors.white,
          child: const AuraText(
            style: AuraTextStyle.body,
            child: Text('Small Shadow'),
          ),
        ),
        const SizedBox(height: 24),
        AuraContainer(
          padding: const EdgeInsets.all(16),
          shadow: AuraContainerShadow.md,
          backgroundColor: Colors.white,
          child: const AuraText(
            style: AuraTextStyle.body,
            child: Text('Medium Shadow'),
          ),
        ),
        const SizedBox(height: 24),
        AuraContainer(
          padding: const EdgeInsets.all(16),
          shadow: AuraContainerShadow.lg,
          backgroundColor: Colors.white,
          child: const AuraText(
            style: AuraTextStyle.body,
            child: Text('Large Shadow'),
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Container Types', type: AuraContainer)
Widget containerTypesUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        AuraContainer(
          padding: const EdgeInsets.all(16),
          child: const AuraText(
            style: AuraTextStyle.body,
            child: Text('Basic Container'),
          ),
        ),
        const SizedBox(height: 16),
        AuraContainer.content(
          backgroundColor: Colors.blue.shade50,
          child: const AuraText(
            style: AuraTextStyle.body,
            child: Text('Content Container'),
          ),
        ),
        const SizedBox(height: 16),
        AuraContainer.component(
          backgroundColor: Colors.green.shade50,
          child: const AuraText(
            style: AuraTextStyle.body,
            child: Text('Component Container'),
          ),
        ),
      ],
    ),
  );
}
