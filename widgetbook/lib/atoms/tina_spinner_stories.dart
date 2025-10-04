import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Spinner', type: TinaSpinner)
Widget basicSpinnerUseCase(BuildContext context) {
  return const Center(child: TinaSpinner());
}

@widgetbook.UseCase(name: 'Spinner Sizes', type: TinaSpinner)
Widget spinnerSizesUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TinaSpinner(size: TinaSpinnerSize.small),
      SizedBox(height: 24),
      TinaSpinner(size: TinaSpinnerSize.medium),
      SizedBox(height: 24),
      TinaSpinner(size: TinaSpinnerSize.large),
    ],
  );
}

@widgetbook.UseCase(name: 'Colored Spinners', type: TinaSpinner)
Widget coloredSpinnersUseCase(BuildContext context) {
  return const Wrap(
    spacing: 32,
    runSpacing: 32,
    children: [
      TinaSpinner(color: Colors.blue),
      TinaSpinner(color: Colors.green),
      TinaSpinner(color: Colors.red),
      TinaSpinner(color: Colors.orange),
      TinaSpinner(color: Colors.purple),
    ],
  );
}

@widgetbook.UseCase(name: 'Loading State', type: TinaSpinner)
Widget loadingStateUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TinaSpinner(),
        SizedBox(height: 16),
        TinaText('Loading...', style: TinaTextStyle.body),
      ],
    ),
  );
}
