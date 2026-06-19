// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InformationDTO {

 String get title; InformationTypeEnum get informationType; bool get isSimplified; String get content;
/// Create a copy of InformationDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InformationDTOCopyWith<InformationDTO> get copyWith => _$InformationDTOCopyWithImpl<InformationDTO>(this as InformationDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InformationDTO&&(identical(other.title, title) || other.title == title)&&(identical(other.informationType, informationType) || other.informationType == informationType)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,title,informationType,isSimplified,content);

@override
String toString() {
  return 'InformationDTO(title: $title, informationType: $informationType, isSimplified: $isSimplified, content: $content)';
}


}

/// @nodoc
abstract mixin class $InformationDTOCopyWith<$Res>  {
  factory $InformationDTOCopyWith(InformationDTO value, $Res Function(InformationDTO) _then) = _$InformationDTOCopyWithImpl;
@useResult
$Res call({
 String title, InformationTypeEnum informationType, bool isSimplified, String content
});




}
/// @nodoc
class _$InformationDTOCopyWithImpl<$Res>
    implements $InformationDTOCopyWith<$Res> {
  _$InformationDTOCopyWithImpl(this._self, this._then);

  final InformationDTO _self;
  final $Res Function(InformationDTO) _then;

/// Create a copy of InformationDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? informationType = null,Object? isSimplified = null,Object? content = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,informationType: null == informationType ? _self.informationType : informationType // ignore: cast_nullable_to_non_nullable
as InformationTypeEnum,isSimplified: null == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InformationDTO].
extension InformationDTOPatterns on InformationDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InformationDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InformationDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InformationDTO value)  $default,){
final _that = this;
switch (_that) {
case _InformationDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InformationDTO value)?  $default,){
final _that = this;
switch (_that) {
case _InformationDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  InformationTypeEnum informationType,  bool isSimplified,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InformationDTO() when $default != null:
return $default(_that.title,_that.informationType,_that.isSimplified,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  InformationTypeEnum informationType,  bool isSimplified,  String content)  $default,) {final _that = this;
switch (_that) {
case _InformationDTO():
return $default(_that.title,_that.informationType,_that.isSimplified,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  InformationTypeEnum informationType,  bool isSimplified,  String content)?  $default,) {final _that = this;
switch (_that) {
case _InformationDTO() when $default != null:
return $default(_that.title,_that.informationType,_that.isSimplified,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _InformationDTO implements InformationDTO {
  const _InformationDTO({required this.title, required this.informationType, required this.isSimplified, required this.content});
  

@override final  String title;
@override final  InformationTypeEnum informationType;
@override final  bool isSimplified;
@override final  String content;

/// Create a copy of InformationDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InformationDTOCopyWith<_InformationDTO> get copyWith => __$InformationDTOCopyWithImpl<_InformationDTO>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InformationDTO&&(identical(other.title, title) || other.title == title)&&(identical(other.informationType, informationType) || other.informationType == informationType)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,title,informationType,isSimplified,content);

@override
String toString() {
  return 'InformationDTO(title: $title, informationType: $informationType, isSimplified: $isSimplified, content: $content)';
}


}

/// @nodoc
abstract mixin class _$InformationDTOCopyWith<$Res> implements $InformationDTOCopyWith<$Res> {
  factory _$InformationDTOCopyWith(_InformationDTO value, $Res Function(_InformationDTO) _then) = __$InformationDTOCopyWithImpl;
@override @useResult
$Res call({
 String title, InformationTypeEnum informationType, bool isSimplified, String content
});




}
/// @nodoc
class __$InformationDTOCopyWithImpl<$Res>
    implements _$InformationDTOCopyWith<$Res> {
  __$InformationDTOCopyWithImpl(this._self, this._then);

  final _InformationDTO _self;
  final $Res Function(_InformationDTO) _then;

/// Create a copy of InformationDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? informationType = null,Object? isSimplified = null,Object? content = null,}) {
  return _then(_InformationDTO(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,informationType: null == informationType ? _self.informationType : informationType // ignore: cast_nullable_to_non_nullable
as InformationTypeEnum,isSimplified: null == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
