// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_attributes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageAttributes {

 bool get menuOpen; double get zoom; double get brightness; Offset get panningOffset; double get minZoom; double get maxZoom; double get minBrightness; double get maxBrightness; Size get displaySize; double get minXPanning; double get maxXPanning; double get minYPanning; double get maxYPanning;
/// Create a copy of ImageAttributes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageAttributesCopyWith<ImageAttributes> get copyWith => _$ImageAttributesCopyWithImpl<ImageAttributes>(this as ImageAttributes, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageAttributes&&(identical(other.menuOpen, menuOpen) || other.menuOpen == menuOpen)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.panningOffset, panningOffset) || other.panningOffset == panningOffset)&&(identical(other.minZoom, minZoom) || other.minZoom == minZoom)&&(identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom)&&(identical(other.minBrightness, minBrightness) || other.minBrightness == minBrightness)&&(identical(other.maxBrightness, maxBrightness) || other.maxBrightness == maxBrightness)&&(identical(other.displaySize, displaySize) || other.displaySize == displaySize)&&(identical(other.minXPanning, minXPanning) || other.minXPanning == minXPanning)&&(identical(other.maxXPanning, maxXPanning) || other.maxXPanning == maxXPanning)&&(identical(other.minYPanning, minYPanning) || other.minYPanning == minYPanning)&&(identical(other.maxYPanning, maxYPanning) || other.maxYPanning == maxYPanning));
}


@override
int get hashCode => Object.hash(runtimeType,menuOpen,zoom,brightness,panningOffset,minZoom,maxZoom,minBrightness,maxBrightness,displaySize,minXPanning,maxXPanning,minYPanning,maxYPanning);

@override
String toString() {
  return 'ImageAttributes(menuOpen: $menuOpen, zoom: $zoom, brightness: $brightness, panningOffset: $panningOffset, minZoom: $minZoom, maxZoom: $maxZoom, minBrightness: $minBrightness, maxBrightness: $maxBrightness, displaySize: $displaySize, minXPanning: $minXPanning, maxXPanning: $maxXPanning, minYPanning: $minYPanning, maxYPanning: $maxYPanning)';
}


}

/// @nodoc
abstract mixin class $ImageAttributesCopyWith<$Res>  {
  factory $ImageAttributesCopyWith(ImageAttributes value, $Res Function(ImageAttributes) _then) = _$ImageAttributesCopyWithImpl;
@useResult
$Res call({
 bool menuOpen, double zoom, double brightness, Offset panningOffset, double minZoom, double maxZoom, double minBrightness, double maxBrightness, Size displaySize, double minXPanning, double maxXPanning, double minYPanning, double maxYPanning
});




}
/// @nodoc
class _$ImageAttributesCopyWithImpl<$Res>
    implements $ImageAttributesCopyWith<$Res> {
  _$ImageAttributesCopyWithImpl(this._self, this._then);

  final ImageAttributes _self;
  final $Res Function(ImageAttributes) _then;

/// Create a copy of ImageAttributes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuOpen = null,Object? zoom = null,Object? brightness = null,Object? panningOffset = null,Object? minZoom = null,Object? maxZoom = null,Object? minBrightness = null,Object? maxBrightness = null,Object? displaySize = null,Object? minXPanning = null,Object? maxXPanning = null,Object? minYPanning = null,Object? maxYPanning = null,}) {
  return _then(_self.copyWith(
menuOpen: null == menuOpen ? _self.menuOpen : menuOpen // ignore: cast_nullable_to_non_nullable
as bool,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double,panningOffset: null == panningOffset ? _self.panningOffset : panningOffset // ignore: cast_nullable_to_non_nullable
as Offset,minZoom: null == minZoom ? _self.minZoom : minZoom // ignore: cast_nullable_to_non_nullable
as double,maxZoom: null == maxZoom ? _self.maxZoom : maxZoom // ignore: cast_nullable_to_non_nullable
as double,minBrightness: null == minBrightness ? _self.minBrightness : minBrightness // ignore: cast_nullable_to_non_nullable
as double,maxBrightness: null == maxBrightness ? _self.maxBrightness : maxBrightness // ignore: cast_nullable_to_non_nullable
as double,displaySize: null == displaySize ? _self.displaySize : displaySize // ignore: cast_nullable_to_non_nullable
as Size,minXPanning: null == minXPanning ? _self.minXPanning : minXPanning // ignore: cast_nullable_to_non_nullable
as double,maxXPanning: null == maxXPanning ? _self.maxXPanning : maxXPanning // ignore: cast_nullable_to_non_nullable
as double,minYPanning: null == minYPanning ? _self.minYPanning : minYPanning // ignore: cast_nullable_to_non_nullable
as double,maxYPanning: null == maxYPanning ? _self.maxYPanning : maxYPanning // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageAttributes].
extension ImageAttributesPatterns on ImageAttributes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageAttributes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageAttributes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageAttributes value)  $default,){
final _that = this;
switch (_that) {
case _ImageAttributes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageAttributes value)?  $default,){
final _that = this;
switch (_that) {
case _ImageAttributes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool menuOpen,  double zoom,  double brightness,  Offset panningOffset,  double minZoom,  double maxZoom,  double minBrightness,  double maxBrightness,  Size displaySize,  double minXPanning,  double maxXPanning,  double minYPanning,  double maxYPanning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageAttributes() when $default != null:
return $default(_that.menuOpen,_that.zoom,_that.brightness,_that.panningOffset,_that.minZoom,_that.maxZoom,_that.minBrightness,_that.maxBrightness,_that.displaySize,_that.minXPanning,_that.maxXPanning,_that.minYPanning,_that.maxYPanning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool menuOpen,  double zoom,  double brightness,  Offset panningOffset,  double minZoom,  double maxZoom,  double minBrightness,  double maxBrightness,  Size displaySize,  double minXPanning,  double maxXPanning,  double minYPanning,  double maxYPanning)  $default,) {final _that = this;
switch (_that) {
case _ImageAttributes():
return $default(_that.menuOpen,_that.zoom,_that.brightness,_that.panningOffset,_that.minZoom,_that.maxZoom,_that.minBrightness,_that.maxBrightness,_that.displaySize,_that.minXPanning,_that.maxXPanning,_that.minYPanning,_that.maxYPanning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool menuOpen,  double zoom,  double brightness,  Offset panningOffset,  double minZoom,  double maxZoom,  double minBrightness,  double maxBrightness,  Size displaySize,  double minXPanning,  double maxXPanning,  double minYPanning,  double maxYPanning)?  $default,) {final _that = this;
switch (_that) {
case _ImageAttributes() when $default != null:
return $default(_that.menuOpen,_that.zoom,_that.brightness,_that.panningOffset,_that.minZoom,_that.maxZoom,_that.minBrightness,_that.maxBrightness,_that.displaySize,_that.minXPanning,_that.maxXPanning,_that.minYPanning,_that.maxYPanning);case _:
  return null;

}
}

}

/// @nodoc


class _ImageAttributes implements ImageAttributes {
  const _ImageAttributes({this.menuOpen = false, this.zoom = 1.0, this.brightness = 0.0, this.panningOffset = Offset.zero, this.minZoom = 1.0, this.maxZoom = 4.0, this.minBrightness = -2.0, this.maxBrightness = 2.0, this.displaySize = Size.zero, this.minXPanning = 0.0, this.maxXPanning = 0.0, this.minYPanning = 0.0, this.maxYPanning = 0.0});
  

@override@JsonKey() final  bool menuOpen;
@override@JsonKey() final  double zoom;
@override@JsonKey() final  double brightness;
@override@JsonKey() final  Offset panningOffset;
@override@JsonKey() final  double minZoom;
@override@JsonKey() final  double maxZoom;
@override@JsonKey() final  double minBrightness;
@override@JsonKey() final  double maxBrightness;
@override@JsonKey() final  Size displaySize;
@override@JsonKey() final  double minXPanning;
@override@JsonKey() final  double maxXPanning;
@override@JsonKey() final  double minYPanning;
@override@JsonKey() final  double maxYPanning;

/// Create a copy of ImageAttributes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageAttributesCopyWith<_ImageAttributes> get copyWith => __$ImageAttributesCopyWithImpl<_ImageAttributes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageAttributes&&(identical(other.menuOpen, menuOpen) || other.menuOpen == menuOpen)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.panningOffset, panningOffset) || other.panningOffset == panningOffset)&&(identical(other.minZoom, minZoom) || other.minZoom == minZoom)&&(identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom)&&(identical(other.minBrightness, minBrightness) || other.minBrightness == minBrightness)&&(identical(other.maxBrightness, maxBrightness) || other.maxBrightness == maxBrightness)&&(identical(other.displaySize, displaySize) || other.displaySize == displaySize)&&(identical(other.minXPanning, minXPanning) || other.minXPanning == minXPanning)&&(identical(other.maxXPanning, maxXPanning) || other.maxXPanning == maxXPanning)&&(identical(other.minYPanning, minYPanning) || other.minYPanning == minYPanning)&&(identical(other.maxYPanning, maxYPanning) || other.maxYPanning == maxYPanning));
}


@override
int get hashCode => Object.hash(runtimeType,menuOpen,zoom,brightness,panningOffset,minZoom,maxZoom,minBrightness,maxBrightness,displaySize,minXPanning,maxXPanning,minYPanning,maxYPanning);

@override
String toString() {
  return 'ImageAttributes(menuOpen: $menuOpen, zoom: $zoom, brightness: $brightness, panningOffset: $panningOffset, minZoom: $minZoom, maxZoom: $maxZoom, minBrightness: $minBrightness, maxBrightness: $maxBrightness, displaySize: $displaySize, minXPanning: $minXPanning, maxXPanning: $maxXPanning, minYPanning: $minYPanning, maxYPanning: $maxYPanning)';
}


}

/// @nodoc
abstract mixin class _$ImageAttributesCopyWith<$Res> implements $ImageAttributesCopyWith<$Res> {
  factory _$ImageAttributesCopyWith(_ImageAttributes value, $Res Function(_ImageAttributes) _then) = __$ImageAttributesCopyWithImpl;
@override @useResult
$Res call({
 bool menuOpen, double zoom, double brightness, Offset panningOffset, double minZoom, double maxZoom, double minBrightness, double maxBrightness, Size displaySize, double minXPanning, double maxXPanning, double minYPanning, double maxYPanning
});




}
/// @nodoc
class __$ImageAttributesCopyWithImpl<$Res>
    implements _$ImageAttributesCopyWith<$Res> {
  __$ImageAttributesCopyWithImpl(this._self, this._then);

  final _ImageAttributes _self;
  final $Res Function(_ImageAttributes) _then;

/// Create a copy of ImageAttributes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuOpen = null,Object? zoom = null,Object? brightness = null,Object? panningOffset = null,Object? minZoom = null,Object? maxZoom = null,Object? minBrightness = null,Object? maxBrightness = null,Object? displaySize = null,Object? minXPanning = null,Object? maxXPanning = null,Object? minYPanning = null,Object? maxYPanning = null,}) {
  return _then(_ImageAttributes(
menuOpen: null == menuOpen ? _self.menuOpen : menuOpen // ignore: cast_nullable_to_non_nullable
as bool,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double,panningOffset: null == panningOffset ? _self.panningOffset : panningOffset // ignore: cast_nullable_to_non_nullable
as Offset,minZoom: null == minZoom ? _self.minZoom : minZoom // ignore: cast_nullable_to_non_nullable
as double,maxZoom: null == maxZoom ? _self.maxZoom : maxZoom // ignore: cast_nullable_to_non_nullable
as double,minBrightness: null == minBrightness ? _self.minBrightness : minBrightness // ignore: cast_nullable_to_non_nullable
as double,maxBrightness: null == maxBrightness ? _self.maxBrightness : maxBrightness // ignore: cast_nullable_to_non_nullable
as double,displaySize: null == displaySize ? _self.displaySize : displaySize // ignore: cast_nullable_to_non_nullable
as Size,minXPanning: null == minXPanning ? _self.minXPanning : minXPanning // ignore: cast_nullable_to_non_nullable
as double,maxXPanning: null == maxXPanning ? _self.maxXPanning : maxXPanning // ignore: cast_nullable_to_non_nullable
as double,minYPanning: null == minYPanning ? _self.minYPanning : minYPanning // ignore: cast_nullable_to_non_nullable
as double,maxYPanning: null == maxYPanning ? _self.maxYPanning : maxYPanning // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
