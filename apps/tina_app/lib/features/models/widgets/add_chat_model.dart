import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';
import 'package:tina_app/features/models/providers/add_chat_model_providers.dart';
import 'package:tina_ui/ui.dart';

class AddChatModelWidget extends ConsumerWidget {
  const AddChatModelWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TinaColumn(
      children: [
        _NameInput(),
        _KeyInput(),
        _TypeSelctor(),
        _AddChatModelButton(),
      ],
    );
  }
}

class _NameInput extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(addChatModelStateProvider.select((s) => s.name));

    final controller = useTextEditingController(text: name);

    return TinaInput(
      controller: controller,
      placeholder: 'Name',
      label: Text("Name"),
      onChanged: ref.watch(addChatModelStateProvider.notifier).setName,
    );
  }
}

class _KeyInput extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(addChatModelStateProvider.select((s) => s.key));

    final controller = useTextEditingController(text: name);

    return TinaInput(
      controller: controller,
      placeholder: 'Key',
      onChanged: ref.watch(addChatModelStateProvider.notifier).setKey,
    );
  }
}

class _TypeSelctor extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(addChatModelStateProvider.select((s) => s.type));

    return TinaDropdownSelector<ChatModelType>(
      value: type,
      onChanged: ref.watch(addChatModelStateProvider.notifier).setType,
      label: Text('Select Model'),
      options: [
        TinaDropdownOption(
          value: ChatModelType.anthropic,
          child: Text('Antropic'),
        ),
        TinaDropdownOption(value: ChatModelType.openai, child: Text('OpenAI')),
      ],
    );
  }
}

class _AddChatModelButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TinaButton(
      onPressed: () {
        final createChatModel = ref
            .read(addChatModelStateProvider.notifier)
            .createChatModel;

        addChatModelMutation.run(ref, (transaction) async {
          final created = await createChatModel();
          if (context.mounted && created != null) {
            Navigator.of(context).pop(created);
          }
        });
      },
      child: Text('Create'),
    );
  }
}
