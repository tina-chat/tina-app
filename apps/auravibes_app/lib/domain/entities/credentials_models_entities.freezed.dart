// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credentials_models_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CredentialsModelEntity {

 String get id; String get modelId; DateTime get createdAt; DateTime get updatedAt; String get credentialsId;
/// Create a copy of CredentialsModelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredentialsModelEntityCopyWith<CredentialsModelEntity> get copyWith => _$CredentialsModelEntityCopyWithImpl<CredentialsModelEntity>(this as CredentialsModelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredentialsModelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.credentialsId, credentialsId) || other.credentialsId == credentialsId));
}


@override
int get hashCode => Object.hash(runtimeType,id,modelId,createdAt,updatedAt,credentialsId);

@override
String toString() {
  return 'CredentialsModelEntity(id: $id, modelId: $modelId, createdAt: $createdAt, updatedAt: $updatedAt, credentialsId: $credentialsId)';
}


}

/// @nodoc
abstract mixin class $CredentialsModelEntityCopyWith<$Res>  {
  factory $CredentialsModelEntityCopyWith(CredentialsModelEntity value, $Res Function(CredentialsModelEntity) _then) = _$CredentialsModelEntityCopyWithImpl;
@useResult
$Res call({
 String id, String modelId, DateTime createdAt, DateTime updatedAt, String credentialsId
});




}
/// @nodoc
class _$CredentialsModelEntityCopyWithImpl<$Res>
    implements $CredentialsModelEntityCopyWith<$Res> {
  _$CredentialsModelEntityCopyWithImpl(this._self, this._then);

  final CredentialsModelEntity _self;
  final $Res Function(CredentialsModelEntity) _then;

/// Create a copy of CredentialsModelEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelId = null,Object? createdAt = null,Object? updatedAt = null,Object? credentialsId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,credentialsId: null == credentialsId ? _self.credentialsId : credentialsId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CredentialsModelEntity].
extension CredentialsModelEntityPatterns on CredentialsModelEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CredentialsModelEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CredentialsModelEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CredentialsModelEntity value)  $default,){
final _that = this;
switch (_that) {
case _CredentialsModelEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CredentialsModelEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CredentialsModelEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String modelId,  DateTime createdAt,  DateTime updatedAt,  String credentialsId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CredentialsModelEntity() when $default != null:
return $default(_that.id,_that.modelId,_that.createdAt,_that.updatedAt,_that.credentialsId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String modelId,  DateTime createdAt,  DateTime updatedAt,  String credentialsId)  $default,) {final _that = this;
switch (_that) {
case _CredentialsModelEntity():
return $default(_that.id,_that.modelId,_that.createdAt,_that.updatedAt,_that.credentialsId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String modelId,  DateTime createdAt,  DateTime updatedAt,  String credentialsId)?  $default,) {final _that = this;
switch (_that) {
case _CredentialsModelEntity() when $default != null:
return $default(_that.id,_that.modelId,_that.createdAt,_that.updatedAt,_that.credentialsId);case _:
  return null;

}
}

}

/// @nodoc


class _CredentialsModelEntity implements CredentialsModelEntity {
  const _CredentialsModelEntity({required this.id, required this.modelId, required this.createdAt, required this.updatedAt, required this.credentialsId});
  

@override final  String id;
@override final  String modelId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String credentialsId;

/// Create a copy of CredentialsModelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CredentialsModelEntityCopyWith<_CredentialsModelEntity> get copyWith => __$CredentialsModelEntityCopyWithImpl<_CredentialsModelEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CredentialsModelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.credentialsId, credentialsId) || other.credentialsId == credentialsId));
}


@override
int get hashCode => Object.hash(runtimeType,id,modelId,createdAt,updatedAt,credentialsId);

@override
String toString() {
  return 'CredentialsModelEntity(id: $id, modelId: $modelId, createdAt: $createdAt, updatedAt: $updatedAt, credentialsId: $credentialsId)';
}


}

/// @nodoc
abstract mixin class _$CredentialsModelEntityCopyWith<$Res> implements $CredentialsModelEntityCopyWith<$Res> {
  factory _$CredentialsModelEntityCopyWith(_CredentialsModelEntity value, $Res Function(_CredentialsModelEntity) _then) = __$CredentialsModelEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String modelId, DateTime createdAt, DateTime updatedAt, String credentialsId
});




}
/// @nodoc
class __$CredentialsModelEntityCopyWithImpl<$Res>
    implements _$CredentialsModelEntityCopyWith<$Res> {
  __$CredentialsModelEntityCopyWithImpl(this._self, this._then);

  final _CredentialsModelEntity _self;
  final $Res Function(_CredentialsModelEntity) _then;

/// Create a copy of CredentialsModelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? modelId = null,Object? createdAt = null,Object? updatedAt = null,Object? credentialsId = null,}) {
  return _then(_CredentialsModelEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,credentialsId: null == credentialsId ? _self.credentialsId : credentialsId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CredentialsModelWithProviderEntity {

 CredentialsModelEntity get credentialsModel; CredentialsEntity get credentials; ApiModelProviderEntity get modelsProvider;
/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredentialsModelWithProviderEntityCopyWith<CredentialsModelWithProviderEntity> get copyWith => _$CredentialsModelWithProviderEntityCopyWithImpl<CredentialsModelWithProviderEntity>(this as CredentialsModelWithProviderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredentialsModelWithProviderEntity&&(identical(other.credentialsModel, credentialsModel) || other.credentialsModel == credentialsModel)&&(identical(other.credentials, credentials) || other.credentials == credentials)&&(identical(other.modelsProvider, modelsProvider) || other.modelsProvider == modelsProvider));
}


@override
int get hashCode => Object.hash(runtimeType,credentialsModel,credentials,modelsProvider);

@override
String toString() {
  return 'CredentialsModelWithProviderEntity(credentialsModel: $credentialsModel, credentials: $credentials, modelsProvider: $modelsProvider)';
}


}

/// @nodoc
abstract mixin class $CredentialsModelWithProviderEntityCopyWith<$Res>  {
  factory $CredentialsModelWithProviderEntityCopyWith(CredentialsModelWithProviderEntity value, $Res Function(CredentialsModelWithProviderEntity) _then) = _$CredentialsModelWithProviderEntityCopyWithImpl;
@useResult
$Res call({
 CredentialsModelEntity credentialsModel, CredentialsEntity credentials, ApiModelProviderEntity modelsProvider
});


$CredentialsModelEntityCopyWith<$Res> get credentialsModel;$CredentialsEntityCopyWith<$Res> get credentials;$ApiModelProviderEntityCopyWith<$Res> get modelsProvider;

}
/// @nodoc
class _$CredentialsModelWithProviderEntityCopyWithImpl<$Res>
    implements $CredentialsModelWithProviderEntityCopyWith<$Res> {
  _$CredentialsModelWithProviderEntityCopyWithImpl(this._self, this._then);

  final CredentialsModelWithProviderEntity _self;
  final $Res Function(CredentialsModelWithProviderEntity) _then;

/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? credentialsModel = null,Object? credentials = null,Object? modelsProvider = null,}) {
  return _then(_self.copyWith(
credentialsModel: null == credentialsModel ? _self.credentialsModel : credentialsModel // ignore: cast_nullable_to_non_nullable
as CredentialsModelEntity,credentials: null == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as CredentialsEntity,modelsProvider: null == modelsProvider ? _self.modelsProvider : modelsProvider // ignore: cast_nullable_to_non_nullable
as ApiModelProviderEntity,
  ));
}
/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CredentialsModelEntityCopyWith<$Res> get credentialsModel {
  
  return $CredentialsModelEntityCopyWith<$Res>(_self.credentialsModel, (value) {
    return _then(_self.copyWith(credentialsModel: value));
  });
}/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CredentialsEntityCopyWith<$Res> get credentials {
  
  return $CredentialsEntityCopyWith<$Res>(_self.credentials, (value) {
    return _then(_self.copyWith(credentials: value));
  });
}/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiModelProviderEntityCopyWith<$Res> get modelsProvider {
  
  return $ApiModelProviderEntityCopyWith<$Res>(_self.modelsProvider, (value) {
    return _then(_self.copyWith(modelsProvider: value));
  });
}
}


/// Adds pattern-matching-related methods to [CredentialsModelWithProviderEntity].
extension CredentialsModelWithProviderEntityPatterns on CredentialsModelWithProviderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CredentialsModelWithProviderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CredentialsModelWithProviderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CredentialsModelWithProviderEntity value)  $default,){
final _that = this;
switch (_that) {
case _CredentialsModelWithProviderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CredentialsModelWithProviderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CredentialsModelWithProviderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CredentialsModelEntity credentialsModel,  CredentialsEntity credentials,  ApiModelProviderEntity modelsProvider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CredentialsModelWithProviderEntity() when $default != null:
return $default(_that.credentialsModel,_that.credentials,_that.modelsProvider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CredentialsModelEntity credentialsModel,  CredentialsEntity credentials,  ApiModelProviderEntity modelsProvider)  $default,) {final _that = this;
switch (_that) {
case _CredentialsModelWithProviderEntity():
return $default(_that.credentialsModel,_that.credentials,_that.modelsProvider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CredentialsModelEntity credentialsModel,  CredentialsEntity credentials,  ApiModelProviderEntity modelsProvider)?  $default,) {final _that = this;
switch (_that) {
case _CredentialsModelWithProviderEntity() when $default != null:
return $default(_that.credentialsModel,_that.credentials,_that.modelsProvider);case _:
  return null;

}
}

}

/// @nodoc


class _CredentialsModelWithProviderEntity implements CredentialsModelWithProviderEntity {
  const _CredentialsModelWithProviderEntity({required this.credentialsModel, required this.credentials, required this.modelsProvider});
  

@override final  CredentialsModelEntity credentialsModel;
@override final  CredentialsEntity credentials;
@override final  ApiModelProviderEntity modelsProvider;

/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CredentialsModelWithProviderEntityCopyWith<_CredentialsModelWithProviderEntity> get copyWith => __$CredentialsModelWithProviderEntityCopyWithImpl<_CredentialsModelWithProviderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CredentialsModelWithProviderEntity&&(identical(other.credentialsModel, credentialsModel) || other.credentialsModel == credentialsModel)&&(identical(other.credentials, credentials) || other.credentials == credentials)&&(identical(other.modelsProvider, modelsProvider) || other.modelsProvider == modelsProvider));
}


@override
int get hashCode => Object.hash(runtimeType,credentialsModel,credentials,modelsProvider);

@override
String toString() {
  return 'CredentialsModelWithProviderEntity(credentialsModel: $credentialsModel, credentials: $credentials, modelsProvider: $modelsProvider)';
}


}

/// @nodoc
abstract mixin class _$CredentialsModelWithProviderEntityCopyWith<$Res> implements $CredentialsModelWithProviderEntityCopyWith<$Res> {
  factory _$CredentialsModelWithProviderEntityCopyWith(_CredentialsModelWithProviderEntity value, $Res Function(_CredentialsModelWithProviderEntity) _then) = __$CredentialsModelWithProviderEntityCopyWithImpl;
@override @useResult
$Res call({
 CredentialsModelEntity credentialsModel, CredentialsEntity credentials, ApiModelProviderEntity modelsProvider
});


@override $CredentialsModelEntityCopyWith<$Res> get credentialsModel;@override $CredentialsEntityCopyWith<$Res> get credentials;@override $ApiModelProviderEntityCopyWith<$Res> get modelsProvider;

}
/// @nodoc
class __$CredentialsModelWithProviderEntityCopyWithImpl<$Res>
    implements _$CredentialsModelWithProviderEntityCopyWith<$Res> {
  __$CredentialsModelWithProviderEntityCopyWithImpl(this._self, this._then);

  final _CredentialsModelWithProviderEntity _self;
  final $Res Function(_CredentialsModelWithProviderEntity) _then;

/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? credentialsModel = null,Object? credentials = null,Object? modelsProvider = null,}) {
  return _then(_CredentialsModelWithProviderEntity(
credentialsModel: null == credentialsModel ? _self.credentialsModel : credentialsModel // ignore: cast_nullable_to_non_nullable
as CredentialsModelEntity,credentials: null == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as CredentialsEntity,modelsProvider: null == modelsProvider ? _self.modelsProvider : modelsProvider // ignore: cast_nullable_to_non_nullable
as ApiModelProviderEntity,
  ));
}

/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CredentialsModelEntityCopyWith<$Res> get credentialsModel {
  
  return $CredentialsModelEntityCopyWith<$Res>(_self.credentialsModel, (value) {
    return _then(_self.copyWith(credentialsModel: value));
  });
}/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CredentialsEntityCopyWith<$Res> get credentials {
  
  return $CredentialsEntityCopyWith<$Res>(_self.credentials, (value) {
    return _then(_self.copyWith(credentials: value));
  });
}/// Create a copy of CredentialsModelWithProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiModelProviderEntityCopyWith<$Res> get modelsProvider {
  
  return $ApiModelProviderEntityCopyWith<$Res>(_self.modelsProvider, (value) {
    return _then(_self.copyWith(modelsProvider: value));
  });
}
}

/// @nodoc
mixin _$CredentialsModelsFilter {

 List<String>? get workspaces; List<CredentialsModelType>? get types;
/// Create a copy of CredentialsModelsFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredentialsModelsFilterCopyWith<CredentialsModelsFilter> get copyWith => _$CredentialsModelsFilterCopyWithImpl<CredentialsModelsFilter>(this as CredentialsModelsFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredentialsModelsFilter&&const DeepCollectionEquality().equals(other.workspaces, workspaces)&&const DeepCollectionEquality().equals(other.types, types));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(workspaces),const DeepCollectionEquality().hash(types));

@override
String toString() {
  return 'CredentialsModelsFilter(workspaces: $workspaces, types: $types)';
}


}

/// @nodoc
abstract mixin class $CredentialsModelsFilterCopyWith<$Res>  {
  factory $CredentialsModelsFilterCopyWith(CredentialsModelsFilter value, $Res Function(CredentialsModelsFilter) _then) = _$CredentialsModelsFilterCopyWithImpl;
@useResult
$Res call({
 List<String>? workspaces, List<CredentialsModelType>? types
});




}
/// @nodoc
class _$CredentialsModelsFilterCopyWithImpl<$Res>
    implements $CredentialsModelsFilterCopyWith<$Res> {
  _$CredentialsModelsFilterCopyWithImpl(this._self, this._then);

  final CredentialsModelsFilter _self;
  final $Res Function(CredentialsModelsFilter) _then;

/// Create a copy of CredentialsModelsFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspaces = freezed,Object? types = freezed,}) {
  return _then(_self.copyWith(
workspaces: freezed == workspaces ? _self.workspaces : workspaces // ignore: cast_nullable_to_non_nullable
as List<String>?,types: freezed == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<CredentialsModelType>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CredentialsModelsFilter].
extension CredentialsModelsFilterPatterns on CredentialsModelsFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CredentialsModelsFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CredentialsModelsFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CredentialsModelsFilter value)  $default,){
final _that = this;
switch (_that) {
case _CredentialsModelsFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CredentialsModelsFilter value)?  $default,){
final _that = this;
switch (_that) {
case _CredentialsModelsFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? workspaces,  List<CredentialsModelType>? types)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CredentialsModelsFilter() when $default != null:
return $default(_that.workspaces,_that.types);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? workspaces,  List<CredentialsModelType>? types)  $default,) {final _that = this;
switch (_that) {
case _CredentialsModelsFilter():
return $default(_that.workspaces,_that.types);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? workspaces,  List<CredentialsModelType>? types)?  $default,) {final _that = this;
switch (_that) {
case _CredentialsModelsFilter() when $default != null:
return $default(_that.workspaces,_that.types);case _:
  return null;

}
}

}

/// @nodoc


class _CredentialsModelsFilter implements CredentialsModelsFilter {
  const _CredentialsModelsFilter({final  List<String>? workspaces, final  List<CredentialsModelType>? types}): _workspaces = workspaces,_types = types;
  

 final  List<String>? _workspaces;
@override List<String>? get workspaces {
  final value = _workspaces;
  if (value == null) return null;
  if (_workspaces is EqualUnmodifiableListView) return _workspaces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CredentialsModelType>? _types;
@override List<CredentialsModelType>? get types {
  final value = _types;
  if (value == null) return null;
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CredentialsModelsFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CredentialsModelsFilterCopyWith<_CredentialsModelsFilter> get copyWith => __$CredentialsModelsFilterCopyWithImpl<_CredentialsModelsFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CredentialsModelsFilter&&const DeepCollectionEquality().equals(other._workspaces, _workspaces)&&const DeepCollectionEquality().equals(other._types, _types));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workspaces),const DeepCollectionEquality().hash(_types));

@override
String toString() {
  return 'CredentialsModelsFilter(workspaces: $workspaces, types: $types)';
}


}

/// @nodoc
abstract mixin class _$CredentialsModelsFilterCopyWith<$Res> implements $CredentialsModelsFilterCopyWith<$Res> {
  factory _$CredentialsModelsFilterCopyWith(_CredentialsModelsFilter value, $Res Function(_CredentialsModelsFilter) _then) = __$CredentialsModelsFilterCopyWithImpl;
@override @useResult
$Res call({
 List<String>? workspaces, List<CredentialsModelType>? types
});




}
/// @nodoc
class __$CredentialsModelsFilterCopyWithImpl<$Res>
    implements _$CredentialsModelsFilterCopyWith<$Res> {
  __$CredentialsModelsFilterCopyWithImpl(this._self, this._then);

  final _CredentialsModelsFilter _self;
  final $Res Function(_CredentialsModelsFilter) _then;

/// Create a copy of CredentialsModelsFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspaces = freezed,Object? types = freezed,}) {
  return _then(_CredentialsModelsFilter(
workspaces: freezed == workspaces ? _self._workspaces : workspaces // ignore: cast_nullable_to_non_nullable
as List<String>?,types: freezed == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<CredentialsModelType>?,
  ));
}


}

/// @nodoc
mixin _$CredentialModelToCreate {

 String get modelId; String get credentialsId;
/// Create a copy of CredentialModelToCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredentialModelToCreateCopyWith<CredentialModelToCreate> get copyWith => _$CredentialModelToCreateCopyWithImpl<CredentialModelToCreate>(this as CredentialModelToCreate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredentialModelToCreate&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.credentialsId, credentialsId) || other.credentialsId == credentialsId));
}


@override
int get hashCode => Object.hash(runtimeType,modelId,credentialsId);

@override
String toString() {
  return 'CredentialModelToCreate(modelId: $modelId, credentialsId: $credentialsId)';
}


}

/// @nodoc
abstract mixin class $CredentialModelToCreateCopyWith<$Res>  {
  factory $CredentialModelToCreateCopyWith(CredentialModelToCreate value, $Res Function(CredentialModelToCreate) _then) = _$CredentialModelToCreateCopyWithImpl;
@useResult
$Res call({
 String modelId, String credentialsId
});




}
/// @nodoc
class _$CredentialModelToCreateCopyWithImpl<$Res>
    implements $CredentialModelToCreateCopyWith<$Res> {
  _$CredentialModelToCreateCopyWithImpl(this._self, this._then);

  final CredentialModelToCreate _self;
  final $Res Function(CredentialModelToCreate) _then;

/// Create a copy of CredentialModelToCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelId = null,Object? credentialsId = null,}) {
  return _then(_self.copyWith(
modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,credentialsId: null == credentialsId ? _self.credentialsId : credentialsId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CredentialModelToCreate].
extension CredentialModelToCreatePatterns on CredentialModelToCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CredentialModelToCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CredentialModelToCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CredentialModelToCreate value)  $default,){
final _that = this;
switch (_that) {
case _CredentialModelToCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CredentialModelToCreate value)?  $default,){
final _that = this;
switch (_that) {
case _CredentialModelToCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String modelId,  String credentialsId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CredentialModelToCreate() when $default != null:
return $default(_that.modelId,_that.credentialsId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String modelId,  String credentialsId)  $default,) {final _that = this;
switch (_that) {
case _CredentialModelToCreate():
return $default(_that.modelId,_that.credentialsId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String modelId,  String credentialsId)?  $default,) {final _that = this;
switch (_that) {
case _CredentialModelToCreate() when $default != null:
return $default(_that.modelId,_that.credentialsId);case _:
  return null;

}
}

}

/// @nodoc


class _CredentialModelToCreate implements CredentialModelToCreate {
  const _CredentialModelToCreate({required this.modelId, required this.credentialsId});
  

@override final  String modelId;
@override final  String credentialsId;

/// Create a copy of CredentialModelToCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CredentialModelToCreateCopyWith<_CredentialModelToCreate> get copyWith => __$CredentialModelToCreateCopyWithImpl<_CredentialModelToCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CredentialModelToCreate&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.credentialsId, credentialsId) || other.credentialsId == credentialsId));
}


@override
int get hashCode => Object.hash(runtimeType,modelId,credentialsId);

@override
String toString() {
  return 'CredentialModelToCreate(modelId: $modelId, credentialsId: $credentialsId)';
}


}

/// @nodoc
abstract mixin class _$CredentialModelToCreateCopyWith<$Res> implements $CredentialModelToCreateCopyWith<$Res> {
  factory _$CredentialModelToCreateCopyWith(_CredentialModelToCreate value, $Res Function(_CredentialModelToCreate) _then) = __$CredentialModelToCreateCopyWithImpl;
@override @useResult
$Res call({
 String modelId, String credentialsId
});




}
/// @nodoc
class __$CredentialModelToCreateCopyWithImpl<$Res>
    implements _$CredentialModelToCreateCopyWith<$Res> {
  __$CredentialModelToCreateCopyWithImpl(this._self, this._then);

  final _CredentialModelToCreate _self;
  final $Res Function(_CredentialModelToCreate) _then;

/// Create a copy of CredentialModelToCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelId = null,Object? credentialsId = null,}) {
  return _then(_CredentialModelToCreate(
modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,credentialsId: null == credentialsId ? _self.credentialsId : credentialsId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
