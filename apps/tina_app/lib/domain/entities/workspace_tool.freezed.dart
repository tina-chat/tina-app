// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_tool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkspaceToolEntity {

/// ID of the workspace this tool setting belongs to
 String get workspaceId;/// Type of tool (e.g., 'web_search', 'calculator', etc.)
 String get type;/// Tool configuration as JSON (optional)
 String? get config;/// Whether the tool is enabled for this workspace
 bool get isEnabled;/// Timestamp when this setting was created
 DateTime get createdAt;/// Timestamp when this setting was last updated
 DateTime get updatedAt;
/// Create a copy of WorkspaceToolEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceToolEntityCopyWith<WorkspaceToolEntity> get copyWith => _$WorkspaceToolEntityCopyWithImpl<WorkspaceToolEntity>(this as WorkspaceToolEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceToolEntity&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.config, config) || other.config == config)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,workspaceId,type,config,isEnabled,createdAt,updatedAt);

@override
String toString() {
  return 'WorkspaceToolEntity(workspaceId: $workspaceId, type: $type, config: $config, isEnabled: $isEnabled, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WorkspaceToolEntityCopyWith<$Res>  {
  factory $WorkspaceToolEntityCopyWith(WorkspaceToolEntity value, $Res Function(WorkspaceToolEntity) _then) = _$WorkspaceToolEntityCopyWithImpl;
@useResult
$Res call({
 String workspaceId, String type, String? config, bool isEnabled, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$WorkspaceToolEntityCopyWithImpl<$Res>
    implements $WorkspaceToolEntityCopyWith<$Res> {
  _$WorkspaceToolEntityCopyWithImpl(this._self, this._then);

  final WorkspaceToolEntity _self;
  final $Res Function(WorkspaceToolEntity) _then;

/// Create a copy of WorkspaceToolEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspaceId = null,Object? type = null,Object? config = freezed,Object? isEnabled = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as String?,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkspaceToolEntity].
extension WorkspaceToolEntityPatterns on WorkspaceToolEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspaceToolEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspaceToolEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspaceToolEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkspaceToolEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspaceToolEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspaceToolEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workspaceId,  String type,  String? config,  bool isEnabled,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspaceToolEntity() when $default != null:
return $default(_that.workspaceId,_that.type,_that.config,_that.isEnabled,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workspaceId,  String type,  String? config,  bool isEnabled,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkspaceToolEntity():
return $default(_that.workspaceId,_that.type,_that.config,_that.isEnabled,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workspaceId,  String type,  String? config,  bool isEnabled,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkspaceToolEntity() when $default != null:
return $default(_that.workspaceId,_that.type,_that.config,_that.isEnabled,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _WorkspaceToolEntity extends WorkspaceToolEntity {
  const _WorkspaceToolEntity({required this.workspaceId, required this.type, this.config, required this.isEnabled, required this.createdAt, required this.updatedAt}): super._();
  

/// ID of the workspace this tool setting belongs to
@override final  String workspaceId;
/// Type of tool (e.g., 'web_search', 'calculator', etc.)
@override final  String type;
/// Tool configuration as JSON (optional)
@override final  String? config;
/// Whether the tool is enabled for this workspace
@override final  bool isEnabled;
/// Timestamp when this setting was created
@override final  DateTime createdAt;
/// Timestamp when this setting was last updated
@override final  DateTime updatedAt;

/// Create a copy of WorkspaceToolEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceToolEntityCopyWith<_WorkspaceToolEntity> get copyWith => __$WorkspaceToolEntityCopyWithImpl<_WorkspaceToolEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceToolEntity&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.config, config) || other.config == config)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,workspaceId,type,config,isEnabled,createdAt,updatedAt);

@override
String toString() {
  return 'WorkspaceToolEntity(workspaceId: $workspaceId, type: $type, config: $config, isEnabled: $isEnabled, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceToolEntityCopyWith<$Res> implements $WorkspaceToolEntityCopyWith<$Res> {
  factory _$WorkspaceToolEntityCopyWith(_WorkspaceToolEntity value, $Res Function(_WorkspaceToolEntity) _then) = __$WorkspaceToolEntityCopyWithImpl;
@override @useResult
$Res call({
 String workspaceId, String type, String? config, bool isEnabled, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$WorkspaceToolEntityCopyWithImpl<$Res>
    implements _$WorkspaceToolEntityCopyWith<$Res> {
  __$WorkspaceToolEntityCopyWithImpl(this._self, this._then);

  final _WorkspaceToolEntity _self;
  final $Res Function(_WorkspaceToolEntity) _then;

/// Create a copy of WorkspaceToolEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspaceId = null,Object? type = null,Object? config = freezed,Object? isEnabled = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WorkspaceToolEntity(
workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as String?,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$WorkspaceToolToCreate {

/// Type of tool (e.g., 'web_search', 'calculator', etc.)
 String get type;/// Tool configuration as JSON (optional)
 String? get config;/// Whether the tool should be enabled (defaults to true)
 bool? get isEnabled;
/// Create a copy of WorkspaceToolToCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceToolToCreateCopyWith<WorkspaceToolToCreate> get copyWith => _$WorkspaceToolToCreateCopyWithImpl<WorkspaceToolToCreate>(this as WorkspaceToolToCreate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceToolToCreate&&(identical(other.type, type) || other.type == type)&&(identical(other.config, config) || other.config == config)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,type,config,isEnabled);

@override
String toString() {
  return 'WorkspaceToolToCreate(type: $type, config: $config, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $WorkspaceToolToCreateCopyWith<$Res>  {
  factory $WorkspaceToolToCreateCopyWith(WorkspaceToolToCreate value, $Res Function(WorkspaceToolToCreate) _then) = _$WorkspaceToolToCreateCopyWithImpl;
@useResult
$Res call({
 String type, String? config, bool? isEnabled
});




}
/// @nodoc
class _$WorkspaceToolToCreateCopyWithImpl<$Res>
    implements $WorkspaceToolToCreateCopyWith<$Res> {
  _$WorkspaceToolToCreateCopyWithImpl(this._self, this._then);

  final WorkspaceToolToCreate _self;
  final $Res Function(WorkspaceToolToCreate) _then;

/// Create a copy of WorkspaceToolToCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? config = freezed,Object? isEnabled = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as String?,isEnabled: freezed == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkspaceToolToCreate].
extension WorkspaceToolToCreatePatterns on WorkspaceToolToCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspaceToolToCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspaceToolToCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspaceToolToCreate value)  $default,){
final _that = this;
switch (_that) {
case _WorkspaceToolToCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspaceToolToCreate value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspaceToolToCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String? config,  bool? isEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspaceToolToCreate() when $default != null:
return $default(_that.type,_that.config,_that.isEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String? config,  bool? isEnabled)  $default,) {final _that = this;
switch (_that) {
case _WorkspaceToolToCreate():
return $default(_that.type,_that.config,_that.isEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String? config,  bool? isEnabled)?  $default,) {final _that = this;
switch (_that) {
case _WorkspaceToolToCreate() when $default != null:
return $default(_that.type,_that.config,_that.isEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _WorkspaceToolToCreate extends WorkspaceToolToCreate {
  const _WorkspaceToolToCreate({required this.type, this.config, this.isEnabled}): super._();
  

/// Type of tool (e.g., 'web_search', 'calculator', etc.)
@override final  String type;
/// Tool configuration as JSON (optional)
@override final  String? config;
/// Whether the tool should be enabled (defaults to true)
@override final  bool? isEnabled;

/// Create a copy of WorkspaceToolToCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceToolToCreateCopyWith<_WorkspaceToolToCreate> get copyWith => __$WorkspaceToolToCreateCopyWithImpl<_WorkspaceToolToCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceToolToCreate&&(identical(other.type, type) || other.type == type)&&(identical(other.config, config) || other.config == config)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,type,config,isEnabled);

@override
String toString() {
  return 'WorkspaceToolToCreate(type: $type, config: $config, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceToolToCreateCopyWith<$Res> implements $WorkspaceToolToCreateCopyWith<$Res> {
  factory _$WorkspaceToolToCreateCopyWith(_WorkspaceToolToCreate value, $Res Function(_WorkspaceToolToCreate) _then) = __$WorkspaceToolToCreateCopyWithImpl;
@override @useResult
$Res call({
 String type, String? config, bool? isEnabled
});




}
/// @nodoc
class __$WorkspaceToolToCreateCopyWithImpl<$Res>
    implements _$WorkspaceToolToCreateCopyWith<$Res> {
  __$WorkspaceToolToCreateCopyWithImpl(this._self, this._then);

  final _WorkspaceToolToCreate _self;
  final $Res Function(_WorkspaceToolToCreate) _then;

/// Create a copy of WorkspaceToolToCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? config = freezed,Object? isEnabled = freezed,}) {
  return _then(_WorkspaceToolToCreate(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as String?,isEnabled: freezed == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
