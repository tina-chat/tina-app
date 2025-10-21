// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_chat_model_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddChatModelModel {

 String? get name; ChatModelType? get type; String? get key; String? get url;
/// Create a copy of AddChatModelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddChatModelModelCopyWith<AddChatModelModel> get copyWith => _$AddChatModelModelCopyWithImpl<AddChatModelModel>(this as AddChatModelModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddChatModelModel&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,key,url);

@override
String toString() {
  return 'AddChatModelModel(name: $name, type: $type, key: $key, url: $url)';
}


}

/// @nodoc
abstract mixin class $AddChatModelModelCopyWith<$Res>  {
  factory $AddChatModelModelCopyWith(AddChatModelModel value, $Res Function(AddChatModelModel) _then) = _$AddChatModelModelCopyWithImpl;
@useResult
$Res call({
 String? name, ChatModelType? type, String? key, String? url
});




}
/// @nodoc
class _$AddChatModelModelCopyWithImpl<$Res>
    implements $AddChatModelModelCopyWith<$Res> {
  _$AddChatModelModelCopyWithImpl(this._self, this._then);

  final AddChatModelModel _self;
  final $Res Function(AddChatModelModel) _then;

/// Create a copy of AddChatModelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? type = freezed,Object? key = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatModelType?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddChatModelModel].
extension AddChatModelModelPatterns on AddChatModelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddChatModelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddChatModelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddChatModelModel value)  $default,){
final _that = this;
switch (_that) {
case _AddChatModelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddChatModelModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddChatModelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  ChatModelType? type,  String? key,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddChatModelModel() when $default != null:
return $default(_that.name,_that.type,_that.key,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  ChatModelType? type,  String? key,  String? url)  $default,) {final _that = this;
switch (_that) {
case _AddChatModelModel():
return $default(_that.name,_that.type,_that.key,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  ChatModelType? type,  String? key,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _AddChatModelModel() when $default != null:
return $default(_that.name,_that.type,_that.key,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _AddChatModelModel implements AddChatModelModel {
  const _AddChatModelModel({this.name, this.type, this.key, this.url});
  

@override final  String? name;
@override final  ChatModelType? type;
@override final  String? key;
@override final  String? url;

/// Create a copy of AddChatModelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddChatModelModelCopyWith<_AddChatModelModel> get copyWith => __$AddChatModelModelCopyWithImpl<_AddChatModelModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddChatModelModel&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.key, key) || other.key == key)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,key,url);

@override
String toString() {
  return 'AddChatModelModel(name: $name, type: $type, key: $key, url: $url)';
}


}

/// @nodoc
abstract mixin class _$AddChatModelModelCopyWith<$Res> implements $AddChatModelModelCopyWith<$Res> {
  factory _$AddChatModelModelCopyWith(_AddChatModelModel value, $Res Function(_AddChatModelModel) _then) = __$AddChatModelModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, ChatModelType? type, String? key, String? url
});




}
/// @nodoc
class __$AddChatModelModelCopyWithImpl<$Res>
    implements _$AddChatModelModelCopyWith<$Res> {
  __$AddChatModelModelCopyWithImpl(this._self, this._then);

  final _AddChatModelModel _self;
  final $Res Function(_AddChatModelModel) _then;

/// Create a copy of AddChatModelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? type = freezed,Object? key = freezed,Object? url = freezed,}) {
  return _then(_AddChatModelModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatModelType?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
