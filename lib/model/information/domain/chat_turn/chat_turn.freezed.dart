// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_turn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatTurn {

 String get question; String? get answer; bool? get isSimplified;
/// Create a copy of ChatTurn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatTurnCopyWith<ChatTurn> get copyWith => _$ChatTurnCopyWithImpl<ChatTurn>(this as ChatTurn, _$identity);

  /// Serializes this ChatTurn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatTurn&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,answer,isSimplified);

@override
String toString() {
  return 'ChatTurn(question: $question, answer: $answer, isSimplified: $isSimplified)';
}


}

/// @nodoc
abstract mixin class $ChatTurnCopyWith<$Res>  {
  factory $ChatTurnCopyWith(ChatTurn value, $Res Function(ChatTurn) _then) = _$ChatTurnCopyWithImpl;
@useResult
$Res call({
 String question, String? answer, bool? isSimplified
});




}
/// @nodoc
class _$ChatTurnCopyWithImpl<$Res>
    implements $ChatTurnCopyWith<$Res> {
  _$ChatTurnCopyWithImpl(this._self, this._then);

  final ChatTurn _self;
  final $Res Function(ChatTurn) _then;

/// Create a copy of ChatTurn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? answer = freezed,Object? isSimplified = freezed,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,isSimplified: freezed == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatTurn].
extension ChatTurnPatterns on ChatTurn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatTurn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatTurn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatTurn value)  $default,){
final _that = this;
switch (_that) {
case _ChatTurn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatTurn value)?  $default,){
final _that = this;
switch (_that) {
case _ChatTurn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String question,  String? answer,  bool? isSimplified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatTurn() when $default != null:
return $default(_that.question,_that.answer,_that.isSimplified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String question,  String? answer,  bool? isSimplified)  $default,) {final _that = this;
switch (_that) {
case _ChatTurn():
return $default(_that.question,_that.answer,_that.isSimplified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String question,  String? answer,  bool? isSimplified)?  $default,) {final _that = this;
switch (_that) {
case _ChatTurn() when $default != null:
return $default(_that.question,_that.answer,_that.isSimplified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatTurn implements ChatTurn {
  const _ChatTurn({required this.question, this.answer, this.isSimplified});
  factory _ChatTurn.fromJson(Map<String, dynamic> json) => _$ChatTurnFromJson(json);

@override final  String question;
@override final  String? answer;
@override final  bool? isSimplified;

/// Create a copy of ChatTurn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatTurnCopyWith<_ChatTurn> get copyWith => __$ChatTurnCopyWithImpl<_ChatTurn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatTurnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatTurn&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,answer,isSimplified);

@override
String toString() {
  return 'ChatTurn(question: $question, answer: $answer, isSimplified: $isSimplified)';
}


}

/// @nodoc
abstract mixin class _$ChatTurnCopyWith<$Res> implements $ChatTurnCopyWith<$Res> {
  factory _$ChatTurnCopyWith(_ChatTurn value, $Res Function(_ChatTurn) _then) = __$ChatTurnCopyWithImpl;
@override @useResult
$Res call({
 String question, String? answer, bool? isSimplified
});




}
/// @nodoc
class __$ChatTurnCopyWithImpl<$Res>
    implements _$ChatTurnCopyWith<$Res> {
  __$ChatTurnCopyWithImpl(this._self, this._then);

  final _ChatTurn _self;
  final $Res Function(_ChatTurn) _then;

/// Create a copy of ChatTurn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? answer = freezed,Object? isSimplified = freezed,}) {
  return _then(_ChatTurn(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,isSimplified: freezed == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
