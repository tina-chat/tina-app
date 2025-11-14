import 'package:auravibes_app/domain/entities/model_providers_entities.dart';
import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:auravibes_app/features/models/providers/list_models_providers.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListModelsWidget extends ConsumerWidget {
  const ListModelsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatModelsAsync = ref.watch(listModelProvidersProvider);

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
      AsyncLoading() => const Center(child: AuraSpinner()),
      AsyncError(error: final error, stackTrace: _) => AuraText(
        child: Text('Error loading models: $error'),
      ),
    };
  }

  Widget _buildEmptyState(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuraIcon(
              Icons.model_training_outlined,
              size: AuraIconSize.extraLarge,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            AuraText(
              style: AuraTextStyle.heading3,
              child: Text('No AI Models Configured'),
            ),
            SizedBox(height: 8),
            AuraText(
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

  final ModelProviderEntity chatModel;

  @override
  Widget build(BuildContext context) {
    return AuraCard(
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
                    AuraText(
                      style: AuraTextStyle.heading6,
                      child: Text(chatModel.name),
                      // TODO: fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    AuraText(
                      style: AuraTextStyle.bodySmall,

                      child: Text(_getModelTypeDisplay()),
                      // TODOcolor: Colors.grey,
                    ),
                  ],
                ),
              ),
              AuraBadge.text(
                variant: _getBadgeVariant(),
                child: Text(chatModel.type.value.toUpperCase()),
              ),
            ],
          ),
          if (chatModel.url != null) ...[
            const SizedBox(height: 12),
            AuraText(
              style: AuraTextStyle.bodySmall,

              child: Text('URL: ${chatModel.url}'),
              // TODO: color: Colors.grey,
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: AuraText(
                  style: AuraTextStyle.bodySmall,
                  child: Text('API Key: ${_obscureApiKey(chatModel.key)}'),
                  // TODO: color: Colors.grey,
                ),
              ),
              AuraButton(
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
      case ChatModelType.anthropic:
        iconData = Icons.smart_toy_outlined;
        iconColor = const Color(0xFFD97757); // Anthropic orange
    }

    return AuraIcon(iconData, color: iconColor);
  }

  String _getModelTypeDisplay() {
    switch (chatModel.type) {
      case ChatModelType.openai:
        return 'OpenAI Compatible';
      case ChatModelType.anthropic:
        return 'Anthropic Claude';
    }
  }

  AuraBadgeVariant _getBadgeVariant() {
    switch (chatModel.type) {
      case ChatModelType.openai:
        return AuraBadgeVariant.success;
      case ChatModelType.anthropic:
        return AuraBadgeVariant.info;
    }
  }

  String _obscureApiKey(String apiKey) {
    if (apiKey.length <= 8) {
      return '*' * apiKey.length;
    }
    final initial = apiKey.substring(0, 4);
    final ending = apiKey.substring(apiKey.length - 4);

    return '$initial${'*' * (apiKey.length - 8)}$ending';
  }
}
