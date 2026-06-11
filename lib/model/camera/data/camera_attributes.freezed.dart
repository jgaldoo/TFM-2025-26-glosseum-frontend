// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_attributes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraAttributes {

 bool get menuOpen; double get zoom; double get brightness; double get minZoom; double get maxZoom; double get minBrightness; double get maxBrightness;
/// Create a copy of CameraAttributes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraAttributesCopyWith<CameraAttributes> get copyWith => _$CameraAttributesCopyWithImpl<CameraAttributes>(this as CameraAttributes, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraAttributes&&(identical(other.menuOpen, menuOpen) || other.menuOpen == menuOpen)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.minZoom, minZoom) || other.minZoom == minZoom)&&(identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom)&&(identical(other.minBrightness, minBrightness) || other.minBrightness == minBrightness)&&(identical(other.maxBrightness, maxBrightness) || other.maxBrightness == maxBrightness));
}


@override
int get hashCode => Object.hash(runtimeType,menuOpen,zoom,brightness,minZoom,maxZoom,minBrightness,maxBrightness);

@override
String toString() {
  return 'CameraAttributes(menuOpen: $menuOpen, zoom: $zoom, brightness: $brightness, minZoom: $minZoom, maxZoom: $maxZoom, minBrightness: $minBrightness, maxBrightness: $maxBrightness)';
}


}

/// @nodoc
abstract mixin class $CameraAttributesCopyWith<$Res>  {
  factory $CameraAttributesCopyWith(CameraAttributes value, $Res Function(CameraAttributes) _then) = _$CameraAttributesCopyWithImpl;
@useResult
$Res call({
 bool menuOpen, double zoom, double brightness, double minZoom, double maxZoom, double minBrightness, double maxBrightness
});




}
/// @nodoc
class _$CameraAttributesCopyWithImpl<$Res>
    implements $CameraAttributesCopyWith<$Res> {
  _$CameraAttributesCopyWithImpl(this._self, this._then);

  final CameraAttributes _self;
  final $Res Function(CameraAttributes) _then;

/// Create a copy of CameraAttributes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuOpen = null,Object? zoom = null,Object? brightness = null,Object? minZoom = null,Object? maxZoom = null,Object? minBrightness = null,Object? maxBrightness = null,}) {
  return _then(_self.copyWith(
menuOpen: null == menuOpen ? _self.menuOpen : menuOpen // ignore: cast_nullable_to_non_nullable
as bool,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double,minZoom: null == minZoom ? _self.minZoom : minZoom // ignore: cast_nullable_to_non_nullable
as double,maxZoom: null == maxZoom ? _self.maxZoom : maxZoom // ignore: cast_nullable_to_non_nullable
as double,minBrightness: null == minBrightness ? _self.minBrightness : minBrightness // ignore: cast_nullable_to_non_nullable
as double,maxBrightness: null == maxBrightness ? _self.maxBrightness : maxBrightness // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CameraAttributes].
extension CameraAttributesPatterns on CameraAttributes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraAttributes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraAttributes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraAttributes value)  $default,){
final _that = this;
switch (_that) {
case _CameraAttributes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraAttributes value)?  $default,){
final _that = this;
switch (_that) {
case _CameraAttributes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool menuOpen,  double zoom,  double brightness,  double minZoom,  double maxZoom,  double minBrightness,  double maxBrightness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraAttributes() when $default != null:
return $default(_that.menuOpen,_that.zoom,_that.brightness,_that.minZoom,_that.maxZoom,_that.minBrightness,_that.maxBrightness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool menuOpen,  double zoom,  double brightness,  double minZoom,  double maxZoom,  double minBrightness,  double maxBrightness)  $default,) {final _that = this;
switch (_that) {
case _CameraAttributes():
return $default(_that.menuOpen,_that.zoom,_that.brightness,_that.minZoom,_that.maxZoom,_that.minBrightness,_that.maxBrightness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool menuOpen,  double zoom,  double brightness,  double minZoom,  double maxZoom,  double minBrightness,  double maxBrightness)?  $default,) {final _that = this;
switch (_that) {
case _CameraAttributes() when $default != null:
return $default(_that.menuOpen,_that.zoom,_that.brightness,_that.minZoom,_that.maxZoom,_that.minBrightness,_that.maxBrightness);case _:
  return null;

}
}

}

/// @nodoc


class _CameraAttributes implements CameraAttributes {
  const _CameraAttributes({this.menuOpen = false, this.zoom = 1.0, this.brightness = 0.0, this.minZoom = 1.0, this.maxZoom = 4.0, this.minBrightness = -2.0, this.maxBrightness = 2.0});
  

@override@JsonKey() final  bool menuOpen;
@override@JsonKey() final  double zoom;
@override@JsonKey() final  double brightness;
@override@JsonKey() final  double minZoom;
@override@JsonKey() final  double maxZoom;
@override@JsonKey() final  double minBrightness;
@override@JsonKey() final  double maxBrightness;

/// Create a copy of CameraAttributes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraAttributesCopyWith<_CameraAttributes> get copyWith => __$CameraAttributesCopyWithImpl<_CameraAttributes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraAttributes&&(identical(other.menuOpen, menuOpen) || other.menuOpen == menuOpen)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.minZoom, minZoom) || other.minZoom == minZoom)&&(identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom)&&(identical(other.minBrightness, minBrightness) || other.minBrightness == minBrightness)&&(identical(other.maxBrightness, maxBrightness) || other.maxBrightness == maxBrightness));
}


@override
int get hashCode => Object.hash(runtimeType,menuOpen,zoom,brightness,minZoom,maxZoom,minBrightness,maxBrightness);

@override
String toString() {
  return 'CameraAttributes(menuOpen: $menuOpen, zoom: $zoom, brightness: $brightness, minZoom: $minZoom, maxZoom: $maxZoom, minBrightness: $minBrightness, maxBrightness: $maxBrightness)';
}


}

/// @nodoc
abstract mixin class _$CameraAttributesCopyWith<$Res> implements $CameraAttributesCopyWith<$Res> {
  factory _$CameraAttributesCopyWith(_CameraAttributes value, $Res Function(_CameraAttributes) _then) = __$CameraAttributesCopyWithImpl;
@override @useResult
$Res call({
 bool menuOpen, double zoom, double brightness, double minZoom, double maxZoom, double minBrightness, double maxBrightness
});




}
/// @nodoc
class __$CameraAttributesCopyWithImpl<$Res>
    implements _$CameraAttributesCopyWith<$Res> {
  __$CameraAttributesCopyWithImpl(this._self, this._then);

  final _CameraAttributes _self;
  final $Res Function(_CameraAttributes) _then;

/// Create a copy of CameraAttributes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuOpen = null,Object? zoom = null,Object? brightness = null,Object? minZoom = null,Object? maxZoom = null,Object? minBrightness = null,Object? maxBrightness = null,}) {
  return _then(_CameraAttributes(
menuOpen: null == menuOpen ? _self.menuOpen : menuOpen // ignore: cast_nullable_to_non_nullable
as bool,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double,minZoom: null == minZoom ? _self.minZoom : minZoom // ignore: cast_nullable_to_non_nullable
as double,maxZoom: null == maxZoom ? _self.maxZoom : maxZoom // ignore: cast_nullable_to_non_nullable
as double,minBrightness: null == minBrightness ? _self.minBrightness : minBrightness // ignore: cast_nullable_to_non_nullable
as double,maxBrightness: null == maxBrightness ? _self.maxBrightness : maxBrightness // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
