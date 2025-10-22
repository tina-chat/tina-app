// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModelProviderEntity {

 int get id; String get name; ChatModelType get type; String get key; String? get url; DateTime get createdAt; DateTime get updatedAt; int get workspaceId;
/// Create a copy of ModelProviderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelProviderEntityCopyWith<ModelProviderEntity> get copyWith => _$ModelProviderEntityCopyWithImpl<ModelProviderEntity>(this as ModelProviderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelProviderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,key,url,createdAt,updatedAt,workspaceId);

@override
String toString() {
  return 'ModelProviderEntity(id: $id, name: $name, type: $type, key: $key, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, workspaceId: $workspaceId)';
}


}

/// @nodoc
abstract mixin class $ModelProviderEntityCopyWith<$Res>  {
  factory $ModelProviderEntityCopyWith(ModelProviderEntity value, $Res Function(ModelProviderEntity) _then) = _$ModelProviderEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, ChatModelType type, String key, String? url, DateTime createdAt, DateTime updatedAt, int workspaceId
});




}
/// @nodoc
class _$ModelProviderEntityCopyWithImpl<$Res>
    implements $ModelProviderEntityCopyWith<$Res> {
  _$ModelProviderEntityCopyWithImpl(this._self, this._then);

  final ModelProviderEntity _self;
  final $Res Function(ModelProviderEntity) _then;

/// Create a copy of ModelProviderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? key = null,Object? url = freezed,Object? createdAt = null,Object? updatedAt = null,Object? workspaceId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatModelType,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelProviderEntity].
extension ModelProviderEntityPatterns on ModelProviderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelProviderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelProviderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelProviderEntity value)  $default,){
final _that = this;
switch (_that) {
case _ModelProviderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelProviderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ModelProviderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  ChatModelType type,  String key,  String? url,  DateTime createdAt,  DateTime updatedAt,  int workspaceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelProviderEntity() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.key,_that.url,_that.createdAt,_that.updatedAt,_that.workspaceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  ChatModelType type,  String key,  String? url,  DateTime createdAt,  DateTime updatedAt,  int workspaceId)  $default,) {final _that = this;
switch (_that) {
case _ModelProviderEntity():
return $default(_that.id,_that.name,_that.type,_that.key,_that.url,_that.createdAt,_that.updatedAt,_that.workspaceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  ChatModelType type,  String key,  String? url,  DateTime createdAt,  DateTime updatedAt,  int workspaceId)?  $default,) {final _that = this;
switch (_that) {
case _ModelProviderEntity() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.key,_that.url,_that.createdAt,_that.updatedAt,_that.workspaceId);case _:
  return null;

}
}

}

/// @nodoc


class _ModelProviderEntity implements ModelProviderEntity {
  const _ModelProviderEntity({required this.id, required this.name, required this.type, required this.key, this.url, required this.createdAt, required this.updatedAt, required this.workspaceId});
  

@override final  int id;
@override final  String name;
@override final  ChatModelType type;
@override final  String key;
@override final  String? url;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int workspaceId;

/// Create a copy of ModelProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelProviderEntityCopyWith<_ModelProviderEntity> get copyWith => __$ModelProviderEntityCopyWithImpl<_ModelProviderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelProviderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,key,url,createdAt,updatedAt,workspaceId);

@override
String toString() {
  return 'ModelProviderEntity(id: $id, name: $name, type: $type, key: $key, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, workspaceId: $workspaceId)';
}


}

/// @nodoc
abstract mixin class _$ModelProviderEntityCopyWith<$Res> implements $ModelProviderEntityCopyWith<$Res> {
  factory _$ModelProviderEntityCopyWith(_ModelProviderEntity value, $Res Function(_ModelProviderEntity) _then) = __$ModelProviderEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, ChatModelType type, String key, String? url, DateTime createdAt, DateTime updatedAt, int workspaceId
});




}
/// @nodoc
class __$ModelProviderEntityCopyWithImpl<$Res>
    implements _$ModelProviderEntityCopyWith<$Res> {
  __$ModelProviderEntityCopyWithImpl(this._self, this._then);

  final _ModelProviderEntity _self;
  final $Res Function(_ModelProviderEntity) _then;

/// Create a copy of ModelProviderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? key = null,Object? url = freezed,Object? createdAt = null,Object? updatedAt = null,Object? workspaceId = null,}) {
  return _then(_ModelProviderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatModelType,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ModelProviderToCreate {

 String get name; ChatModelType get type; String get key; int get workspaceId; String? get url;
/// Create a copy of ModelProviderToCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelProviderToCreateCopyWith<ModelProviderToCreate> get copyWith => _$ModelProviderToCreateCopyWithImpl<ModelProviderToCreate>(this as ModelProviderToCreate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelProviderToCreate&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,key,workspaceId,url);

@override
String toString() {
  return 'ModelProviderToCreate(name: $name, type: $type, key: $key, workspaceId: $workspaceId, url: $url)';
}


}

/// @nodoc
abstract mixin class $ModelProviderToCreateCopyWith<$Res>  {
  factory $ModelProviderToCreateCopyWith(ModelProviderToCreate value, $Res Function(ModelProviderToCreate) _then) = _$ModelProviderToCreateCopyWithImpl;
@useResult
$Res call({
 String name, ChatModelType type, String key, int workspaceId, String? url
});




}
/// @nodoc
class _$ModelProviderToCreateCopyWithImpl<$Res>
    implements $ModelProviderToCreateCopyWith<$Res> {
  _$ModelProviderToCreateCopyWithImpl(this._self, this._then);

  final ModelProviderToCreate _self;
  final $Res Function(ModelProviderToCreate) _then;

/// Create a copy of ModelProviderToCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? key = null,Object? workspaceId = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatModelType,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelProviderToCreate].
extension ModelProviderToCreatePatterns on ModelProviderToCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelProviderToCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelProviderToCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelProviderToCreate value)  $default,){
final _that = this;
switch (_that) {
case _ModelProviderToCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelProviderToCreate value)?  $default,){
final _that = this;
switch (_that) {
case _ModelProviderToCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  ChatModelType type,  String key,  int workspaceId,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelProviderToCreate() when $default != null:
return $default(_that.name,_that.type,_that.key,_that.workspaceId,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  ChatModelType type,  String key,  int workspaceId,  String? url)  $default,) {final _that = this;
switch (_that) {
case _ModelProviderToCreate():
return $default(_that.name,_that.type,_that.key,_that.workspaceId,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  ChatModelType type,  String key,  int workspaceId,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _ModelProviderToCreate() when $default != null:
return $default(_that.name,_that.type,_that.key,_that.workspaceId,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _ModelProviderToCreate implements ModelProviderToCreate {
  const _ModelProviderToCreate({required this.name, required this.type, required this.key, required this.workspaceId, this.url});
  

@override final  String name;
@override final  ChatModelType type;
@override final  String key;
@override final  int workspaceId;
@override final  String? url;

/// Create a copy of ModelProviderToCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelProviderToCreateCopyWith<_ModelProviderToCreate> get copyWith => __$ModelProviderToCreateCopyWithImpl<_ModelProviderToCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelProviderToCreate&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,key,workspaceId,url);

@override
String toString() {
  return 'ModelProviderToCreate(name: $name, type: $type, key: $key, workspaceId: $workspaceId, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ModelProviderToCreateCopyWith<$Res> implements $ModelProviderToCreateCopyWith<$Res> {
  factory _$ModelProviderToCreateCopyWith(_ModelProviderToCreate value, $Res Function(_ModelProviderToCreate) _then) = __$ModelProviderToCreateCopyWithImpl;
@override @useResult
$Res call({
 String name, ChatModelType type, String key, int workspaceId, String? url
});




}
/// @nodoc
class __$ModelProviderToCreateCopyWithImpl<$Res>
    implements _$ModelProviderToCreateCopyWith<$Res> {
  __$ModelProviderToCreateCopyWithImpl(this._self, this._then);

  final _ModelProviderToCreate _self;
  final $Res Function(_ModelProviderToCreate) _then;

/// Create a copy of ModelProviderToCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? key = null,Object? workspaceId = null,Object? url = freezed,}) {
  return _then(_ModelProviderToCreate(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatModelType,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ModelProviderFilter {

 List<int>? get workspaces; List<ChatModelType>? get types;
/// Create a copy of ModelProviderFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelProviderFilterCopyWith<ModelProviderFilter> get copyWith => _$ModelProviderFilterCopyWithImpl<ModelProviderFilter>(this as ModelProviderFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelProviderFilter&&const DeepCollectionEquality().equals(other.workspaces, workspaces)&&const DeepCollectionEquality().equals(other.types, types));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(workspaces),const DeepCollectionEquality().hash(types));

@override
String toString() {
  return 'ModelProviderFilter(workspaces: $workspaces, types: $types)';
}


}

/// @nodoc
abstract mixin class $ModelProviderFilterCopyWith<$Res>  {
  factory $ModelProviderFilterCopyWith(ModelProviderFilter value, $Res Function(ModelProviderFilter) _then) = _$ModelProviderFilterCopyWithImpl;
@useResult
$Res call({
 List<int>? workspaces, List<ChatModelType>? types
});




}
/// @nodoc
class _$ModelProviderFilterCopyWithImpl<$Res>
    implements $ModelProviderFilterCopyWith<$Res> {
  _$ModelProviderFilterCopyWithImpl(this._self, this._then);

  final ModelProviderFilter _self;
  final $Res Function(ModelProviderFilter) _then;

/// Create a copy of ModelProviderFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspaces = freezed,Object? types = freezed,}) {
  return _then(_self.copyWith(
workspaces: freezed == workspaces ? _self.workspaces : workspaces // ignore: cast_nullable_to_non_nullable
as List<int>?,types: freezed == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<ChatModelType>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelProviderFilter].
extension ModelProviderFilterPatterns on ModelProviderFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelProviderFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelProviderFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelProviderFilter value)  $default,){
final _that = this;
switch (_that) {
case _ModelProviderFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelProviderFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ModelProviderFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int>? workspaces,  List<ChatModelType>? types)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelProviderFilter() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int>? workspaces,  List<ChatModelType>? types)  $default,) {final _that = this;
switch (_that) {
case _ModelProviderFilter():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int>? workspaces,  List<ChatModelType>? types)?  $default,) {final _that = this;
switch (_that) {
case _ModelProviderFilter() when $default != null:
return $default(_that.workspaces,_that.types);case _:
  return null;

}
}

}

/// @nodoc


class _ModelProviderFilter implements ModelProviderFilter {
  const _ModelProviderFilter({final  List<int>? workspaces, final  List<ChatModelType>? types}): _workspaces = workspaces,_types = types;
  

 final  List<int>? _workspaces;
@override List<int>? get workspaces {
  final value = _workspaces;
  if (value == null) return null;
  if (_workspaces is EqualUnmodifiableListView) return _workspaces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ChatModelType>? _types;
@override List<ChatModelType>? get types {
  final value = _types;
  if (value == null) return null;
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ModelProviderFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelProviderFilterCopyWith<_ModelProviderFilter> get copyWith => __$ModelProviderFilterCopyWithImpl<_ModelProviderFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelProviderFilter&&const DeepCollectionEquality().equals(other._workspaces, _workspaces)&&const DeepCollectionEquality().equals(other._types, _types));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workspaces),const DeepCollectionEquality().hash(_types));

@override
String toString() {
  return 'ModelProviderFilter(workspaces: $workspaces, types: $types)';
}


}

/// @nodoc
abstract mixin class _$ModelProviderFilterCopyWith<$Res> implements $ModelProviderFilterCopyWith<$Res> {
  factory _$ModelProviderFilterCopyWith(_ModelProviderFilter value, $Res Function(_ModelProviderFilter) _then) = __$ModelProviderFilterCopyWithImpl;
@override @useResult
$Res call({
 List<int>? workspaces, List<ChatModelType>? types
});




}
/// @nodoc
class __$ModelProviderFilterCopyWithImpl<$Res>
    implements _$ModelProviderFilterCopyWith<$Res> {
  __$ModelProviderFilterCopyWithImpl(this._self, this._then);

  final _ModelProviderFilter _self;
  final $Res Function(_ModelProviderFilter) _then;

/// Create a copy of ModelProviderFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspaces = freezed,Object? types = freezed,}) {
  return _then(_ModelProviderFilter(
workspaces: freezed == workspaces ? _self._workspaces : workspaces // ignore: cast_nullable_to_non_nullable
as List<int>?,types: freezed == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<ChatModelType>?,
  ));
}


}

// dart format on
