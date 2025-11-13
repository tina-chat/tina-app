import 'package:flutter/material.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';

class ToolIconWidget extends StatelessWidget {
  const ToolIconWidget({required this.toolType, super.key});
  final UserToolType toolType;

  @override
  Widget build(BuildContext context) {
    return Icon(switch (toolType) {
      UserToolType.calculator => Icons.calculate_rounded,
    });
  }
}
