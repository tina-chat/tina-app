import 'package:auravibes_app/features/models/providers/list_models_providers.dart';
import 'package:auravibes_app/features/models/widgets/add_chat_model.dart';
import 'package:auravibes_app/features/models/widgets/list_models.dart';
import 'package:auravibes_app/i18n/locale_keys.dart';
import 'package:auravibes_app/widgets/text_locale.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModelsScreen extends StatelessWidget {
  const ModelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuraColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.memory_outlined, size: 64),
          const SizedBox(height: 24),
          _AddModelModalButton(),
          const Expanded(child: ListModelsWidget()),
        ],
      ),
    );
  }
}

class _AddModelModalButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        AuraButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (ctx) =>
                  const AlertDialog(content: AddModelProviderWidget()),
            ).then((onValue) {
              ref.invalidate(listModelProvidersProvider);
            });
            // context.go(location)
          },
          child: const TextLocale(
            LocaleKeys.models_screens_add_provider_open_button,
          ),
        ),
      ],
    );
  }
}
