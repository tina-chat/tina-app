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
  const AddModelProviderModel._();

  String? validateName() {
    final name = this.name;
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }
    if (name.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (name.trim().length > 50) {
      return 'Name must be less than 50 characters';
    }
    return null;
  }

  String? validateKey() {
    final key = this.key;
    if (key == null || key.trim().isEmpty) {
      return 'API key is required';
    }
    if (key.trim().length < 5) {
      return 'API key appears to be too short';
    }
    return null;
  }

  String? validateType() {
    final type = this.type;
    if (type == null) {
      return 'Please select a model provider';
    }
    return null;
  }

  String? validateUrl() {
    final url = this.url;
    if (url == null || url.trim().isEmpty) {
      return null; // URL is optional
    }
    final trimmedUrl = url.trim();
    if (!trimmedUrl.startsWith('http://') &&
        !trimmedUrl.startsWith('https://')) {
      return 'URL must start with http:// or https://';
    }
    try {
      final uri = Uri.parse(trimmedUrl);
      if (uri.host.isEmpty) {
        return 'Please enter a valid URL';
      }
    } on FormatException {
      return 'Please enter a valid URL';
    }
    return null;
  }

  bool isValid() {
    return (validateKey() ??
            validateName() ??
            validateType() ??
            validateUrl()) ==
        null;
  }
}
