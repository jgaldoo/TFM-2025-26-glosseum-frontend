// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'information_answer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InformationAnswerDTO {

 String get content; bool get isSimplified;
/// Create a copy of InformationAnswerDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InformationAnswerDTOCopyWith<InformationAnswerDTO> get copyWith => _$InformationAnswerDTOCopyWithImpl<InformationAnswerDTO>(this as InformationAnswerDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InformationAnswerDTO&&(identical(other.content, content) || other.content == content)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified));
}


@override
int get hashCode => Object.hash(runtimeType,content,isSimplified);

@override
String toString() {
  return 'InformationAnswerDTO(content: $content, isSimplified: $isSimplified)';
}


}

/// @nodoc
abstract mixin class $InformationAnswerDTOCopyWith<$Res>  {
  factory $InformationAnswerDTOCopyWith(InformationAnswerDTO value, $Res Function(InformationAnswerDTO) _then) = _$InformationAnswerDTOCopyWithImpl;
@useResult
$Res call({
 String content, bool isSimplified
});




}
/// @nodoc
class _$InformationAnswerDTOCopyWithImpl<$Res>
    implements $InformationAnswerDTOCopyWith<$Res> {
  _$InformationAnswerDTOCopyWithImpl(this._self, this._then);

  final InformationAnswerDTO _self;
  final $Res Function(InformationAnswerDTO) _then;

/// Create a copy of InformationAnswerDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? isSimplified = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isSimplified: null == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InformationAnswerDTO].
extension InformationAnswerDTOPatterns on InformationAnswerDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InformationAnswerDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InformationAnswerDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InformationAnswerDTO value)  $default,){
final _that = this;
switch (_that) {
case _InformationAnswerDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InformationAnswerDTO value)?  $default,){
final _that = this;
switch (_that) {
case _InformationAnswerDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content,  bool isSimplified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InformationAnswerDTO() when $default != null:
return $default(_that.content,_that.isSimplified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content,  bool isSimplified)  $default,) {final _that = this;
switch (_that) {
case _InformationAnswerDTO():
return $default(_that.content,_that.isSimplified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content,  bool isSimplified)?  $default,) {final _that = this;
switch (_that) {
case _InformationAnswerDTO() when $default != null:
return $default(_that.content,_that.isSimplified);case _:
  return null;

}
}

}

/// @nodoc


class _InformationAnswerDTO implements InformationAnswerDTO {
  const _InformationAnswerDTO({required this.content, required this.isSimplified});
  

@override final  String content;
@override final  bool isSimplified;

/// Create a copy of InformationAnswerDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InformationAnswerDTOCopyWith<_InformationAnswerDTO> get copyWith => __$InformationAnswerDTOCopyWithImpl<_InformationAnswerDTO>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InformationAnswerDTO&&(identical(other.content, content) || other.content == content)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified));
}


@override
int get hashCode => Object.hash(runtimeType,content,isSimplified);

@override
String toString() {
  return 'InformationAnswerDTO(content: $content, isSimplified: $isSimplified)';
}


}

/// @nodoc
abstract mixin class _$InformationAnswerDTOCopyWith<$Res> implements $InformationAnswerDTOCopyWith<$Res> {
  factory _$InformationAnswerDTOCopyWith(_InformationAnswerDTO value, $Res Function(_InformationAnswerDTO) _then) = __$InformationAnswerDTOCopyWithImpl;
@override @useResult
$Res call({
 String content, bool isSimplified
});




}
/// @nodoc
class __$InformationAnswerDTOCopyWithImpl<$Res>
    implements _$InformationAnswerDTOCopyWith<$Res> {
  __$InformationAnswerDTOCopyWithImpl(this._self, this._then);

  final _InformationAnswerDTO _self;
  final $Res Function(_InformationAnswerDTO) _then;

/// Create a copy of InformationAnswerDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? isSimplified = null,}) {
  return _then(_InformationAnswerDTO(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isSimplified: null == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
