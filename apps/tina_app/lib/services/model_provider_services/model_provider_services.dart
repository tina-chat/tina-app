import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';
import 'package:tina_app/services/model_provider_services/models/antropic_responses.dart';

class ModelProvider {
  const ModelProvider({required this.type, required this.key, this.url});
  final ChatModelType type;
  final String key;
  final String? url;
}

class ModelProviderServices {
  Future<List<ChatModelToCreate>?> getChatModels(ModelProvider provider) async {
    if (provider.type == ChatModelType.openai) {
      final client = OpenAIClient(apiKey: provider.key, baseUrl: provider.url);

      final models = await client.listModels();
      return models.data
          .map(
            (model) => ChatModelToCreate(
              displayName: model.id,
              modelId: model.id,
              modelType: model.object?.name ?? 'model',
              modelProviderId: '',
            ),
          )
          .toList();
    }

    if (provider.type == ChatModelType.anthropic) {
      // Models.values
      final models = await _anthopicAllModels(provider);

      return models
          .map(
            (model) => ChatModelToCreate(
              displayName: model.displayName,
              modelId: model.id,
              modelType: model.type,
              modelProviderId: '',
            ),
          )
          .toList();
    }
    return null;
  }
}

Future<List<AntropicResponseModelsItem>> _anthopicAllModels(
  ModelProvider provider,
) async {
  var fetchMore = true;
  String? afterId;
  final foundModels = <AntropicResponseModelsItem>[];

  while (fetchMore) {
    final modelsResponse = await _anthopicModels(provider, afterId);

    if (modelsResponse case AntropicResponseModelsData(
      data: final models,
      :final hasMore,
      :final lastId,
    )) {
      foundModels.addAll(models);
      fetchMore = hasMore;
      afterId = lastId;
    }
  }
  return foundModels;
}

Future<AntropicResponseModels> _anthopicModels(
  ModelProvider provider, [
  String? afterId,
]) async {
  final url = provider.url ?? 'https://api.anthropic.com/v1';
  final qp = <String, dynamic>{'limit': '1000'};

  if (afterId != null) {
    qp.addAll({'after_id': afterId});
  }
  final request = await http.get(
    Uri.parse('$url/models').replace(queryParameters: qp),
    headers: <String, String>{
      'x-api-key': provider.key,
      'anthropic-version': '2023-06-01',
    },
  );

  final json = jsonDecode(request.body) as Map<String, dynamic>;

  return AntropicResponseModels.fromJson(json);
}
