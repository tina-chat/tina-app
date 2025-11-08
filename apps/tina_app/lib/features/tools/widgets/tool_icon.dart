import 'package:flutter/material.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';

class ToolIconWidget extends StatelessWidget {
  final UserToolType toolType;

  const ToolIconWidget({required this.toolType, super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(switch (toolType) {
      UserToolType.calculator => Icons.calculate_rounded,
    });
  }
}
