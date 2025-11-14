import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Spinner', type: AuraSpinner)
Widget basicSpinnerUseCase(BuildContext context) {
  return const Center(child: AuraSpinner());
}

@widgetbook.UseCase(name: 'Spinner Sizes', type: AuraSpinner)
Widget spinnerSizesUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AuraSpinner(size: AuraSpinnerSize.small),
      SizedBox(height: 24),
      AuraSpinner(size: AuraSpinnerSize.medium),
      SizedBox(height: 24),
      AuraSpinner(size: AuraSpinnerSize.large),
    ],
  );
}

@widgetbook.UseCase(name: 'Colored Spinners', type: AuraSpinner)
Widget coloredSpinnersUseCase(BuildContext context) {
  return const Wrap(
    spacing: 32,
    runSpacing: 32,
    children: [
      AuraSpinner(color: Colors.blue),
      AuraSpinner(color: Colors.green),
      AuraSpinner(color: Colors.red),
      AuraSpinner(color: Colors.orange),
      AuraSpinner(color: Colors.purple),
    ],
  );
}

@widgetbook.UseCase(name: 'Loading State', type: AuraSpinner)
Widget loadingStateUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuraSpinner(),
        SizedBox(height: 16),
        AuraText(style: AuraTextStyle.body, child: Text('Loading...')),
      ],
    ),
  );
}
