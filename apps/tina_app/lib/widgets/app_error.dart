import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.error,
    required this.stackTrace,
    super.key,
  });
  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return TinaText(
      child: Text('Error loading models: $error'),
    );
  }
}
