import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/features/models/providers/list_chat_models_providers.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/widgets/app_error.dart';
import 'package:tina_app/widgets/text_locale.dart';
import 'package:tina_ui/ui.dart';

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

    return TinaDropdownSelector<String>(
      value: chatModelId,
      onChanged: selectChatModelId,
      placeholder: const TextLocale(
        LocaleKeys.chats_screens_chat_conversation_select_model_selctor,
      ),
      options: options
          .map(
            (model) => TinaDropdownOption(
              value: model.chatModel.id,
              child: Text(
                '${model.modelProvider.name} - ${model.chatModel.displayName}',
              ),
            ),
          )
          .toList(),

      header: switch (chatModelsAsync) {
        AsyncLoading<List<ChatModelWithProviderEntity>>() =>
          const TinaSpinner(),
        AsyncData<List<ChatModelWithProviderEntity>>() => Padding(
          padding: EdgeInsetsGeometry.all(context.tinaTheme.spacing.md),
          child: TinaInput(
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
