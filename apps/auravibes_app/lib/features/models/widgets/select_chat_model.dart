import 'package:auravibes_app/domain/entities/chat_models_entities.dart';
import 'package:auravibes_app/features/models/providers/list_chat_models_providers.dart';
import 'package:auravibes_app/i18n/locale_keys.dart';
import 'package:auravibes_app/widgets/app_error.dart';
import 'package:auravibes_app/widgets/text_locale.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectChatModelWidget extends HookConsumerWidget {
  const SelectChatModelWidget({
    required this.selectChatModelId,
    super.key,
    this.chatModelId,
  });

  final String? chatModelId;
  final void Function(String?) selectChatModelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatModelsAsync = ref.watch(listChatModelProvidersProvider);

    final searchValue = useState<String>('');
    final controller = useTextEditingController();

    final options = useMemoized(() {
      final chatModels = chatModelsAsync.value ?? [];
      if (searchValue.value.isEmpty) return chatModels;
      return chatModels.where((model) {
        final searchTerm =
            '${model.modelProvider.name} - ${model.chatModel.displayName}'
                .toLowerCase();
        return searchTerm.contains(searchValue.value.toLowerCase());
      }).toList();
    }, [searchValue.value, chatModelsAsync.value]);

    return AuraDropdownSelector<String>(
      value: chatModelId,
      onChanged: selectChatModelId,
      placeholder: const TextLocale(
        LocaleKeys.chats_screens_chat_conversation_select_model_selctor,
      ),
      options: options
          .map(
            (model) => AuraDropdownOption(
              value: model.chatModel.id,
              child: Text(
                '${model.modelProvider.name} - ${model.chatModel.displayName}',
              ),
            ),
          )
          .toList(),

      header: switch (chatModelsAsync) {
        AsyncLoading<List<ChatModelWithProviderEntity>>() =>
          const AuraSpinner(),
        AsyncData<List<ChatModelWithProviderEntity>>() => Padding(
          padding: EdgeInsetsGeometry.all(context.auraTheme.spacing.md),
          child: AuraInput(
            controller: controller,
            onChanged: (value) {
              searchValue.value = value;
            },
          ),
        ),
        AsyncError<List<ChatModelWithProviderEntity>>(
          :final error,
          :final stackTrace,
        ) =>
          AppErrorWidget(error: error, stackTrace: stackTrace),
      },
    );
  }
}
