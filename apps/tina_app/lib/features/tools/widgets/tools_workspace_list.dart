import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/tools/providers/workspace_tools_provider.dart';
import 'package:tina_app/features/tools/widgets/tool_description.dart';
import 'package:tina_app/features/tools/widgets/tool_icon.dart';
import 'package:tina_app/features/tools/widgets/tool_name.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/widgets/app_error.dart';
import 'package:tina_app/widgets/text_locale.dart';
import 'package:tina_ui/ui.dart';

class ToolsWorkspaceListWidget extends HookConsumerWidget {
  const ToolsWorkspaceListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspaceToolsAsync = ref.watch(
      workspaceToolsProvider.select(
        (asyncValue) => asyncValue.whenData((value) => value.length),
      ),
    );

    return switch (workspaceToolsAsync) {
      AsyncLoading() => const TinaSpinner(),

      AsyncData(:final value) => ListView.builder(
        itemCount: value,
        itemBuilder: (context, index) {
          return ProviderScope(
            overrides: [workspaceToolIndexProvider.overrideWithValue(index)],
            child: const WorkspaceToolCard(),
          );
        },
      ),

      AsyncError(:final error, :final stackTrace) => AppErrorWidget(
        error: error,
        stackTrace: stackTrace,
      ),
    };
  }
}

class WorkspaceToolCard extends HookConsumerWidget {
  const WorkspaceToolCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspaceToolRow = ref.watch(workspaceToolRowProvider);

    final onToggle = useCallback((bool value) {
      final toolType = workspaceToolRow?.$1;
      if (toolType == null) return;
      final notifier = ref.read(workspaceToolsProvider.notifier);

      notifier.setToolEnabled(toolType.value, value);
    }, []);

    if (workspaceToolRow == null) return const SizedBox.shrink();
    final (toolType, workspaceTool) = workspaceToolRow;
    final isEnabled = workspaceTool?.isEnabled ?? false;
    final hasConfig = workspaceTool?.hasConfig ?? false;

    return Padding(
      padding: EdgeInsets.only(bottom: context.tinaTheme.spacing.md),
      child: TinaCard(
        child: TinaColumn(
          spacing: TinaSpacing.sm,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TinaRow(
              children: [
                // Tool icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isEnabled
                        ? context.tinaColors.primary.withValues(alpha: 0.1)
                        : context.tinaColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(
                      context.tinaTheme.borderRadius.lg,
                    ),
                  ),
                  child: TinaText(
                    color: isEnabled
                        ? TinaTextColor.onPrimary
                        : TinaTextColor.onSurfaceVariant,

                    child: ToolIconWidget(toolType: toolType),
                  ),
                ),

                // Tool info
                Expanded(
                  child: TinaColumn(
                    spacing: TinaSpacing.xs,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TinaText(
                        style: TinaTextStyle.heading6,
                        child: ToolNameWidget(toolType: toolType),
                      ),
                      TinaText(
                        style: TinaTextStyle.bodySmall,
                        color: TinaTextColor.onPrimary,
                        child: DefaultTextStyle.merge(
                          style: const TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          child: ToolDescriptionidget(toolType: toolType),
                        ),
                      ),
                    ],
                  ),
                ),

                // Toggle switch
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: isEnabled,
                    onChanged: onToggle,
                    activeThumbColor: context.tinaColors.primary,
                    activeTrackColor: context.tinaColors.primary.withValues(
                      alpha: 0.3,
                    ),
                    inactiveThumbColor: context.tinaColors.onSurfaceVariant,
                    inactiveTrackColor: context.tinaColors.outline,
                  ),
                ),
              ],
            ),

            // Additional info
            if (hasConfig) ...[
              SizedBox(height: context.tinaTheme.spacing.sm),
              TinaRow(
                spacing: TinaSpacing.sm,
                children: [
                  if (hasConfig)
                    TinaBadge.text(
                      variant: TinaBadgeVariant.warning,
                      size: TinaBadgeSize.small,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const TinaIcon(
                            Icons.settings,
                            size: TinaIconSize.extraSmall,
                          ),
                          SizedBox(width: context.tinaTheme.spacing.xs),
                          const TextLocale(LocaleKeys.tools_screen_configured),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
