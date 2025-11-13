import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/conversation.dart';
import 'package:tina_app/providers/messages_manager_provider.dart';
import 'package:tina_app/services/tools/tool_service.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';

part 'tool_calling_manager_provider.freezed.dart';
part 'tool_calling_manager_provider.g.dart';

@freezed
abstract class ToolCallItem with _$ToolCallItem {
  const factory ToolCallItem({
    required String id,
    required String name,
    required String argumentsRaw,
    required Map<String, dynamic> arguments,
  }) = _ToolCallItem;
}

@Freezed(toJson: true)
abstract class ToolResponseItem with _$ToolResponseItem {
  const factory ToolResponseItem({
    required String id,
    required String content,
  }) = _ToolResponseItem;
}

enum ToolExecutionStatus { pending, runing, finished }

@freezed
abstract class ToolExecution with _$ToolExecution {
  const factory ToolExecution({required String id}) = _ToolExecution;
}

@Riverpod(keepAlive: true)
class ToolCallingManagerNotifier extends _$ToolCallingManagerNotifier {
  @override
  List<ToolExecution> build() {
    return [];
  }

  void runTask(
    List<MessageToolCallEntity> toolCalling,
    String responseMessageId,
  ) async {
    // validate
    // execute
    // send message to AI

    final toolsToCall = toolCalling
        .map((tool) {
          final toolType = UserToolType.fromValue(tool.name);

          return (toolType, tool);
        })
        .where((element) => element.$1 != null)
        .map((e) => (ToolService.getTool(e.$1!), e.$2))
        .where((element) => element.$1 != null)
        .map((e) => (e.$1!, e.$2))
        .nonNulls;

    final toolResponsesFutures = toolsToCall.map((toolToCall) {
      return toolToCall.$1.runner(toolToCall.$2.arguments['input']).value.then((
        value,
      ) {
        return ToolResponseItem(
          id: toolToCall.$2.id,
          content: value.toString(),
        );
      });
    }).toList();

    final toolResponses = await Future.wait(toolResponsesFutures);

    ref
        .read(messagesManagerProvider.notifier)
        .sendToolsResponse(toolResponses, responseMessageId);
  }
}
