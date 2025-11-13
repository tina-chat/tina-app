import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/tools/providers/workspace_tools_provider.dart';
import 'package:tina_app/features/tools/widgets/tool_count_enabled.dart';
import 'package:tina_app/features/tools/widgets/tools_workspace_list.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/widgets/text_locale.dart';
import 'package:tina_ui/ui.dart';

class ToolsScreen extends ConsumerWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TinaScreen(
      appBar: TinaAppBar(
        title: TextLocale(LocaleKeys.tools_screen_title),
        actions: [
          TinaIconButton(
            icon: Icons.refresh,
            onPressed: () {
              ref.invalidate(workspaceToolsProvider);
            },
            tooltip: LocaleKeys.tools_screen_refresh_tooltip.tr(
              context: context,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TinaColumn(
          children: [
            // Header section
            TinaCard(
              child: TinaColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: TinaSpacing.sm,
                children: [
                  TinaRow(
                    children: [
                      TinaText(
                        style: TinaTextStyle.heading3,
                        color: TinaTextColor.primary,
                        child: Icon(Icons.build_circle_outlined),
                      ),
                      TinaText(
                        style: TinaTextStyle.heading4,
                        child: TextLocale(
                          LocaleKeys.tools_screen_workspace_ai_tools,
                        ),
                      ),
                    ],
                  ),
                  TinaText(
                    color: TinaTextColor.onSurfaceVariant,
                    child: TextLocale(
                      LocaleKeys.tools_screen_enable_configure_description,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 16,
                              color: Colors.green[700],
                            ),
                            const SizedBox(width: 4),
                            ToolCountEnabledWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tools list
            Expanded(child: ToolsWorkspaceListWidget()),
          ],
        ),
      ),
    );
  }
}
