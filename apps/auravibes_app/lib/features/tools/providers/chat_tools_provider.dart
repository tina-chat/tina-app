import 'package:auravibes_app/core/exceptions/conversation_exceptions.dart';
import 'package:auravibes_app/domain/entities/conversation_tool.dart';
import 'package:auravibes_app/domain/repositories/conversation_tools_repository.dart';
import 'package:auravibes_app/features/chats/providers/messages_providers.dart';
import 'package:auravibes_app/features/tools/providers/conversation_tools_provider.dart';
import 'package:auravibes_app/features/tools/providers/workspace_tools_provider.dart';
import 'package:auravibes_app/features/workspaces/providers/selected_workspace.dart';
import 'package:auravibes_app/services/tools/tool_service.dart';
import 'package:auravibes_app/services/tools/user_tools_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_tools_provider.g.dart';

/// State for chat tools management
class ChatToolsState {
  const ChatToolsState({
    required this.availableTools,
    required this.toolStates,
    required this.conversationId,
    required this.workspaceId,
    required this.isNewConversation,
  });
  final List<UserToolEntity<Object, Object, Object>> availableTools;
  final Map<String, bool> toolStates;
  final String conversationId;
  final String workspaceId;
  final bool isNewConversation;

  /// Get the enabled state for a specific tool
  bool isToolEnabled(String toolType) {
    // For new conversations, default to enabled unless explicitly disabled
    if (isNewConversation) {
      return toolStates[toolType] ?? true;
    }
    return toolStates[toolType] ?? false;
  }

  /// Get enabled tools list
  List<UserToolEntity<Object, Object, Object>> get enabledTools {
    return availableTools
        .where((tool) => isToolEnabled(tool.type.value))
        .toList();
  }

  /// Check if tools functionality is available
  bool get hasTools => availableTools.isNotEmpty;

  ChatToolsState copyWith({
    List<UserToolEntity<Object, Object, Object>>? availableTools,
    Map<String, bool>? toolStates,
    String? conversationId,
    String? workspaceId,
    bool? isNewConversation,
  }) {
    return ChatToolsState(
      availableTools: availableTools ?? this.availableTools,
      toolStates: toolStates ?? this.toolStates,
      conversationId: conversationId ?? this.conversationId,
      workspaceId: workspaceId ?? this.workspaceId,
      isNewConversation: isNewConversation ?? this.isNewConversation,
    );
  }
}

@riverpod
class ChatToolsNotifier extends _$ChatToolsNotifier {
  late ConversationToolsRepository _repository;
  late String _workspaceId;

  @override
  Future<ChatToolsState> build() async {
    _repository = ref.read(conversationToolsRepositoryProvider);

    // Get workspace ID
    try {
      _workspaceId = await ref.watch(
        selectedWorkspaceProvider.selectAsync((w) => w.id),
      );
    } on Exception catch (_) {
      _workspaceId = '';
    }

    // Try to get conversation info
    var conversationId = '';
    var isNewConversation = false;

    try {
      final conversation = ref.watch(conversationChatProvider);
      if (conversation.value != null) {
        conversationId = conversation.value!.id;
        isNewConversation = false;
      } else {
        isNewConversation = true;
      }
    } on NewConversationException {
      isNewConversation = true;
    } on NoConversationSelectedException {
      isNewConversation = true;
    } on Exception catch (_) {
      // Generic exception - assume new conversation
      isNewConversation = true;
    }

    return _loadToolsState(conversationId, isNewConversation);
  }

  Future<ChatToolsState> _loadToolsState(
    String conversationId,
    bool isNewConversation,
  ) async {
    try {
      // Get available tools from service
      const availableTools = ToolService.availableTools;

      // Initialize tool states
      final toolStates = <String, bool>{};

      if (isNewConversation) {
        // For new conversations, start with all tools enabled
        for (final tool in availableTools) {
          toolStates[tool.type.value] = true;
        }
      } else {
        // For existing conversations, load conversation-specific settings
        final conversationTools = conversationId.isNotEmpty
            ? await _repository.getConversationTools(conversationId)
            : <ConversationToolEntity>[];

        // Get workspace defaults
        final workspaceToolsAsync = ref.read(workspaceToolsProvider);
        final workspaceTools = workspaceToolsAsync.value ?? [];

        // Initialize with workspace defaults
        for (final tool in availableTools) {
          final workspaceTool = workspaceTools
              .where((wt) => wt.$1.value == tool.type.value)
              .firstOrNull;
          toolStates[tool.type.value] = workspaceTool?.$2?.isEnabled ?? true;
        }

        // Override with conversation-specific settings
        for (final convTool in conversationTools) {
          toolStates[convTool.type] = convTool.isEnabled;
        }
      }

      return ChatToolsState(
        availableTools: availableTools,
        toolStates: toolStates,
        conversationId: conversationId,
        workspaceId: _workspaceId,
        isNewConversation: isNewConversation,
      );
    } on Exception catch (_) {
      // Return empty state on error
      return ChatToolsState(
        availableTools: [],
        toolStates: {},
        conversationId: conversationId,
        workspaceId: _workspaceId,
        isNewConversation: isNewConversation,
      );
    }
  }

  /// Toggle a tool's enabled state
  Future<bool> toggleTool(String toolType) async {
    final currentState = state.value;
    if (currentState == null) return false;

    final newEnabledState = !currentState.isToolEnabled(toolType);
    return setToolEnabled(toolType, isEnabled: newEnabledState);
  }

  /// Enable or disable a tool
  Future<bool> setToolEnabled(
    String toolType, {
    required bool isEnabled,
  }) async {
    final currentState = state.value;
    if (currentState == null) return false;

    if (currentState.isNewConversation) {
      // For new conversations, just update local state
      final newToolStates = Map<String, bool>.from(currentState.toolStates);
      newToolStates[toolType] = isEnabled;

      state = AsyncValue.data(currentState.copyWith(toolStates: newToolStates));
      return true;
    }

    // For existing conversations, persist to database
    try {
      final success = await _repository.setConversationToolEnabled(
        currentState.conversationId,
        toolType,
        isEnabled: isEnabled,
      );
      if (success) {
        await refresh();
      }
      return success;
    } on Exception catch (_) {
      return false;
    }
  }

  /// Refresh the tools state
  Future<void> refresh() async {
    final currentState = state.value;
    if (currentState == null) return;

    state = const AsyncValue.loading();
    try {
      state = AsyncValue.data(
        await _loadToolsState(
          currentState.conversationId,
          currentState.isNewConversation,
        ),
      );
    } on Exception catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Get tools for sending to chatbot service
  List<String> getEnabledToolTypes() {
    final currentState = state.value;
    if (currentState == null) return [];

    return currentState.enabledTools.map((tool) => tool.type.value).toList();
  }
}
