import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/models/providers/list_models_providers.dart';
import 'package:tina_app/features/models/widgets/add_chat_model.dart';
import 'package:tina_app/features/models/widgets/list_models.dart';
import 'package:tina_ui/ui.dart';

class ModelsScreen extends StatelessWidget {
  const ModelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinaColumn(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.memory_outlined, size: 64),
          const SizedBox(height: 24),
          _AddModelModalButton(),
          Expanded(child: const ListModelsWidget()),
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
        TinaButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(content: AddChatModelWidget()),
            ).then((onValue) {
              ref.invalidate(listModelsProvider);
            });
            // context.go(location)
          },
          child: Text('Add Model Credentials'),
        ),
      ],
    );
  }
}
