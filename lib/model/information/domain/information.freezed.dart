// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Information {

 String get title; String get content; InformationTypeEnum get informationType; bool get isSimplified; List<String> get userQuestions; List<String> get appAnswers;
/// Create a copy of Information
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InformationCopyWith<Information> get copyWith => _$InformationCopyWithImpl<Information>(this as Information, _$identity);

  /// Serializes this Information to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Information&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.informationType, informationType) || other.informationType == informationType)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified)&&const DeepCollectionEquality().equals(other.userQuestions, userQuestions)&&const DeepCollectionEquality().equals(other.appAnswers, appAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,informationType,isSimplified,const DeepCollectionEquality().hash(userQuestions),const DeepCollectionEquality().hash(appAnswers));

@override
String toString() {
  return 'Information(title: $title, content: $content, informationType: $informationType, isSimplified: $isSimplified, userQuestions: $userQuestions, appAnswers: $appAnswers)';
}


}

/// @nodoc
abstract mixin class $InformationCopyWith<$Res>  {
  factory $InformationCopyWith(Information value, $Res Function(Information) _then) = _$InformationCopyWithImpl;
@useResult
$Res call({
 String title, String content, InformationTypeEnum informationType, bool isSimplified, List<String> userQuestions, List<String> appAnswers
});




}
/// @nodoc
class _$InformationCopyWithImpl<$Res>
    implements $InformationCopyWith<$Res> {
  _$InformationCopyWithImpl(this._self, this._then);

  final Information _self;
  final $Res Function(Information) _then;

/// Create a copy of Information
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? informationType = null,Object? isSimplified = null,Object? userQuestions = null,Object? appAnswers = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,informationType: null == informationType ? _self.informationType : informationType // ignore: cast_nullable_to_non_nullable
as InformationTypeEnum,isSimplified: null == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool,userQuestions: null == userQuestions ? _self.userQuestions : userQuestions // ignore: cast_nullable_to_non_nullable
as List<String>,appAnswers: null == appAnswers ? _self.appAnswers : appAnswers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Information].
extension InformationPatterns on Information {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Information value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Information() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Information value)  $default,){
final _that = this;
switch (_that) {
case _Information():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Information value)?  $default,){
final _that = this;
switch (_that) {
case _Information() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String content,  InformationTypeEnum informationType,  bool isSimplified,  List<String> userQuestions,  List<String> appAnswers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Information() when $default != null:
return $default(_that.title,_that.content,_that.informationType,_that.isSimplified,_that.userQuestions,_that.appAnswers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String content,  InformationTypeEnum informationType,  bool isSimplified,  List<String> userQuestions,  List<String> appAnswers)  $default,) {final _that = this;
switch (_that) {
case _Information():
return $default(_that.title,_that.content,_that.informationType,_that.isSimplified,_that.userQuestions,_that.appAnswers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String content,  InformationTypeEnum informationType,  bool isSimplified,  List<String> userQuestions,  List<String> appAnswers)?  $default,) {final _that = this;
switch (_that) {
case _Information() when $default != null:
return $default(_that.title,_that.content,_that.informationType,_that.isSimplified,_that.userQuestions,_that.appAnswers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Information implements Information {
  const _Information({required this.title, required this.content, required this.informationType, required this.isSimplified, final  List<String> userQuestions = const [], final  List<String> appAnswers = const []}): _userQuestions = userQuestions,_appAnswers = appAnswers;
  factory _Information.fromJson(Map<String, dynamic> json) => _$InformationFromJson(json);

@override final  String title;
@override final  String content;
@override final  InformationTypeEnum informationType;
@override final  bool isSimplified;
 final  List<String> _userQuestions;
@override@JsonKey() List<String> get userQuestions {
  if (_userQuestions is EqualUnmodifiableListView) return _userQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userQuestions);
}

 final  List<String> _appAnswers;
@override@JsonKey() List<String> get appAnswers {
  if (_appAnswers is EqualUnmodifiableListView) return _appAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appAnswers);
}


/// Create a copy of Information
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InformationCopyWith<_Information> get copyWith => __$InformationCopyWithImpl<_Information>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InformationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Information&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.informationType, informationType) || other.informationType == informationType)&&(identical(other.isSimplified, isSimplified) || other.isSimplified == isSimplified)&&const DeepCollectionEquality().equals(other._userQuestions, _userQuestions)&&const DeepCollectionEquality().equals(other._appAnswers, _appAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,informationType,isSimplified,const DeepCollectionEquality().hash(_userQuestions),const DeepCollectionEquality().hash(_appAnswers));

@override
String toString() {
  return 'Information(title: $title, content: $content, informationType: $informationType, isSimplified: $isSimplified, userQuestions: $userQuestions, appAnswers: $appAnswers)';
}


}

/// @nodoc
abstract mixin class _$InformationCopyWith<$Res> implements $InformationCopyWith<$Res> {
  factory _$InformationCopyWith(_Information value, $Res Function(_Information) _then) = __$InformationCopyWithImpl;
@override @useResult
$Res call({
 String title, String content, InformationTypeEnum informationType, bool isSimplified, List<String> userQuestions, List<String> appAnswers
});




}
/// @nodoc
class __$InformationCopyWithImpl<$Res>
    implements _$InformationCopyWith<$Res> {
  __$InformationCopyWithImpl(this._self, this._then);

  final _Information _self;
  final $Res Function(_Information) _then;

/// Create a copy of Information
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,Object? informationType = null,Object? isSimplified = null,Object? userQuestions = null,Object? appAnswers = null,}) {
  return _then(_Information(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,informationType: null == informationType ? _self.informationType : informationType // ignore: cast_nullable_to_non_nullable
as InformationTypeEnum,isSimplified: null == isSimplified ? _self.isSimplified : isSimplified // ignore: cast_nullable_to_non_nullable
as bool,userQuestions: null == userQuestions ? _self._userQuestions : userQuestions // ignore: cast_nullable_to_non_nullable
as List<String>,appAnswers: null == appAnswers ? _self._appAnswers : appAnswers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
