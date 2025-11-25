// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/aura_ui/auravibes_attachment_preview_stories.dart'
    as _widgetbook_workspace_atoms_auravibes_attachment_preview_stories;
import 'package:widgetbook_workspace/aura_ui/auravibes_icon_stories.dart'
    as _widgetbook_workspace_atoms_auravibes_icon_stories;
import 'package:widgetbook_workspace/aura_ui/auravibes_message_status_stories.dart'
    as _widgetbook_workspace_atoms_auravibes_message_status_stories;
import 'package:widgetbook_workspace/aura_ui/auravibes_spinner_stories.dart'
    as _widgetbook_workspace_atoms_auravibes_spinner_stories;
import 'package:widgetbook_workspace/aura_ui/auravibes_text_stories.dart'
    as _widgetbook_workspace_atoms_auravibes_text_stories;
import 'package:widgetbook_workspace/aura_ui/auravibes_tile_stories.dart'
    as _widgetbook_workspace_atoms_auravibes_tile_stories;
import 'package:widgetbook_workspace/aura_ui/auravibes_typing_indicator_stories.dart'
    as _widgetbook_workspace_atoms_auravibes_typing_indicator_stories;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'atoms',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AuraAttachmentPreview',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Aura Attachment Preview',
            builder:
                _widgetbook_workspace_atoms_auravibes_attachment_preview_stories
                    .imageAttachmentUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AuraIcon',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Basic Icons',
            builder: _widgetbook_workspace_atoms_auravibes_icon_stories
                .basicIconsUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AuraIconButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Icon Button Basic',
            builder: _widgetbook_workspace_atoms_auravibes_icon_stories
                .iconButtonBasicUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AuraMessageStatus',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Sending Status',
            builder:
                _widgetbook_workspace_atoms_auravibes_message_status_stories
                    .sendingStatusUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AuraSpinner',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'AuraSpinner',
            builder: _widgetbook_workspace_atoms_auravibes_spinner_stories
                .basicSpinnerUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AuraText',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'AuraText',
            builder: _widgetbook_workspace_atoms_auravibes_text_stories
                .textStylesUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AuraTile',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'AuraTile',
            builder: _widgetbook_workspace_atoms_auravibes_tile_stories
                .primaryTileUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AuraTypingIndicator',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default Typing Indicator',
            builder:
                _widgetbook_workspace_atoms_auravibes_typing_indicator_stories
                    .defaultTypingIndicatorUseCase,
          ),
        ],
      ),
    ],
  ),
];
