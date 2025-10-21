import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';

part 'add_chat_model_model.freezed.dart';

@freezed
abstract class AddChatModelModel with _$AddChatModelModel {
  const factory AddChatModelModel({
    String? name,
    ChatModelType? type,
    String? key,
    String? url,
  }) = _AddChatModelModel;
}
