// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_manager_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StreamingMessage {

 String get messageId; String get conversationId; String get responseMesageId; String get content; String? get metadata; DateTime get createdAt; DateTime get updatedAt; StreamingMessageStatus get status;
/// Create a copy of StreamingMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamingMessageCopyWith<StreamingMessage> get copyWith => _$StreamingMessageCopyWithImpl<StreamingMessage>(this as StreamingMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamingMessage&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.responseMesageId, responseMesageId) || other.responseMesageId == responseMesageId)&&(identical(other.content, content) || other.content == content)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,messageId,conversationId,responseMesageId,content,metadata,createdAt,updatedAt,status);

@override
String toString() {
  return 'StreamingMessage(messageId: $messageId, conversationId: $conversationId, responseMesageId: $responseMesageId, content: $content, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $StreamingMessageCopyWith<$Res>  {
  factory $StreamingMessageCopyWith(StreamingMessage value, $Res Function(StreamingMessage) _then) = _$StreamingMessageCopyWithImpl;
@useResult
$Res call({
 String messageId, String conversationId, String responseMesageId, String content, String? metadata, DateTime createdAt, DateTime updatedAt, StreamingMessageStatus status
});




}
/// @nodoc
class _$StreamingMessageCopyWithImpl<$Res>
    implements $StreamingMessageCopyWith<$Res> {
  _$StreamingMessageCopyWithImpl(this._self, this._then);

  final StreamingMessage _self;
  final $Res Function(StreamingMessage) _then;

/// Create a copy of StreamingMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageId = null,Object? conversationId = null,Object? responseMesageId = null,Object? content = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,responseMesageId: null == responseMesageId ? _self.responseMesageId : responseMesageId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StreamingMessageStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamingMessage].
extension StreamingMessagePatterns on StreamingMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamingMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamingMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamingMessage value)  $default,){
final _that = this;
switch (_that) {
case _StreamingMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamingMessage value)?  $default,){
final _that = this;
switch (_that) {
case _StreamingMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String messageId,  String conversationId,  String responseMesageId,  String content,  String? metadata,  DateTime createdAt,  DateTime updatedAt,  StreamingMessageStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamingMessage() when $default != null:
return $default(_that.messageId,_that.conversationId,_that.responseMesageId,_that.content,_that.metadata,_that.createdAt,_that.updatedAt,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String messageId,  String conversationId,  String responseMesageId,  String content,  String? metadata,  DateTime createdAt,  DateTime updatedAt,  StreamingMessageStatus status)  $default,) {final _that = this;
switch (_that) {
case _StreamingMessage():
return $default(_that.messageId,_that.conversationId,_that.responseMesageId,_that.content,_that.metadata,_that.createdAt,_that.updatedAt,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String messageId,  String conversationId,  String responseMesageId,  String content,  String? metadata,  DateTime createdAt,  DateTime updatedAt,  StreamingMessageStatus status)?  $default,) {final _that = this;
switch (_that) {
case _StreamingMessage() when $default != null:
return $default(_that.messageId,_that.conversationId,_that.responseMesageId,_that.content,_that.metadata,_that.createdAt,_that.updatedAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _StreamingMessage implements StreamingMessage {
  const _StreamingMessage({required this.messageId, required this.conversationId, required this.responseMesageId, required this.content, this.metadata, required this.createdAt, required this.updatedAt, required this.status});
  

@override final  String messageId;
@override final  String conversationId;
@override final  String responseMesageId;
@override final  String content;
@override final  String? metadata;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  StreamingMessageStatus status;

/// Create a copy of StreamingMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamingMessageCopyWith<_StreamingMessage> get copyWith => __$StreamingMessageCopyWithImpl<_StreamingMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamingMessage&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.responseMesageId, responseMesageId) || other.responseMesageId == responseMesageId)&&(identical(other.content, content) || other.content == content)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,messageId,conversationId,responseMesageId,content,metadata,createdAt,updatedAt,status);

@override
String toString() {
  return 'StreamingMessage(messageId: $messageId, conversationId: $conversationId, responseMesageId: $responseMesageId, content: $content, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$StreamingMessageCopyWith<$Res> implements $StreamingMessageCopyWith<$Res> {
  factory _$StreamingMessageCopyWith(_StreamingMessage value, $Res Function(_StreamingMessage) _then) = __$StreamingMessageCopyWithImpl;
@override @useResult
$Res call({
 String messageId, String conversationId, String responseMesageId, String content, String? metadata, DateTime createdAt, DateTime updatedAt, StreamingMessageStatus status
});




}
/// @nodoc
class __$StreamingMessageCopyWithImpl<$Res>
    implements _$StreamingMessageCopyWith<$Res> {
  __$StreamingMessageCopyWithImpl(this._self, this._then);

  final _StreamingMessage _self;
  final $Res Function(_StreamingMessage) _then;

/// Create a copy of StreamingMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? conversationId = null,Object? responseMesageId = null,Object? content = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,Object? status = null,}) {
  return _then(_StreamingMessage(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,responseMesageId: null == responseMesageId ? _self.responseMesageId : responseMesageId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StreamingMessageStatus,
  ));
}


}

// dart format on
