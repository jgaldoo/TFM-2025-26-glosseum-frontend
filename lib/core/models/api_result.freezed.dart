// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResult<T> {

 int get statusCode; String get message;
/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResultCopyWith<T, ApiResult<T>> get copyWith => _$ApiResultCopyWithImpl<T, ApiResult<T>>(this as ApiResult<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResult<T>&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'ApiResult<$T>(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiResultCopyWith<T,$Res>  {
  factory $ApiResultCopyWith(ApiResult<T> value, $Res Function(ApiResult<T>) _then) = _$ApiResultCopyWithImpl;
@useResult
$Res call({
 int statusCode, String message
});




}
/// @nodoc
class _$ApiResultCopyWithImpl<T,$Res>
    implements $ApiResultCopyWith<T, $Res> {
  _$ApiResultCopyWithImpl(this._self, this._then);

  final ApiResult<T> _self;
  final $Res Function(ApiResult<T>) _then;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? message = null,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiResult].
extension ApiResultPatterns<T> on ApiResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApiSuccess<T> value)?  success,TResult Function( ApiError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that);case ApiError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApiSuccess<T> value)  success,required TResult Function( ApiError<T> value)  error,}){
final _that = this;
switch (_that) {
case ApiSuccess():
return success(_that);case ApiError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApiSuccess<T> value)?  success,TResult? Function( ApiError<T> value)?  error,}){
final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that);case ApiError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data,  int statusCode,  String message)?  success,TResult Function( ApiErrorType type,  int statusCode,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that.data,_that.statusCode,_that.message);case ApiError() when error != null:
return error(_that.type,_that.statusCode,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data,  int statusCode,  String message)  success,required TResult Function( ApiErrorType type,  int statusCode,  String message)  error,}) {final _that = this;
switch (_that) {
case ApiSuccess():
return success(_that.data,_that.statusCode,_that.message);case ApiError():
return error(_that.type,_that.statusCode,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data,  int statusCode,  String message)?  success,TResult? Function( ApiErrorType type,  int statusCode,  String message)?  error,}) {final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that.data,_that.statusCode,_that.message);case ApiError() when error != null:
return error(_that.type,_that.statusCode,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ApiSuccess<T> implements ApiResult<T> {
  const ApiSuccess({required this.data, required this.statusCode, required this.message});
  

 final  T data;
@override final  int statusCode;
@override final  String message;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiSuccessCopyWith<T, ApiSuccess<T>> get copyWith => _$ApiSuccessCopyWithImpl<T, ApiSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiSuccess<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),statusCode,message);

@override
String toString() {
  return 'ApiResult<$T>.success(data: $data, statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiSuccessCopyWith<T,$Res> implements $ApiResultCopyWith<T, $Res> {
  factory $ApiSuccessCopyWith(ApiSuccess<T> value, $Res Function(ApiSuccess<T>) _then) = _$ApiSuccessCopyWithImpl;
@override @useResult
$Res call({
 T data, int statusCode, String message
});




}
/// @nodoc
class _$ApiSuccessCopyWithImpl<T,$Res>
    implements $ApiSuccessCopyWith<T, $Res> {
  _$ApiSuccessCopyWithImpl(this._self, this._then);

  final ApiSuccess<T> _self;
  final $Res Function(ApiSuccess<T>) _then;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? statusCode = null,Object? message = null,}) {
  return _then(ApiSuccess<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ApiError<T> implements ApiResult<T> {
  const ApiError({required this.type, required this.statusCode, required this.message});
  

 final  ApiErrorType type;
@override final  int statusCode;
@override final  String message;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorCopyWith<T, ApiError<T>> get copyWith => _$ApiErrorCopyWithImpl<T, ApiError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiError<T>&&(identical(other.type, type) || other.type == type)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,type,statusCode,message);

@override
String toString() {
  return 'ApiResult<$T>.error(type: $type, statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<T,$Res> implements $ApiResultCopyWith<T, $Res> {
  factory $ApiErrorCopyWith(ApiError<T> value, $Res Function(ApiError<T>) _then) = _$ApiErrorCopyWithImpl;
@override @useResult
$Res call({
 ApiErrorType type, int statusCode, String message
});




}
/// @nodoc
class _$ApiErrorCopyWithImpl<T,$Res>
    implements $ApiErrorCopyWith<T, $Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError<T> _self;
  final $Res Function(ApiError<T>) _then;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? statusCode = null,Object? message = null,}) {
  return _then(ApiError<T>(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ApiErrorType,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
