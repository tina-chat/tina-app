// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatbotToolCall {

 String get id; String get name; Map<String, dynamic> get arguments; String get argumentsRaw; String? get responseRaw;
/// Create a copy of ChatbotToolCall
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotToolCallCopyWith<ChatbotToolCall> get copyWith => _$ChatbotToolCallCopyWithImpl<ChatbotToolCall>(this as ChatbotToolCall, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotToolCall&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.arguments, arguments)&&(identical(other.argumentsRaw, argumentsRaw) || other.argumentsRaw == argumentsRaw)&&(identical(other.responseRaw, responseRaw) || other.responseRaw == responseRaw));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(arguments),argumentsRaw,responseRaw);

@override
String toString() {
  return 'ChatbotToolCall(id: $id, name: $name, arguments: $arguments, argumentsRaw: $argumentsRaw, responseRaw: $responseRaw)';
}


}

/// @nodoc
abstract mixin class $ChatbotToolCallCopyWith<$Res>  {
  factory $ChatbotToolCallCopyWith(ChatbotToolCall value, $Res Function(ChatbotToolCall) _then) = _$ChatbotToolCallCopyWithImpl;
@useResult
$Res call({
 String id, String name, Map<String, dynamic> arguments, String argumentsRaw, String? responseRaw
});




}
/// @nodoc
class _$ChatbotToolCallCopyWithImpl<$Res>
    implements $ChatbotToolCallCopyWith<$Res> {
  _$ChatbotToolCallCopyWithImpl(this._self, this._then);

  final ChatbotToolCall _self;
  final $Res Function(ChatbotToolCall) _then;

/// Create a copy of ChatbotToolCall
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? arguments = null,Object? argumentsRaw = null,Object? responseRaw = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,argumentsRaw: null == argumentsRaw ? _self.argumentsRaw : argumentsRaw // ignore: cast_nullable_to_non_nullable
as String,responseRaw: freezed == responseRaw ? _self.responseRaw : responseRaw // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatbotToolCall].
extension ChatbotToolCallPatterns on ChatbotToolCall {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatbotToolCall value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatbotToolCall() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatbotToolCall value)  $default,){
final _that = this;
switch (_that) {
case _ChatbotToolCall():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatbotToolCall value)?  $default,){
final _that = this;
switch (_that) {
case _ChatbotToolCall() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Map<String, dynamic> arguments,  String argumentsRaw,  String? responseRaw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatbotToolCall() when $default != null:
return $default(_that.id,_that.name,_that.arguments,_that.argumentsRaw,_that.responseRaw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Map<String, dynamic> arguments,  String argumentsRaw,  String? responseRaw)  $default,) {final _that = this;
switch (_that) {
case _ChatbotToolCall():
return $default(_that.id,_that.name,_that.arguments,_that.argumentsRaw,_that.responseRaw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Map<String, dynamic> arguments,  String argumentsRaw,  String? responseRaw)?  $default,) {final _that = this;
switch (_that) {
case _ChatbotToolCall() when $default != null:
return $default(_that.id,_that.name,_that.arguments,_that.argumentsRaw,_that.responseRaw);case _:
  return null;

}
}

}

/// @nodoc


class _ChatbotToolCall extends ChatbotToolCall {
  const _ChatbotToolCall({required this.id, required this.name, required final  Map<String, dynamic> arguments, required this.argumentsRaw, this.responseRaw}): _arguments = arguments,super._();
  

@override final  String id;
@override final  String name;
 final  Map<String, dynamic> _arguments;
@override Map<String, dynamic> get arguments {
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_arguments);
}

@override final  String argumentsRaw;
@override final  String? responseRaw;

/// Create a copy of ChatbotToolCall
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatbotToolCallCopyWith<_ChatbotToolCall> get copyWith => __$ChatbotToolCallCopyWithImpl<_ChatbotToolCall>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatbotToolCall&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._arguments, _arguments)&&(identical(other.argumentsRaw, argumentsRaw) || other.argumentsRaw == argumentsRaw)&&(identical(other.responseRaw, responseRaw) || other.responseRaw == responseRaw));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_arguments),argumentsRaw,responseRaw);

@override
String toString() {
  return 'ChatbotToolCall(id: $id, name: $name, arguments: $arguments, argumentsRaw: $argumentsRaw, responseRaw: $responseRaw)';
}


}

/// @nodoc
abstract mixin class _$ChatbotToolCallCopyWith<$Res> implements $ChatbotToolCallCopyWith<$Res> {
  factory _$ChatbotToolCallCopyWith(_ChatbotToolCall value, $Res Function(_ChatbotToolCall) _then) = __$ChatbotToolCallCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Map<String, dynamic> arguments, String argumentsRaw, String? responseRaw
});




}
/// @nodoc
class __$ChatbotToolCallCopyWithImpl<$Res>
    implements _$ChatbotToolCallCopyWith<$Res> {
  __$ChatbotToolCallCopyWithImpl(this._self, this._then);

  final _ChatbotToolCall _self;
  final $Res Function(_ChatbotToolCall) _then;

/// Create a copy of ChatbotToolCall
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? arguments = null,Object? argumentsRaw = null,Object? responseRaw = freezed,}) {
  return _then(_ChatbotToolCall(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,argumentsRaw: null == argumentsRaw ? _self.argumentsRaw : argumentsRaw // ignore: cast_nullable_to_non_nullable
as String,responseRaw: freezed == responseRaw ? _self.responseRaw : responseRaw // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ChatbotMessage {

 String get message;
/// Create a copy of ChatbotMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotMessageCopyWith<ChatbotMessage> get copyWith => _$ChatbotMessageCopyWithImpl<ChatbotMessage>(this as ChatbotMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatbotMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatbotMessageCopyWith<$Res>  {
  factory $ChatbotMessageCopyWith(ChatbotMessage value, $Res Function(ChatbotMessage) _then) = _$ChatbotMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatbotMessageCopyWithImpl<$Res>
    implements $ChatbotMessageCopyWith<$Res> {
  _$ChatbotMessageCopyWithImpl(this._self, this._then);

  final ChatbotMessage _self;
  final $Res Function(ChatbotMessage) _then;

/// Create a copy of ChatbotMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatbotMessage].
extension ChatbotMessagePatterns on ChatbotMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatbotMessageHumanText value)?  humanText,TResult Function( ChatbotMessageAI value)?  ai,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatbotMessageHumanText() when humanText != null:
return humanText(_that);case ChatbotMessageAI() when ai != null:
return ai(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatbotMessageHumanText value)  humanText,required TResult Function( ChatbotMessageAI value)  ai,}){
final _that = this;
switch (_that) {
case ChatbotMessageHumanText():
return humanText(_that);case ChatbotMessageAI():
return ai(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatbotMessageHumanText value)?  humanText,TResult? Function( ChatbotMessageAI value)?  ai,}){
final _that = this;
switch (_that) {
case ChatbotMessageHumanText() when humanText != null:
return humanText(_that);case ChatbotMessageAI() when ai != null:
return ai(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  humanText,TResult Function( String message,  List<ChatbotToolCall> toolCalls)?  ai,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatbotMessageHumanText() when humanText != null:
return humanText(_that.message);case ChatbotMessageAI() when ai != null:
return ai(_that.message,_that.toolCalls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  humanText,required TResult Function( String message,  List<ChatbotToolCall> toolCalls)  ai,}) {final _that = this;
switch (_that) {
case ChatbotMessageHumanText():
return humanText(_that.message);case ChatbotMessageAI():
return ai(_that.message,_that.toolCalls);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  humanText,TResult? Function( String message,  List<ChatbotToolCall> toolCalls)?  ai,}) {final _that = this;
switch (_that) {
case ChatbotMessageHumanText() when humanText != null:
return humanText(_that.message);case ChatbotMessageAI() when ai != null:
return ai(_that.message,_that.toolCalls);case _:
  return null;

}
}

}

/// @nodoc


class ChatbotMessageHumanText implements ChatbotMessage {
  const ChatbotMessageHumanText(this.message);
  

@override final  String message;

/// Create a copy of ChatbotMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotMessageHumanTextCopyWith<ChatbotMessageHumanText> get copyWith => _$ChatbotMessageHumanTextCopyWithImpl<ChatbotMessageHumanText>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotMessageHumanText&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatbotMessage.humanText(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatbotMessageHumanTextCopyWith<$Res> implements $ChatbotMessageCopyWith<$Res> {
  factory $ChatbotMessageHumanTextCopyWith(ChatbotMessageHumanText value, $Res Function(ChatbotMessageHumanText) _then) = _$ChatbotMessageHumanTextCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatbotMessageHumanTextCopyWithImpl<$Res>
    implements $ChatbotMessageHumanTextCopyWith<$Res> {
  _$ChatbotMessageHumanTextCopyWithImpl(this._self, this._then);

  final ChatbotMessageHumanText _self;
  final $Res Function(ChatbotMessageHumanText) _then;

/// Create a copy of ChatbotMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatbotMessageHumanText(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatbotMessageAI implements ChatbotMessage {
  const ChatbotMessageAI({required this.message, required final  List<ChatbotToolCall> toolCalls}): _toolCalls = toolCalls;
  

@override final  String message;
 final  List<ChatbotToolCall> _toolCalls;
 List<ChatbotToolCall> get toolCalls {
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toolCalls);
}


/// Create a copy of ChatbotMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotMessageAICopyWith<ChatbotMessageAI> get copyWith => _$ChatbotMessageAICopyWithImpl<ChatbotMessageAI>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotMessageAI&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._toolCalls, _toolCalls));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_toolCalls));

@override
String toString() {
  return 'ChatbotMessage.ai(message: $message, toolCalls: $toolCalls)';
}


}

/// @nodoc
abstract mixin class $ChatbotMessageAICopyWith<$Res> implements $ChatbotMessageCopyWith<$Res> {
  factory $ChatbotMessageAICopyWith(ChatbotMessageAI value, $Res Function(ChatbotMessageAI) _then) = _$ChatbotMessageAICopyWithImpl;
@override @useResult
$Res call({
 String message, List<ChatbotToolCall> toolCalls
});




}
/// @nodoc
class _$ChatbotMessageAICopyWithImpl<$Res>
    implements $ChatbotMessageAICopyWith<$Res> {
  _$ChatbotMessageAICopyWithImpl(this._self, this._then);

  final ChatbotMessageAI _self;
  final $Res Function(ChatbotMessageAI) _then;

/// Create a copy of ChatbotMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? toolCalls = null,}) {
  return _then(ChatbotMessageAI(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,toolCalls: null == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ChatbotToolCall>,
  ));
}


}

// dart format on
