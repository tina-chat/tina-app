import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:auravibes_app/features/models/providers/add_model_provider_providers.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddModelProviderWidget extends ConsumerWidget {
  const AddModelProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuraColumn(
      children: [
        _NameInput(),
        _KeyInput(),
        _TypeSelctor(),
        _AddModelProviderButton(),
      ],
    );
  }
}

class _NameInput extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(addModelProviderStateProvider.select((s) => s.name));

    final controller = useTextEditingController(text: name);

    return AuraInput(
      controller: controller,
      placeholder: const Text('Name'),
      label: const Text('Name'),
      onChanged: ref.watch(addModelProviderStateProvider.notifier).setName,
    );
  }
}

class _KeyInput extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(addModelProviderStateProvider.select((s) => s.key));

    final controller = useTextEditingController(text: name);

    return AuraInput(
      controller: controller,
      placeholder: const Text('Key'),
      onChanged: ref.watch(addModelProviderStateProvider.notifier).setKey,
    );
  }
}

class _TypeSelctor extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(addModelProviderStateProvider.select((s) => s.type));

    return AuraDropdownSelector<ChatModelType>(
      value: type,
      onChanged: ref.watch(addModelProviderStateProvider.notifier).setType,
      label: const Text('Select Model'),
      options: const [
        AuraDropdownOption(
          value: ChatModelType.anthropic,
          child: Text('Antropic'),
        ),
        AuraDropdownOption(value: ChatModelType.openai, child: Text('OpenAI')),
      ],
    );
  }
}

class _AddModelProviderButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuraButton(
      onPressed: () {
        final createChatModel = ref
            .read(addModelProviderStateProvider.notifier)
            .addModelProvider;

        addChatModelMutation.run(ref, (transaction) async {
          final created = await createChatModel();
          if (context.mounted && created != null) {
            Navigator.of(context).pop(created);
          }
        });
      },
      child: const Text('Create'),
    );
  }
}
