import 'dart:convert';

import 'package:langchain/langchain.dart';
import 'package:tina_app/services/tools/tool_service.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';

/// Result of a tool execution
class ToolExecutionResult {
  final String toolCallId;
  final String toolName;
  final Map<String, dynamic> arguments;
  final bool success;
  final String result;
  final String? error;
  final DateTime executedAt;

  const ToolExecutionResult({
    required this.toolCallId,
    required this.toolName,
    required this.arguments,
    required this.success,
    required this.result,
    this.error,
    required this.executedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'toolCallId': toolCallId,
      'toolName': toolName,
      'arguments': arguments,
      'success': success,
      'result': result,
      'error': error,
      'executedAt': executedAt.toIso8601String(),
    };
  }

  factory ToolExecutionResult.fromMap(Map<String, dynamic> map) {
    return ToolExecutionResult(
      toolCallId: map['toolCallId'],
      toolName: map['toolName'],
      arguments: Map<String, dynamic>.from(map['arguments']),
      success: map['success'],
      result: map['result'],
      error: map['error'],
      executedAt: DateTime.parse(map['executedAt']),
    );
  }

  String toJson() => jsonEncode(toMap());
  factory ToolExecutionResult.fromJson(String json) =>
      ToolExecutionResult.fromMap(jsonDecode(json));
}

/// Represents a tool call from AI response
class ToolCallRequest {
  final String id;
  final String name;
  final Map<String, dynamic> arguments;
  final String argumentsRaw;

  const ToolCallRequest({
    required this.id,
    required this.name,
    required this.arguments,
    required this.argumentsRaw,
  });
}

/// Service for executing client-side tools
class ToolExecutionService {
  static final ToolExecutionService _instance =
      ToolExecutionService._internal();
  factory ToolExecutionService() => _instance;
  ToolExecutionService._internal();

  /// Execute a single tool call
  Future<ToolExecutionResult> executeToolCall(ToolCallRequest toolCall) async {
    try {
      // Find the tool by name
      final toolType = UserToolType.fromValue(toolCall.name);
      if (toolType == null) {
        return ToolExecutionResult(
          toolCallId: toolCall.id,
          toolName: toolCall.name,
          arguments: toolCall.arguments,
          success: false,
          result: '',
          error: 'Unknown tool: ${toolCall.name}',
          executedAt: DateTime.now(),
        );
      }

      // Get the tool entity
      final toolEntity = ToolService.getTools(only: [toolType]).firstOrNull;
      if (toolEntity == null) {
        return ToolExecutionResult(
          toolCallId: toolCall.id,
          toolName: toolCall.name,
          arguments: toolCall.arguments,
          success: false,
          result: '',
          error: 'Tool implementation not found: ${toolCall.name}',
          executedAt: DateTime.now(),
        );
      }

      // Execute the tool using the Tool.fromFunction callback
      final tool = toolEntity.getTool();

      // For Tool.fromFunction, we need to call the underlying function
      // We need to cast to access the func property
      if (tool is Tool<String, ToolOptions, String>) {
        final result = await tool.invoke(toolCall.argumentsRaw);
        return ToolExecutionResult(
          toolCallId: toolCall.id,
          toolName: toolCall.name,
          arguments: toolCall.arguments,
          success: true,
          result: result.toString(),
          executedAt: DateTime.now(),
        );
      } else {
        return ToolExecutionResult(
          toolCallId: toolCall.id,
          toolName: toolCall.name,
          arguments: toolCall.arguments,
          success: false,
          result: '',
          error: 'Unsupported tool type: ${tool.runtimeType}',
          executedAt: DateTime.now(),
        );
      }
    } catch (e) {
      return ToolExecutionResult(
        toolCallId: toolCall.id,
        toolName: toolCall.name,
        arguments: toolCall.arguments,
        success: false,
        result: '',
        error: 'Execution error: ${e.toString()}',
        executedAt: DateTime.now(),
      );
    }
  }

  /// Execute multiple tool calls in parallel
  Future<List<ToolExecutionResult>> executeToolCalls(
    List<ToolCallRequest> toolCalls,
  ) async {
    final futures = toolCalls.map(executeToolCall);
    return Future.wait(futures);
  }

  /// Execute tool call with raw input (from metadata)
  Future<ToolExecutionResult> executeToolCallFromMetadata(
    Map<String, dynamic> toolCallMetadata,
  ) async {
    try {
      final toolCall = ToolCallRequest(
        id: toolCallMetadata['id'] ?? '',
        name: toolCallMetadata['name'] ?? '',
        arguments: Map<String, dynamic>.from(
          toolCallMetadata['arguments'] ?? {},
        ),
        argumentsRaw: jsonEncode(toolCallMetadata['arguments'] ?? {}),
      );

      return await executeToolCall(toolCall);
    } catch (e) {
      return ToolExecutionResult(
        toolCallId: toolCallMetadata['id'] ?? '',
        toolName: toolCallMetadata['name'] ?? '',
        arguments: Map<String, dynamic>.from(
          toolCallMetadata['arguments'] ?? {},
        ),
        success: false,
        result: '',
        error: 'Invalid tool call format: ${e.toString()}',
        executedAt: DateTime.now(),
      );
    }
  }

  /// Parse tool calls from ChatResult
  List<ToolCallRequest> parseToolCallsFromChatResult(ChatResult chatResult) {
    return chatResult.output.toolCalls.map((toolCall) {
      return ToolCallRequest(
        id: toolCall.id,
        name: toolCall.name,
        arguments: toolCall.arguments,
        argumentsRaw: toolCall.argumentsRaw,
      );
    }).toList();
  }

  /// Parse tool calls from message metadata
  List<Map<String, dynamic>> parseToolCallsFromMetadata(String? metadata) {
    if (metadata == null || metadata.isEmpty) {
      return [];
    }

    try {
      final metadataJson = jsonDecode(metadata);
      if (metadataJson is Map<String, dynamic> &&
          metadataJson.containsKey('tools')) {
        final tools = metadataJson['tools'];
        if (tools is List) {
          return tools.cast<Map<String, dynamic>>();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /// Format tool execution results for AI continuation
  String formatResultsForAI(List<ToolExecutionResult> results) {
    final toolResponses = results.map((result) {
      if (result.success) {
        return {'tool_call_id': result.toolCallId, 'output': result.result};
      } else {
        return {
          'tool_call_id': result.toolCallId,
          'error': result.error ?? 'Unknown error',
        };
      }
    }).toList();

    return jsonEncode({'tool_responses': toolResponses});
  }

  /// Check if a ChatResult contains tool calls
  bool hasToolCalls(ChatResult chatResult) {
    return chatResult.output.toolCalls.isNotEmpty;
  }
}
