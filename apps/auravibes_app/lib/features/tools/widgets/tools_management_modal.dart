import 'package:auravibes_app/features/tools/providers/conversation_tools_provider.dart';
import 'package:auravibes_app/features/tools/widgets/tool_icon.dart';
import 'package:auravibes_app/features/tools/widgets/tool_name.dart';
import 'package:auravibes_app/services/tools/user_tools_entity.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Modal for managing conversation tools
class ToolsManagementModal extends HookConsumerWidget {
  const ToolsManagementModal({
    required this.workspaceId,
    super.key,
    this.conversationId,
  });

  final String? conversationId;
  final String workspaceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationToolsAsync = ref.watch(
      conversationToolsProvider(
        workspaceId: workspaceId,
        conversationId: conversationId,
      ),
    );

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignBorderRadius.xl),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          maxWidth: 400,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            Container(
              padding: const EdgeInsets.all(DesignSpacing.md),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.auraColors.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  const AuraText(
                    style: AuraTextStyle.heading6,
                    child: Text('Manage Tools'),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const AuraIcon(Icons.close),
                    style: IconButton.styleFrom(
                      foregroundColor: context.auraColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Tools list
            Flexible(
              child: switch (conversationToolsAsync) {
                AsyncLoading() => const Center(child: AuraSpinner()),
                AsyncData(:final value) => _ToolsList(
                  toolsState: value,
                  conversationId: conversationId,
                  workspaceId: workspaceId,
                ),
                AsyncError(:final error) => Center(
                  child: AuraText(
                    color: AuraTextColor.error,
                    child: Text('Error loading tools: $error'),
                  ),
                ),
              },
            ),

            // Bottom padding
            const SizedBox(height: DesignSpacing.md),
          ],
        ),
      ),
    );
  }
}

class _ToolsList extends StatelessWidget {
  const _ToolsList({
    required this.toolsState,
    required this.workspaceId,
    this.conversationId,
  });

  final Map<UserToolType, bool> toolsState;
  final String? conversationId;
  final String workspaceId;

  @override
  Widget build(BuildContext context) {
    if (toolsState.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(DesignSpacing.lg),
        child: Center(
          child: AuraText(
            color: AuraTextColor.onSurfaceVariant,
            child: Text('No tools available'),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(DesignSpacing.md),
      itemCount: toolsState.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: DesignSpacing.sm),
      itemBuilder: (context, index) {
        final toolType = toolsState.keys.toList()[index];
        final isEnabled = toolsState[toolType]!;

        return _ToolTile(
          toolType: toolType,
          isEnabled: isEnabled,
          conversationId: conversationId,
          workspaceId: workspaceId,
        );
      },
    );
  }
}

class _ToolTile extends HookConsumerWidget {
  const _ToolTile({
    required this.toolType,
    required this.isEnabled,
    required this.conversationId,
    required this.workspaceId,
  });

  final UserToolType toolType;
  final bool isEnabled;
  final String? conversationId;
  final String workspaceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onToggle = useCallback((bool value) async {
      final notifier = ref.read(
        conversationToolsProvider(
          workspaceId: workspaceId,
          conversationId: conversationId,
        ).notifier,
      );
      await notifier.setToolEnabled(toolType.value, value);
    }, [conversationId, workspaceId, toolType]);

    return AuraCard(
      child: Padding(
        padding: const EdgeInsets.all(DesignSpacing.md),
        child: Row(
          children: [
            // Tool icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isEnabled
                    ? context.auraColors.primary.withValues(alpha: 0.1)
                    : context.auraColors.surfaceVariant,
                borderRadius: BorderRadius.circular(DesignBorderRadius.md),
              ),
              child: ToolIconWidget(toolType: toolType),
            ),

            const SizedBox(width: DesignSpacing.md),

            // Tool name
            Expanded(
              child: AuraText(
                child: ToolNameWidget(toolType: toolType),
              ),
            ),

            // Toggle switch
            Switch(
              value: isEnabled,
              onChanged: onToggle,
              activeThumbColor: context.auraColors.primary,
              activeTrackColor: context.auraColors.primary.withValues(
                alpha: 0.3,
              ),
              inactiveThumbColor: context.auraColors.onSurfaceVariant,
              inactiveTrackColor: context.auraColors.outline,
            ),
          ],
        ),
      ),
    );
  }
}
