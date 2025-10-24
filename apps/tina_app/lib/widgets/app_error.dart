import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';

class AppErrorWidget extends StatelessWidget {
  final Object error;
  final StackTrace stackTrace;

  const AppErrorWidget({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    return TinaText(
      style: TinaTextStyle.body,
      child: Text('Error loading models: ${error.toString()}'),
    );
  }
}
