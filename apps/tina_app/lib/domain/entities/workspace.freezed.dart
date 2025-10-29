// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkspaceEntity {

/// Unique identifier for the workspace
 String get id;/// Human-readable name of the workspace
 String get name;/// Type of workspace (local or remote)
 WorkspaceType get type;/// URL for remote workspaces, null for local workspaces
 String? get url;/// Timestamp when the workspace was created
 DateTime get createdAt;/// Timestamp when the workspace was last updated
 DateTime get updatedAt;
/// Create a copy of WorkspaceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceEntityCopyWith<WorkspaceEntity> get copyWith => _$WorkspaceEntityCopyWithImpl<WorkspaceEntity>(this as WorkspaceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,url,createdAt,updatedAt);

@override
String toString() {
  return 'WorkspaceEntity(id: $id, name: $name, type: $type, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WorkspaceEntityCopyWith<$Res>  {
  factory $WorkspaceEntityCopyWith(WorkspaceEntity value, $Res Function(WorkspaceEntity) _then) = _$WorkspaceEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, WorkspaceType type, String? url, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$WorkspaceEntityCopyWithImpl<$Res>
    implements $WorkspaceEntityCopyWith<$Res> {
  _$WorkspaceEntityCopyWithImpl(this._self, this._then);

  final WorkspaceEntity _self;
  final $Res Function(WorkspaceEntity) _then;

/// Create a copy of WorkspaceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? url = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkspaceType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkspaceEntity].
extension WorkspaceEntityPatterns on WorkspaceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspaceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspaceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspaceEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkspaceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspaceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspaceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  WorkspaceType type,  String? url,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspaceEntity() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.url,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  WorkspaceType type,  String? url,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkspaceEntity():
return $default(_that.id,_that.name,_that.type,_that.url,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  WorkspaceType type,  String? url,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkspaceEntity() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.url,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _WorkspaceEntity extends WorkspaceEntity {
  const _WorkspaceEntity({required this.id, required this.name, required this.type, this.url, required this.createdAt, required this.updatedAt}): super._();
  

/// Unique identifier for the workspace
@override final  String id;
/// Human-readable name of the workspace
@override final  String name;
/// Type of workspace (local or remote)
@override final  WorkspaceType type;
/// URL for remote workspaces, null for local workspaces
@override final  String? url;
/// Timestamp when the workspace was created
@override final  DateTime createdAt;
/// Timestamp when the workspace was last updated
@override final  DateTime updatedAt;

/// Create a copy of WorkspaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceEntityCopyWith<_WorkspaceEntity> get copyWith => __$WorkspaceEntityCopyWithImpl<_WorkspaceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,url,createdAt,updatedAt);

@override
String toString() {
  return 'WorkspaceEntity(id: $id, name: $name, type: $type, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceEntityCopyWith<$Res> implements $WorkspaceEntityCopyWith<$Res> {
  factory _$WorkspaceEntityCopyWith(_WorkspaceEntity value, $Res Function(_WorkspaceEntity) _then) = __$WorkspaceEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, WorkspaceType type, String? url, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$WorkspaceEntityCopyWithImpl<$Res>
    implements _$WorkspaceEntityCopyWith<$Res> {
  __$WorkspaceEntityCopyWithImpl(this._self, this._then);

  final _WorkspaceEntity _self;
  final $Res Function(_WorkspaceEntity) _then;

/// Create a copy of WorkspaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? url = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WorkspaceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkspaceType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$WorkspaceToCreate {

/// Human-readable name of the workspace
 String get name;/// Type of workspace (local or remote)
 WorkspaceType get type;/// URL for remote workspaces, null for local workspaces
 String? get url;
/// Create a copy of WorkspaceToCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceToCreateCopyWith<WorkspaceToCreate> get copyWith => _$WorkspaceToCreateCopyWithImpl<WorkspaceToCreate>(this as WorkspaceToCreate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceToCreate&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,url);

@override
String toString() {
  return 'WorkspaceToCreate(name: $name, type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class $WorkspaceToCreateCopyWith<$Res>  {
  factory $WorkspaceToCreateCopyWith(WorkspaceToCreate value, $Res Function(WorkspaceToCreate) _then) = _$WorkspaceToCreateCopyWithImpl;
@useResult
$Res call({
 String name, WorkspaceType type, String? url
});




}
/// @nodoc
class _$WorkspaceToCreateCopyWithImpl<$Res>
    implements $WorkspaceToCreateCopyWith<$Res> {
  _$WorkspaceToCreateCopyWithImpl(this._self, this._then);

  final WorkspaceToCreate _self;
  final $Res Function(WorkspaceToCreate) _then;

/// Create a copy of WorkspaceToCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkspaceType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkspaceToCreate].
extension WorkspaceToCreatePatterns on WorkspaceToCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspaceToCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspaceToCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspaceToCreate value)  $default,){
final _that = this;
switch (_that) {
case _WorkspaceToCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspaceToCreate value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspaceToCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  WorkspaceType type,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspaceToCreate() when $default != null:
return $default(_that.name,_that.type,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  WorkspaceType type,  String? url)  $default,) {final _that = this;
switch (_that) {
case _WorkspaceToCreate():
return $default(_that.name,_that.type,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  WorkspaceType type,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _WorkspaceToCreate() when $default != null:
return $default(_that.name,_that.type,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _WorkspaceToCreate extends WorkspaceToCreate {
  const _WorkspaceToCreate({required this.name, required this.type, this.url}): super._();
  

/// Human-readable name of the workspace
@override final  String name;
/// Type of workspace (local or remote)
@override final  WorkspaceType type;
/// URL for remote workspaces, null for local workspaces
@override final  String? url;

/// Create a copy of WorkspaceToCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceToCreateCopyWith<_WorkspaceToCreate> get copyWith => __$WorkspaceToCreateCopyWithImpl<_WorkspaceToCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceToCreate&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,url);

@override
String toString() {
  return 'WorkspaceToCreate(name: $name, type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceToCreateCopyWith<$Res> implements $WorkspaceToCreateCopyWith<$Res> {
  factory _$WorkspaceToCreateCopyWith(_WorkspaceToCreate value, $Res Function(_WorkspaceToCreate) _then) = __$WorkspaceToCreateCopyWithImpl;
@override @useResult
$Res call({
 String name, WorkspaceType type, String? url
});




}
/// @nodoc
class __$WorkspaceToCreateCopyWithImpl<$Res>
    implements _$WorkspaceToCreateCopyWith<$Res> {
  __$WorkspaceToCreateCopyWithImpl(this._self, this._then);

  final _WorkspaceToCreate _self;
  final $Res Function(_WorkspaceToCreate) _then;

/// Create a copy of WorkspaceToCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? url = freezed,}) {
  return _then(_WorkspaceToCreate(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkspaceType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
