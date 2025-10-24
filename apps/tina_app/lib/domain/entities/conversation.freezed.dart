// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationEntity {

/// Unique identifier for the conversation
 String get id;/// Human-readable title of the conversation
 String get title;/// ID of the workspace this conversation belongs to
 String get workspaceId;/// ID of the AI model used for this conversation
 String? get modelId;/// Whether this conversation is pinned
 bool get isPinned;/// Timestamp when the conversation was created
 DateTime get createdAt;/// Timestamp when the conversation was last updated
 DateTime get updatedAt;
/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationEntityCopyWith<ConversationEntity> get copyWith => _$ConversationEntityCopyWithImpl<ConversationEntity>(this as ConversationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,workspaceId,modelId,isPinned,createdAt,updatedAt);

@override
String toString() {
  return 'ConversationEntity(id: $id, title: $title, workspaceId: $workspaceId, modelId: $modelId, isPinned: $isPinned, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ConversationEntityCopyWith<$Res>  {
  factory $ConversationEntityCopyWith(ConversationEntity value, $Res Function(ConversationEntity) _then) = _$ConversationEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String workspaceId, String? modelId, bool isPinned, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ConversationEntityCopyWithImpl<$Res>
    implements $ConversationEntityCopyWith<$Res> {
  _$ConversationEntityCopyWithImpl(this._self, this._then);

  final ConversationEntity _self;
  final $Res Function(ConversationEntity) _then;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? workspaceId = null,Object? modelId = freezed,Object? isPinned = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String?,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationEntity].
extension ConversationEntityPatterns on ConversationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationEntity value)  $default,){
final _that = this;
switch (_that) {
case _ConversationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String workspaceId,  String? modelId,  bool isPinned,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that.id,_that.title,_that.workspaceId,_that.modelId,_that.isPinned,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String workspaceId,  String? modelId,  bool isPinned,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity():
return $default(_that.id,_that.title,_that.workspaceId,_that.modelId,_that.isPinned,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String workspaceId,  String? modelId,  bool isPinned,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that.id,_that.title,_that.workspaceId,_that.modelId,_that.isPinned,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationEntity extends ConversationEntity {
  const _ConversationEntity({required this.id, required this.title, required this.workspaceId, this.modelId, required this.isPinned, required this.createdAt, required this.updatedAt}): super._();
  

/// Unique identifier for the conversation
@override final  String id;
/// Human-readable title of the conversation
@override final  String title;
/// ID of the workspace this conversation belongs to
@override final  String workspaceId;
/// ID of the AI model used for this conversation
@override final  String? modelId;
/// Whether this conversation is pinned
@override final  bool isPinned;
/// Timestamp when the conversation was created
@override final  DateTime createdAt;
/// Timestamp when the conversation was last updated
@override final  DateTime updatedAt;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationEntityCopyWith<_ConversationEntity> get copyWith => __$ConversationEntityCopyWithImpl<_ConversationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,workspaceId,modelId,isPinned,createdAt,updatedAt);

@override
String toString() {
  return 'ConversationEntity(id: $id, title: $title, workspaceId: $workspaceId, modelId: $modelId, isPinned: $isPinned, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ConversationEntityCopyWith<$Res> implements $ConversationEntityCopyWith<$Res> {
  factory _$ConversationEntityCopyWith(_ConversationEntity value, $Res Function(_ConversationEntity) _then) = __$ConversationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String workspaceId, String? modelId, bool isPinned, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ConversationEntityCopyWithImpl<$Res>
    implements _$ConversationEntityCopyWith<$Res> {
  __$ConversationEntityCopyWithImpl(this._self, this._then);

  final _ConversationEntity _self;
  final $Res Function(_ConversationEntity) _then;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? workspaceId = null,Object? modelId = freezed,Object? isPinned = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ConversationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String?,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ConversationToCreate {

/// Unique identifier for the conversation
 String get id;/// Human-readable title of the conversation
 String get title;/// ID of the workspace this conversation belongs to
 String get workspaceId;/// ID of the AI model used for this conversation
 String? get modelId;/// Whether this conversation is pinned
 bool? get isPinned;
/// Create a copy of ConversationToCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationToCreateCopyWith<ConversationToCreate> get copyWith => _$ConversationToCreateCopyWithImpl<ConversationToCreate>(this as ConversationToCreate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationToCreate&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,workspaceId,modelId,isPinned);

@override
String toString() {
  return 'ConversationToCreate(id: $id, title: $title, workspaceId: $workspaceId, modelId: $modelId, isPinned: $isPinned)';
}


}

/// @nodoc
abstract mixin class $ConversationToCreateCopyWith<$Res>  {
  factory $ConversationToCreateCopyWith(ConversationToCreate value, $Res Function(ConversationToCreate) _then) = _$ConversationToCreateCopyWithImpl;
@useResult
$Res call({
 String id, String title, String workspaceId, String? modelId, bool? isPinned
});




}
/// @nodoc
class _$ConversationToCreateCopyWithImpl<$Res>
    implements $ConversationToCreateCopyWith<$Res> {
  _$ConversationToCreateCopyWithImpl(this._self, this._then);

  final ConversationToCreate _self;
  final $Res Function(ConversationToCreate) _then;

/// Create a copy of ConversationToCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? workspaceId = null,Object? modelId = freezed,Object? isPinned = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationToCreate].
extension ConversationToCreatePatterns on ConversationToCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationToCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationToCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationToCreate value)  $default,){
final _that = this;
switch (_that) {
case _ConversationToCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationToCreate value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationToCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String workspaceId,  String? modelId,  bool? isPinned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationToCreate() when $default != null:
return $default(_that.id,_that.title,_that.workspaceId,_that.modelId,_that.isPinned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String workspaceId,  String? modelId,  bool? isPinned)  $default,) {final _that = this;
switch (_that) {
case _ConversationToCreate():
return $default(_that.id,_that.title,_that.workspaceId,_that.modelId,_that.isPinned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String workspaceId,  String? modelId,  bool? isPinned)?  $default,) {final _that = this;
switch (_that) {
case _ConversationToCreate() when $default != null:
return $default(_that.id,_that.title,_that.workspaceId,_that.modelId,_that.isPinned);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationToCreate extends ConversationToCreate {
  const _ConversationToCreate({required this.id, required this.title, required this.workspaceId, this.modelId, this.isPinned}): super._();
  

/// Unique identifier for the conversation
@override final  String id;
/// Human-readable title of the conversation
@override final  String title;
/// ID of the workspace this conversation belongs to
@override final  String workspaceId;
/// ID of the AI model used for this conversation
@override final  String? modelId;
/// Whether this conversation is pinned
@override final  bool? isPinned;

/// Create a copy of ConversationToCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationToCreateCopyWith<_ConversationToCreate> get copyWith => __$ConversationToCreateCopyWithImpl<_ConversationToCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationToCreate&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,workspaceId,modelId,isPinned);

@override
String toString() {
  return 'ConversationToCreate(id: $id, title: $title, workspaceId: $workspaceId, modelId: $modelId, isPinned: $isPinned)';
}


}

/// @nodoc
abstract mixin class _$ConversationToCreateCopyWith<$Res> implements $ConversationToCreateCopyWith<$Res> {
  factory _$ConversationToCreateCopyWith(_ConversationToCreate value, $Res Function(_ConversationToCreate) _then) = __$ConversationToCreateCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String workspaceId, String? modelId, bool? isPinned
});




}
/// @nodoc
class __$ConversationToCreateCopyWithImpl<$Res>
    implements _$ConversationToCreateCopyWith<$Res> {
  __$ConversationToCreateCopyWithImpl(this._self, this._then);

  final _ConversationToCreate _self;
  final $Res Function(_ConversationToCreate) _then;

/// Create a copy of ConversationToCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? workspaceId = null,Object? modelId = freezed,Object? isPinned = freezed,}) {
  return _then(_ConversationToCreate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$MessageEntity {

/// Unique identifier for the message
 String get id;/// ID of the conversation this message belongs to
 String get conversationId;/// Content of the message (JSON structure based on message type)
 String get content;/// Type of the message
 MessageType get messageType;/// Whether this message was sent by the user
 bool get isUser;/// Status of the message
 MessageStatus get status;/// Additional metadata for the message (JSON)
 String? get metadata;/// Timestamp when the message was created
 DateTime get createdAt;/// Timestamp when the message was last updated
 DateTime get updatedAt;
/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<MessageEntity> get copyWith => _$MessageEntityCopyWithImpl<MessageEntity>(this as MessageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.isUser, isUser) || other.isUser == isUser)&&(identical(other.status, status) || other.status == status)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,conversationId,content,messageType,isUser,status,metadata,createdAt,updatedAt);

@override
String toString() {
  return 'MessageEntity(id: $id, conversationId: $conversationId, content: $content, messageType: $messageType, isUser: $isUser, status: $status, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MessageEntityCopyWith<$Res>  {
  factory $MessageEntityCopyWith(MessageEntity value, $Res Function(MessageEntity) _then) = _$MessageEntityCopyWithImpl;
@useResult
$Res call({
 String id, String conversationId, String content, MessageType messageType, bool isUser, MessageStatus status, String? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MessageEntityCopyWithImpl<$Res>
    implements $MessageEntityCopyWith<$Res> {
  _$MessageEntityCopyWithImpl(this._self, this._then);

  final MessageEntity _self;
  final $Res Function(MessageEntity) _then;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? content = null,Object? messageType = null,Object? isUser = null,Object? status = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as MessageType,isUser: null == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageEntity].
extension MessageEntityPatterns on MessageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageEntity value)  $default,){
final _that = this;
switch (_that) {
case _MessageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String conversationId,  String content,  MessageType messageType,  bool isUser,  MessageStatus status,  String? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that.id,_that.conversationId,_that.content,_that.messageType,_that.isUser,_that.status,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String conversationId,  String content,  MessageType messageType,  bool isUser,  MessageStatus status,  String? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MessageEntity():
return $default(_that.id,_that.conversationId,_that.content,_that.messageType,_that.isUser,_that.status,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String conversationId,  String content,  MessageType messageType,  bool isUser,  MessageStatus status,  String? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that.id,_that.conversationId,_that.content,_that.messageType,_that.isUser,_that.status,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _MessageEntity extends MessageEntity {
  const _MessageEntity({required this.id, required this.conversationId, required this.content, required this.messageType, required this.isUser, required this.status, this.metadata, required this.createdAt, required this.updatedAt}): super._();
  

/// Unique identifier for the message
@override final  String id;
/// ID of the conversation this message belongs to
@override final  String conversationId;
/// Content of the message (JSON structure based on message type)
@override final  String content;
/// Type of the message
@override final  MessageType messageType;
/// Whether this message was sent by the user
@override final  bool isUser;
/// Status of the message
@override final  MessageStatus status;
/// Additional metadata for the message (JSON)
@override final  String? metadata;
/// Timestamp when the message was created
@override final  DateTime createdAt;
/// Timestamp when the message was last updated
@override final  DateTime updatedAt;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageEntityCopyWith<_MessageEntity> get copyWith => __$MessageEntityCopyWithImpl<_MessageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.isUser, isUser) || other.isUser == isUser)&&(identical(other.status, status) || other.status == status)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,conversationId,content,messageType,isUser,status,metadata,createdAt,updatedAt);

@override
String toString() {
  return 'MessageEntity(id: $id, conversationId: $conversationId, content: $content, messageType: $messageType, isUser: $isUser, status: $status, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MessageEntityCopyWith<$Res> implements $MessageEntityCopyWith<$Res> {
  factory _$MessageEntityCopyWith(_MessageEntity value, $Res Function(_MessageEntity) _then) = __$MessageEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String conversationId, String content, MessageType messageType, bool isUser, MessageStatus status, String? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$MessageEntityCopyWithImpl<$Res>
    implements _$MessageEntityCopyWith<$Res> {
  __$MessageEntityCopyWithImpl(this._self, this._then);

  final _MessageEntity _self;
  final $Res Function(_MessageEntity) _then;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? content = null,Object? messageType = null,Object? isUser = null,Object? status = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MessageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as MessageType,isUser: null == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$MessageToCreate {

/// ID of the conversation this message belongs to
 String get conversationId;/// Content of the message (JSON structure based on message type)
 String get content;/// Type of the message
 MessageType get messageType;/// Whether this message was sent by the user
 bool get isUser;/// Additional metadata for the message (JSON)
 String? get metadata; MessageStatus? get status;
/// Create a copy of MessageToCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageToCreateCopyWith<MessageToCreate> get copyWith => _$MessageToCreateCopyWithImpl<MessageToCreate>(this as MessageToCreate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageToCreate&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.isUser, isUser) || other.isUser == isUser)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,content,messageType,isUser,metadata,status);

@override
String toString() {
  return 'MessageToCreate(conversationId: $conversationId, content: $content, messageType: $messageType, isUser: $isUser, metadata: $metadata, status: $status)';
}


}

/// @nodoc
abstract mixin class $MessageToCreateCopyWith<$Res>  {
  factory $MessageToCreateCopyWith(MessageToCreate value, $Res Function(MessageToCreate) _then) = _$MessageToCreateCopyWithImpl;
@useResult
$Res call({
 String conversationId, String content, MessageType messageType, bool isUser, String? metadata, MessageStatus? status
});




}
/// @nodoc
class _$MessageToCreateCopyWithImpl<$Res>
    implements $MessageToCreateCopyWith<$Res> {
  _$MessageToCreateCopyWithImpl(this._self, this._then);

  final MessageToCreate _self;
  final $Res Function(MessageToCreate) _then;

/// Create a copy of MessageToCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? content = null,Object? messageType = null,Object? isUser = null,Object? metadata = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as MessageType,isUser: null == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageToCreate].
extension MessageToCreatePatterns on MessageToCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageToCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageToCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageToCreate value)  $default,){
final _that = this;
switch (_that) {
case _MessageToCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageToCreate value)?  $default,){
final _that = this;
switch (_that) {
case _MessageToCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conversationId,  String content,  MessageType messageType,  bool isUser,  String? metadata,  MessageStatus? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageToCreate() when $default != null:
return $default(_that.conversationId,_that.content,_that.messageType,_that.isUser,_that.metadata,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conversationId,  String content,  MessageType messageType,  bool isUser,  String? metadata,  MessageStatus? status)  $default,) {final _that = this;
switch (_that) {
case _MessageToCreate():
return $default(_that.conversationId,_that.content,_that.messageType,_that.isUser,_that.metadata,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conversationId,  String content,  MessageType messageType,  bool isUser,  String? metadata,  MessageStatus? status)?  $default,) {final _that = this;
switch (_that) {
case _MessageToCreate() when $default != null:
return $default(_that.conversationId,_that.content,_that.messageType,_that.isUser,_that.metadata,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _MessageToCreate extends MessageToCreate {
  const _MessageToCreate({required this.conversationId, required this.content, required this.messageType, required this.isUser, this.metadata, this.status}): super._();
  

/// ID of the conversation this message belongs to
@override final  String conversationId;
/// Content of the message (JSON structure based on message type)
@override final  String content;
/// Type of the message
@override final  MessageType messageType;
/// Whether this message was sent by the user
@override final  bool isUser;
/// Additional metadata for the message (JSON)
@override final  String? metadata;
@override final  MessageStatus? status;

/// Create a copy of MessageToCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageToCreateCopyWith<_MessageToCreate> get copyWith => __$MessageToCreateCopyWithImpl<_MessageToCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageToCreate&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.isUser, isUser) || other.isUser == isUser)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,content,messageType,isUser,metadata,status);

@override
String toString() {
  return 'MessageToCreate(conversationId: $conversationId, content: $content, messageType: $messageType, isUser: $isUser, metadata: $metadata, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MessageToCreateCopyWith<$Res> implements $MessageToCreateCopyWith<$Res> {
  factory _$MessageToCreateCopyWith(_MessageToCreate value, $Res Function(_MessageToCreate) _then) = __$MessageToCreateCopyWithImpl;
@override @useResult
$Res call({
 String conversationId, String content, MessageType messageType, bool isUser, String? metadata, MessageStatus? status
});




}
/// @nodoc
class __$MessageToCreateCopyWithImpl<$Res>
    implements _$MessageToCreateCopyWith<$Res> {
  __$MessageToCreateCopyWithImpl(this._self, this._then);

  final _MessageToCreate _self;
  final $Res Function(_MessageToCreate) _then;

/// Create a copy of MessageToCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? content = null,Object? messageType = null,Object? isUser = null,Object? metadata = freezed,Object? status = freezed,}) {
  return _then(_MessageToCreate(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as MessageType,isUser: null == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus?,
  ));
}


}

// dart format on
