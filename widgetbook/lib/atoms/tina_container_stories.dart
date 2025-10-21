import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Container', type: TinaContainer)
Widget basicContainerUseCase(BuildContext context) {
  return Center(
    child: TinaContainer(
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.grey.shade100,
      borderRadius: 8.0,
      child: const TinaText(
        style: TinaTextStyle.body,
        child: Text('Basic Container'),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Container with Shadow', type: TinaContainer)
Widget containerShadowUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        TinaContainer(
          padding: const EdgeInsets.all(16),
          shadow: TinaContainerShadow.none,
          backgroundColor: Colors.white,
          child: const TinaText(
            style: TinaTextStyle.body,
            child: Text('No Shadow'),
          ),
        ),
        const SizedBox(height: 24),
        TinaContainer(
          padding: const EdgeInsets.all(16),
          shadow: TinaContainerShadow.sm,
          backgroundColor: Colors.white,
          child: const TinaText(
            style: TinaTextStyle.body,
            child: Text('Small Shadow'),
          ),
        ),
        const SizedBox(height: 24),
        TinaContainer(
          padding: const EdgeInsets.all(16),
          shadow: TinaContainerShadow.md,
          backgroundColor: Colors.white,
          child: const TinaText(
            style: TinaTextStyle.body,
            child: Text('Medium Shadow'),
          ),
        ),
        const SizedBox(height: 24),
        TinaContainer(
          padding: const EdgeInsets.all(16),
          shadow: TinaContainerShadow.lg,
          backgroundColor: Colors.white,
          child: const TinaText(
            style: TinaTextStyle.body,
            child: Text('Large Shadow'),
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Container Types', type: TinaContainer)
Widget containerTypesUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        TinaContainer(
          padding: const EdgeInsets.all(16),
          child: const TinaText(
            style: TinaTextStyle.body,
            child: Text('Basic Container'),
          ),
        ),
        const SizedBox(height: 16),
        TinaContainer.content(
          backgroundColor: Colors.blue.shade50,
          child: const TinaText(
            style: TinaTextStyle.body,
            child: Text('Content Container'),
          ),
        ),
        const SizedBox(height: 16),
        TinaContainer.component(
          backgroundColor: Colors.green.shade50,
          child: const TinaText(
            style: TinaTextStyle.body,
            child: Text('Component Container'),
          ),
        ),
      ],
    ),
  );
}
