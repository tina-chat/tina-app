// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'antropic_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AntropicResponseModelsItem _$AntropicResponseModelsItemFromJson(
  Map<String, dynamic> json,
) => _AntropicResponseModelsItem(
  displayName: json['display_name'] as String,
  id: json['id'] as String,
  type: json['type'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AntropicResponseModelsItemToJson(
  _AntropicResponseModelsItem instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'id': instance.id,
  'type': instance.type,
  'created_at': instance.createdAt.toIso8601String(),
};

_AntropicResponseModelsErrorMessage
_$AntropicResponseModelsErrorMessageFromJson(Map<String, dynamic> json) =>
    _AntropicResponseModelsErrorMessage(
      message: json['message'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AntropicResponseModelsErrorMessageToJson(
  _AntropicResponseModelsErrorMessage instance,
) => <String, dynamic>{'message': instance.message, 'type': instance.type};

AntropicResponseModelsData _$AntropicResponseModelsDataFromJson(
  Map<String, dynamic> json,
) => AntropicResponseModelsData(
  data: (json['data'] as List<dynamic>)
      .map(
        (e) => AntropicResponseModelsItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  firstId: json['first_id'] as String,
  hasMore: json['has_more'] as bool,
  lastId: json['last_id'] as String,
);

Map<String, dynamic> _$AntropicResponseModelsDataToJson(
  AntropicResponseModelsData instance,
) => <String, dynamic>{
  'data': instance.data,
  'first_id': instance.firstId,
  'has_more': instance.hasMore,
  'last_id': instance.lastId,
};

AntropicResponseModelsError _$AntropicResponseModelsErrorFromJson(
  Map<String, dynamic> json,
) => AntropicResponseModelsError(
  error: AntropicResponseModelsErrorMessage.fromJson(
    json['error'] as Map<String, dynamic>,
  ),
  requestId: json['request_id'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$AntropicResponseModelsErrorToJson(
  AntropicResponseModelsError instance,
) => <String, dynamic>{
  'error': instance.error,
  'request_id': instance.requestId,
  'type': instance.type,
};
