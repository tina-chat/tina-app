// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_calling_manager_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToolCallItem {

 String get id; String get name; String get argumentsRaw; Map<String, dynamic> get arguments;
/// Create a copy of ToolCallItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallItemCopyWith<ToolCallItem> get copyWith => _$ToolCallItemCopyWithImpl<ToolCallItem>(this as ToolCallItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCallItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.argumentsRaw, argumentsRaw) || other.argumentsRaw == argumentsRaw)&&const DeepCollectionEquality().equals(other.arguments, arguments));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,argumentsRaw,const DeepCollectionEquality().hash(arguments));

@override
String toString() {
  return 'ToolCallItem(id: $id, name: $name, argumentsRaw: $argumentsRaw, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $ToolCallItemCopyWith<$Res>  {
  factory $ToolCallItemCopyWith(ToolCallItem value, $Res Function(ToolCallItem) _then) = _$ToolCallItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, String argumentsRaw, Map<String, dynamic> arguments
});




}
/// @nodoc
class _$ToolCallItemCopyWithImpl<$Res>
    implements $ToolCallItemCopyWith<$Res> {
  _$ToolCallItemCopyWithImpl(this._self, this._then);

  final ToolCallItem _self;
  final $Res Function(ToolCallItem) _then;

/// Create a copy of ToolCallItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? argumentsRaw = null,Object? arguments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,argumentsRaw: null == argumentsRaw ? _self.argumentsRaw : argumentsRaw // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolCallItem].
extension ToolCallItemPatterns on ToolCallItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolCallItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolCallItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolCallItem value)  $default,){
final _that = this;
switch (_that) {
case _ToolCallItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolCallItem value)?  $default,){
final _that = this;
switch (_that) {
case _ToolCallItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String argumentsRaw,  Map<String, dynamic> arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCallItem() when $default != null:
return $default(_that.id,_that.name,_that.argumentsRaw,_that.arguments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String argumentsRaw,  Map<String, dynamic> arguments)  $default,) {final _that = this;
switch (_that) {
case _ToolCallItem():
return $default(_that.id,_that.name,_that.argumentsRaw,_that.arguments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String argumentsRaw,  Map<String, dynamic> arguments)?  $default,) {final _that = this;
switch (_that) {
case _ToolCallItem() when $default != null:
return $default(_that.id,_that.name,_that.argumentsRaw,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc


class _ToolCallItem implements ToolCallItem {
  const _ToolCallItem({required this.id, required this.name, required this.argumentsRaw, required final  Map<String, dynamic> arguments}): _arguments = arguments;
  

@override final  String id;
@override final  String name;
@override final  String argumentsRaw;
 final  Map<String, dynamic> _arguments;
@override Map<String, dynamic> get arguments {
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_arguments);
}


/// Create a copy of ToolCallItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCallItemCopyWith<_ToolCallItem> get copyWith => __$ToolCallItemCopyWithImpl<_ToolCallItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCallItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.argumentsRaw, argumentsRaw) || other.argumentsRaw == argumentsRaw)&&const DeepCollectionEquality().equals(other._arguments, _arguments));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,argumentsRaw,const DeepCollectionEquality().hash(_arguments));

@override
String toString() {
  return 'ToolCallItem(id: $id, name: $name, argumentsRaw: $argumentsRaw, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$ToolCallItemCopyWith<$Res> implements $ToolCallItemCopyWith<$Res> {
  factory _$ToolCallItemCopyWith(_ToolCallItem value, $Res Function(_ToolCallItem) _then) = __$ToolCallItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String argumentsRaw, Map<String, dynamic> arguments
});




}
/// @nodoc
class __$ToolCallItemCopyWithImpl<$Res>
    implements _$ToolCallItemCopyWith<$Res> {
  __$ToolCallItemCopyWithImpl(this._self, this._then);

  final _ToolCallItem _self;
  final $Res Function(_ToolCallItem) _then;

/// Create a copy of ToolCallItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? argumentsRaw = null,Object? arguments = null,}) {
  return _then(_ToolCallItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,argumentsRaw: null == argumentsRaw ? _self.argumentsRaw : argumentsRaw // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$ToolResponseItem {

 String get id; String get content;
/// Create a copy of ToolResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolResponseItemCopyWith<ToolResponseItem> get copyWith => _$ToolResponseItemCopyWithImpl<ToolResponseItem>(this as ToolResponseItem, _$identity);

  /// Serializes this ToolResponseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content);

@override
String toString() {
  return 'ToolResponseItem(id: $id, content: $content)';
}


}

/// @nodoc
abstract mixin class $ToolResponseItemCopyWith<$Res>  {
  factory $ToolResponseItemCopyWith(ToolResponseItem value, $Res Function(ToolResponseItem) _then) = _$ToolResponseItemCopyWithImpl;
@useResult
$Res call({
 String id, String content
});




}
/// @nodoc
class _$ToolResponseItemCopyWithImpl<$Res>
    implements $ToolResponseItemCopyWith<$Res> {
  _$ToolResponseItemCopyWithImpl(this._self, this._then);

  final ToolResponseItem _self;
  final $Res Function(ToolResponseItem) _then;

/// Create a copy of ToolResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolResponseItem].
extension ToolResponseItemPatterns on ToolResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _ToolResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _ToolResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolResponseItem() when $default != null:
return $default(_that.id,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content)  $default,) {final _that = this;
switch (_that) {
case _ToolResponseItem():
return $default(_that.id,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content)?  $default,) {final _that = this;
switch (_that) {
case _ToolResponseItem() when $default != null:
return $default(_that.id,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ToolResponseItem implements ToolResponseItem {
  const _ToolResponseItem({required this.id, required this.content});
  

@override final  String id;
@override final  String content;

/// Create a copy of ToolResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolResponseItemCopyWith<_ToolResponseItem> get copyWith => __$ToolResponseItemCopyWithImpl<_ToolResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolResponseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content);

@override
String toString() {
  return 'ToolResponseItem(id: $id, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ToolResponseItemCopyWith<$Res> implements $ToolResponseItemCopyWith<$Res> {
  factory _$ToolResponseItemCopyWith(_ToolResponseItem value, $Res Function(_ToolResponseItem) _then) = __$ToolResponseItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String content
});




}
/// @nodoc
class __$ToolResponseItemCopyWithImpl<$Res>
    implements _$ToolResponseItemCopyWith<$Res> {
  __$ToolResponseItemCopyWithImpl(this._self, this._then);

  final _ToolResponseItem _self;
  final $Res Function(_ToolResponseItem) _then;

/// Create a copy of ToolResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,}) {
  return _then(_ToolResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ToolExecution {

 String get id;
/// Create a copy of ToolExecution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolExecutionCopyWith<ToolExecution> get copyWith => _$ToolExecutionCopyWithImpl<ToolExecution>(this as ToolExecution, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolExecution&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ToolExecution(id: $id)';
}


}

/// @nodoc
abstract mixin class $ToolExecutionCopyWith<$Res>  {
  factory $ToolExecutionCopyWith(ToolExecution value, $Res Function(ToolExecution) _then) = _$ToolExecutionCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ToolExecutionCopyWithImpl<$Res>
    implements $ToolExecutionCopyWith<$Res> {
  _$ToolExecutionCopyWithImpl(this._self, this._then);

  final ToolExecution _self;
  final $Res Function(ToolExecution) _then;

/// Create a copy of ToolExecution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolExecution].
extension ToolExecutionPatterns on ToolExecution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolExecution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolExecution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolExecution value)  $default,){
final _that = this;
switch (_that) {
case _ToolExecution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolExecution value)?  $default,){
final _that = this;
switch (_that) {
case _ToolExecution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolExecution() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _ToolExecution():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _ToolExecution() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _ToolExecution implements ToolExecution {
  const _ToolExecution({required this.id});
  

@override final  String id;

/// Create a copy of ToolExecution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolExecutionCopyWith<_ToolExecution> get copyWith => __$ToolExecutionCopyWithImpl<_ToolExecution>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolExecution&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ToolExecution(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ToolExecutionCopyWith<$Res> implements $ToolExecutionCopyWith<$Res> {
  factory _$ToolExecutionCopyWith(_ToolExecution value, $Res Function(_ToolExecution) _then) = __$ToolExecutionCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$ToolExecutionCopyWithImpl<$Res>
    implements _$ToolExecutionCopyWith<$Res> {
  __$ToolExecutionCopyWithImpl(this._self, this._then);

  final _ToolExecution _self;
  final $Res Function(_ToolExecution) _then;

/// Create a copy of ToolExecution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ToolExecution(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
