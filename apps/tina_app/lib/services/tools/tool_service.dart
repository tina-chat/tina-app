import 'package:tina_app/services/tools/user_tools/calculator_tool.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';

/// Service for managing app-defined AI tools with context-aware resolution.
///
/// This service provides hardcoded tool definitions and handles the resolution
/// of tool availability based on conversation and workspace preferences.
/// The resolution priority is: conversation → workspace → app defaults.
class ToolService {
  /// Hardcoded list of all available tools in the app
  static const List<UserToolEntity> availableTools = [CalculatorTool()];

  static List<UserToolType> getTypes() =>
      availableTools.map((e) => e.type).toList();
  static UserToolType getType(UserToolEntity tool) => tool.type;
  static bool hasType(UserToolType type) =>
      availableTools.any((tool) => tool.type == type);
  static bool hasTypeString(String type) =>
      availableTools.any((tool) => tool.type.value == type);
}
