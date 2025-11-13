import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_model_provider_model.freezed.dart';

@freezed
abstract class AddModelProviderModel with _$AddModelProviderModel {
  const factory AddModelProviderModel({
    String? name,
    ChatModelType? type,
    String? key,
    String? url,
  }) = _AddModelProviderModel;
}
