// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_models_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatModelEntity {

 int get id; String get displayName; String get modelId; String get modelType; DateTime get createdAt; DateTime get updatedAt; int get modelProviderId;
/// Create a copy of ChatModelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatModelEntityCopyWith<ChatModelEntity> get copyWith => _$ChatModelEntityCopyWithImpl<ChatModelEntity>(this as ChatModelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatModelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.modelProviderId, modelProviderId) || other.modelProviderId == modelProviderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,displayName,modelId,modelType,createdAt,updatedAt,modelProviderId);

@override
String toString() {
  return 'ChatModelEntity(id: $id, displayName: $displayName, modelId: $modelId, modelType: $modelType, createdAt: $createdAt, updatedAt: $updatedAt, modelProviderId: $modelProviderId)';
}


}

/// @nodoc
abstract mixin class $ChatModelEntityCopyWith<$Res>  {
  factory $ChatModelEntityCopyWith(ChatModelEntity value, $Res Function(ChatModelEntity) _then) = _$ChatModelEntityCopyWithImpl;
@useResult
$Res call({
 int id, String displayName, String modelId, String modelType, DateTime createdAt, DateTime updatedAt, int modelProviderId
});




}
/// @nodoc
class _$ChatModelEntityCopyWithImpl<$Res>
    implements $ChatModelEntityCopyWith<$Res> {
  _$ChatModelEntityCopyWithImpl(this._self, this._then);

  final ChatModelEntity _self;
  final $Res Function(ChatModelEntity) _then;

/// Create a copy of ChatModelEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? modelId = null,Object? modelType = null,Object? createdAt = null,Object? updatedAt = null,Object? modelProviderId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,modelProviderId: null == modelProviderId ? _self.modelProviderId : modelProviderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatModelEntity].
extension ChatModelEntityPatterns on ChatModelEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatModelEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatModelEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatModelEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChatModelEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatModelEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChatModelEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String displayName,  String modelId,  String modelType,  DateTime createdAt,  DateTime updatedAt,  int modelProviderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatModelEntity() when $default != null:
return $default(_that.id,_that.displayName,_that.modelId,_that.modelType,_that.createdAt,_that.updatedAt,_that.modelProviderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String displayName,  String modelId,  String modelType,  DateTime createdAt,  DateTime updatedAt,  int modelProviderId)  $default,) {final _that = this;
switch (_that) {
case _ChatModelEntity():
return $default(_that.id,_that.displayName,_that.modelId,_that.modelType,_that.createdAt,_that.updatedAt,_that.modelProviderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String displayName,  String modelId,  String modelType,  DateTime createdAt,  DateTime updatedAt,  int modelProviderId)?  $default,) {final _that = this;
switch (_that) {
case _ChatModelEntity() when $default != null:
return $default(_that.id,_that.displayName,_that.modelId,_that.modelType,_that.createdAt,_that.updatedAt,_that.modelProviderId);case _:
  return null;

}
}

}

/// @nodoc


class _ChatModelEntity implements ChatModelEntity {
  const _ChatModelEntity({required this.id, required this.displayName, required this.modelId, required this.modelType, required this.createdAt, required this.updatedAt, required this.modelProviderId});
  

@override final  int id;
@override final  String displayName;
@override final  String modelId;
@override final  String modelType;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int modelProviderId;

/// Create a copy of ChatModelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatModelEntityCopyWith<_ChatModelEntity> get copyWith => __$ChatModelEntityCopyWithImpl<_ChatModelEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatModelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.modelProviderId, modelProviderId) || other.modelProviderId == modelProviderId));
}


@override
int get hashCode => Object.hash(runtimeType,id,displayName,modelId,modelType,createdAt,updatedAt,modelProviderId);

@override
String toString() {
  return 'ChatModelEntity(id: $id, displayName: $displayName, modelId: $modelId, modelType: $modelType, createdAt: $createdAt, updatedAt: $updatedAt, modelProviderId: $modelProviderId)';
}


}

/// @nodoc
abstract mixin class _$ChatModelEntityCopyWith<$Res> implements $ChatModelEntityCopyWith<$Res> {
  factory _$ChatModelEntityCopyWith(_ChatModelEntity value, $Res Function(_ChatModelEntity) _then) = __$ChatModelEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String displayName, String modelId, String modelType, DateTime createdAt, DateTime updatedAt, int modelProviderId
});




}
/// @nodoc
class __$ChatModelEntityCopyWithImpl<$Res>
    implements _$ChatModelEntityCopyWith<$Res> {
  __$ChatModelEntityCopyWithImpl(this._self, this._then);

  final _ChatModelEntity _self;
  final $Res Function(_ChatModelEntity) _then;

/// Create a copy of ChatModelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? modelId = null,Object? modelType = null,Object? createdAt = null,Object? updatedAt = null,Object? modelProviderId = null,}) {
  return _then(_ChatModelEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,modelProviderId: null == modelProviderId ? _self.modelProviderId : modelProviderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ChatModelToCreate {

 String get displayName; String get modelId; String get modelType; int get modelProvider;
/// Create a copy of ChatModelToCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatModelToCreateCopyWith<ChatModelToCreate> get copyWith => _$ChatModelToCreateCopyWithImpl<ChatModelToCreate>(this as ChatModelToCreate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatModelToCreate&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelProvider, modelProvider) || other.modelProvider == modelProvider));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,modelId,modelType,modelProvider);

@override
String toString() {
  return 'ChatModelToCreate(displayName: $displayName, modelId: $modelId, modelType: $modelType, modelProvider: $modelProvider)';
}


}

/// @nodoc
abstract mixin class $ChatModelToCreateCopyWith<$Res>  {
  factory $ChatModelToCreateCopyWith(ChatModelToCreate value, $Res Function(ChatModelToCreate) _then) = _$ChatModelToCreateCopyWithImpl;
@useResult
$Res call({
 String displayName, String modelId, String modelType, int modelProvider
});




}
/// @nodoc
class _$ChatModelToCreateCopyWithImpl<$Res>
    implements $ChatModelToCreateCopyWith<$Res> {
  _$ChatModelToCreateCopyWithImpl(this._self, this._then);

  final ChatModelToCreate _self;
  final $Res Function(ChatModelToCreate) _then;

/// Create a copy of ChatModelToCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? modelId = null,Object? modelType = null,Object? modelProvider = null,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelProvider: null == modelProvider ? _self.modelProvider : modelProvider // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatModelToCreate].
extension ChatModelToCreatePatterns on ChatModelToCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatModelToCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatModelToCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatModelToCreate value)  $default,){
final _that = this;
switch (_that) {
case _ChatModelToCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatModelToCreate value)?  $default,){
final _that = this;
switch (_that) {
case _ChatModelToCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName,  String modelId,  String modelType,  int modelProvider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatModelToCreate() when $default != null:
return $default(_that.displayName,_that.modelId,_that.modelType,_that.modelProvider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName,  String modelId,  String modelType,  int modelProvider)  $default,) {final _that = this;
switch (_that) {
case _ChatModelToCreate():
return $default(_that.displayName,_that.modelId,_that.modelType,_that.modelProvider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName,  String modelId,  String modelType,  int modelProvider)?  $default,) {final _that = this;
switch (_that) {
case _ChatModelToCreate() when $default != null:
return $default(_that.displayName,_that.modelId,_that.modelType,_that.modelProvider);case _:
  return null;

}
}

}

/// @nodoc


class _ChatModelToCreate implements ChatModelToCreate {
  const _ChatModelToCreate({required this.displayName, required this.modelId, required this.modelType, required this.modelProvider});
  

@override final  String displayName;
@override final  String modelId;
@override final  String modelType;
@override final  int modelProvider;

/// Create a copy of ChatModelToCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatModelToCreateCopyWith<_ChatModelToCreate> get copyWith => __$ChatModelToCreateCopyWithImpl<_ChatModelToCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatModelToCreate&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelProvider, modelProvider) || other.modelProvider == modelProvider));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,modelId,modelType,modelProvider);

@override
String toString() {
  return 'ChatModelToCreate(displayName: $displayName, modelId: $modelId, modelType: $modelType, modelProvider: $modelProvider)';
}


}

/// @nodoc
abstract mixin class _$ChatModelToCreateCopyWith<$Res> implements $ChatModelToCreateCopyWith<$Res> {
  factory _$ChatModelToCreateCopyWith(_ChatModelToCreate value, $Res Function(_ChatModelToCreate) _then) = __$ChatModelToCreateCopyWithImpl;
@override @useResult
$Res call({
 String displayName, String modelId, String modelType, int modelProvider
});




}
/// @nodoc
class __$ChatModelToCreateCopyWithImpl<$Res>
    implements _$ChatModelToCreateCopyWith<$Res> {
  __$ChatModelToCreateCopyWithImpl(this._self, this._then);

  final _ChatModelToCreate _self;
  final $Res Function(_ChatModelToCreate) _then;

/// Create a copy of ChatModelToCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? modelId = null,Object? modelType = null,Object? modelProvider = null,}) {
  return _then(_ChatModelToCreate(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelProvider: null == modelProvider ? _self.modelProvider : modelProvider // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
