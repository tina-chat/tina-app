import 'package:auravibes_app/domain/entities/credentials_entities.dart';
import 'package:auravibes_app/features/models/providers/list_models_providers.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListModelCredentialsWidget extends ConsumerWidget {
  const ListModelCredentialsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credentialsModelsAsync = ref.watch(listCredentialsProvider);

    return switch (credentialsModelsAsync) {
      AsyncData(value: final credentialsModels) => () {
        if (credentialsModels.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: credentialsModels.length,
          shrinkWrap: true,
          // separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final credentialsModel = credentialsModels[index];
            //return Text(credentialsModel.name);
            return _CredentialsModelCard(credentialsModel: credentialsModel);
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
        child: AuraColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuraIcon(
              Icons.model_training_outlined,
              size: AuraIconSize.extraLarge,
              color: Colors.grey,
            ),
            AuraText(
              style: AuraTextStyle.heading3,
              child: Text('No AI Models Configured'),
            ),
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

class _CredentialsModelCard extends StatelessWidget {
  const _CredentialsModelCard({required this.credentialsModel});

  final CredentialsEntity credentialsModel;

  @override
  Widget build(BuildContext context) {
    return AuraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildModelTypeIcon(context),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuraText(
                      style: AuraTextStyle.heading6,
                      child: Text(credentialsModel.name),
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
                child: Text(credentialsModel.modelId.toUpperCase()),
              ),
            ],
          ),
          if (credentialsModel.url != null) ...[
            const SizedBox(height: 12),
            AuraText(
              style: AuraTextStyle.bodySmall,

              child: Text('URL: ${credentialsModel.url}'),
              // TODO: color: Colors.grey,
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: AuraText(
                  style: AuraTextStyle.bodySmall,
                  child: Text(
                    'API Key: ${_obscureApiKey(credentialsModel.key)}',
                  ),
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

  Widget _buildModelTypeIcon(BuildContext context) {
    return SvgPicture.network(
      'https://models.dev/logos/${credentialsModel.modelId}.svg',
      placeholderBuilder: (BuildContext context) =>
          const CircularProgressIndicator(), // Optional: show a loading
      // indicator
      colorFilter: ColorFilter.mode(
        context.auraColors.onBackground,
        BlendMode.srcIn,
      ),
      height: 30, // Optional: specify height
      width: 30, // Optional: specify width
    );
  }

  String _getModelTypeDisplay() {
    return credentialsModel.modelId;
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
