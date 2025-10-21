import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/features/models/providers/list_models_providers.dart';
import 'package:tina_app/domain/entities/chat_model_model.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';
// ignore: implementation_imports
import 'package:tina_ui/src/atoms/atoms.dart';

class ListModelsWidget extends ConsumerWidget {
  const ListModelsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatModelsAsync = ref.watch(listModelsProvider);

    return switch (chatModelsAsync) {
      AsyncData(value: final chatModels) => () {
        if (chatModels.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: chatModels.length,
          shrinkWrap: true,
          // separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final chatModel = chatModels[index];
            //return Text(chatModel.name);
            return _ChatModelCard(chatModel: chatModel);
          },
        );
      }(),
      AsyncLoading() => const Center(child: TinaSpinner()),
      AsyncError(error: final error, stackTrace: _) => TinaText(
        style: TinaTextStyle.body,
        child: Text('Error loading models: ${error.toString()}'),
      ),
    };
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TinaIcon(
              Icons.model_training_outlined,
              size: TinaIconSize.extraLarge,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            TinaText(
              style: TinaTextStyle.heading3,
              child: Text('No AI Models Configured'),
            ),
            const SizedBox(height: 8),
            TinaText(
              style: TinaTextStyle.body,
              // TODO: color: Colors.grey,
              textAlign: TextAlign.center,
              child: Text('Add your first AI model to get started'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatModelCard extends StatelessWidget {
  const _ChatModelCard({required this.chatModel});

  final ChatModelEntity chatModel;

  @override
  Widget build(BuildContext context) {
    return TinaCard(
      elevation: TinaCardElevation.sm,
      padding: TinaCardPadding.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildModelTypeIcon(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TinaText(
                      style: TinaTextStyle.heading6,
                      child: Text(chatModel.name),
                      // TODO: fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    TinaText(
                      style: TinaTextStyle.bodySmall,

                      child: Text(_getModelTypeDisplay()),
                      // TODO color: Colors.grey,
                    ),
                  ],
                ),
              ),
              TinaBadge.text(
                text: chatModel.type.value.toUpperCase(),
                variant: _getBadgeVariant(),
              ),
            ],
          ),
          if (chatModel.url != null) ...[
            const SizedBox(height: 12),
            TinaText(
              style: TinaTextStyle.bodySmall,

              child: Text('URL: ${chatModel.url}'),
              // TODO: color: Colors.grey,
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TinaText(
                  style: TinaTextStyle.bodySmall,
                  child: Text('API Key: ${_obscureApiKey(chatModel.key)}'),
                  // TODO: color: Colors.grey,
                ),
              ),
              TinaButton(
                onPressed: () {
                  // TODO: Implement edit functionality
                },
                child: const Text('Edit'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModelTypeIcon() {
    IconData iconData;
    Color iconColor;

    switch (chatModel.type) {
      case ChatModelType.openai:
        iconData = Icons.psychology_outlined;
        iconColor = const Color(0xFF10A37F); // OpenAI green
        break;
      case ChatModelType.anthropic:
        iconData = Icons.smart_toy_outlined;
        iconColor = const Color(0xFFD97757); // Anthropic orange
        break;
    }

    return TinaIcon(iconData, size: TinaIconSize.medium, color: iconColor);
  }

  String _getModelTypeDisplay() {
    switch (chatModel.type) {
      case ChatModelType.openai:
        return 'OpenAI Compatible';
      case ChatModelType.anthropic:
        return 'Anthropic Claude';
    }
  }

  TinaBadgeVariant _getBadgeVariant() {
    switch (chatModel.type) {
      case ChatModelType.openai:
        return TinaBadgeVariant.success;
      case ChatModelType.anthropic:
        return TinaBadgeVariant.info;
    }
  }

  String _obscureApiKey(String apiKey) {
    if (apiKey.length <= 8) {
      return '*' * apiKey.length;
    }
    return '${apiKey.substring(0, 4)}${'*' * (apiKey.length - 8)}${apiKey.substring(apiKey.length - 4)}';
  }
}
