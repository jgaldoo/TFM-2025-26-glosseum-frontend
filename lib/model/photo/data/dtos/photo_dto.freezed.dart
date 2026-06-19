// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhotoDTO {

@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? get fileBytes;@JsonKey(includeFromJson: false, includeToJson: false) String? get fileName;
/// Create a copy of PhotoDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoDTOCopyWith<PhotoDTO> get copyWith => _$PhotoDTOCopyWithImpl<PhotoDTO>(this as PhotoDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoDTO&&const DeepCollectionEquality().equals(other.fileBytes, fileBytes)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fileBytes),fileName);

@override
String toString() {
  return 'PhotoDTO(fileBytes: $fileBytes, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class $PhotoDTOCopyWith<$Res>  {
  factory $PhotoDTOCopyWith(PhotoDTO value, $Res Function(PhotoDTO) _then) = _$PhotoDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? fileBytes,@JsonKey(includeFromJson: false, includeToJson: false) String? fileName
});




}
/// @nodoc
class _$PhotoDTOCopyWithImpl<$Res>
    implements $PhotoDTOCopyWith<$Res> {
  _$PhotoDTOCopyWithImpl(this._self, this._then);

  final PhotoDTO _self;
  final $Res Function(PhotoDTO) _then;

/// Create a copy of PhotoDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileBytes = freezed,Object? fileName = freezed,}) {
  return _then(_self.copyWith(
fileBytes: freezed == fileBytes ? _self.fileBytes : fileBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoDTO].
extension PhotoDTOPatterns on PhotoDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoDTO value)  $default,){
final _that = this;
switch (_that) {
case _PhotoDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoDTO value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? fileBytes, @JsonKey(includeFromJson: false, includeToJson: false)  String? fileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoDTO() when $default != null:
return $default(_that.fileBytes,_that.fileName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? fileBytes, @JsonKey(includeFromJson: false, includeToJson: false)  String? fileName)  $default,) {final _that = this;
switch (_that) {
case _PhotoDTO():
return $default(_that.fileBytes,_that.fileName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? fileBytes, @JsonKey(includeFromJson: false, includeToJson: false)  String? fileName)?  $default,) {final _that = this;
switch (_that) {
case _PhotoDTO() when $default != null:
return $default(_that.fileBytes,_that.fileName);case _:
  return null;

}
}

}

/// @nodoc


class _PhotoDTO implements PhotoDTO {
  const _PhotoDTO({@JsonKey(includeFromJson: false, includeToJson: false) this.fileBytes, @JsonKey(includeFromJson: false, includeToJson: false) this.fileName});
  

@override@JsonKey(includeFromJson: false, includeToJson: false) final  Uint8List? fileBytes;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? fileName;

/// Create a copy of PhotoDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoDTOCopyWith<_PhotoDTO> get copyWith => __$PhotoDTOCopyWithImpl<_PhotoDTO>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoDTO&&const DeepCollectionEquality().equals(other.fileBytes, fileBytes)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fileBytes),fileName);

@override
String toString() {
  return 'PhotoDTO(fileBytes: $fileBytes, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class _$PhotoDTOCopyWith<$Res> implements $PhotoDTOCopyWith<$Res> {
  factory _$PhotoDTOCopyWith(_PhotoDTO value, $Res Function(_PhotoDTO) _then) = __$PhotoDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? fileBytes,@JsonKey(includeFromJson: false, includeToJson: false) String? fileName
});




}
/// @nodoc
class __$PhotoDTOCopyWithImpl<$Res>
    implements _$PhotoDTOCopyWith<$Res> {
  __$PhotoDTOCopyWithImpl(this._self, this._then);

  final _PhotoDTO _self;
  final $Res Function(_PhotoDTO) _then;

/// Create a copy of PhotoDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileBytes = freezed,Object? fileName = freezed,}) {
  return _then(_PhotoDTO(
fileBytes: freezed == fileBytes ? _self.fileBytes : fileBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
