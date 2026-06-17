import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_attributes.freezed.dart';

@freezed
abstract class ImageAttributes with _$ImageAttributes {
  const factory ImageAttributes({
    @Default(false) bool menuOpen,
    @Default(1.0) double zoom,
    @Default(0.0) double brightness,
    @Default(Offset.zero) Offset panningOffset,

    // Limits
    @Default(1.0) double minZoom,
    @Default(4.0) double maxZoom,
    @Default(-2.0) double minBrightness,
    @Default(2.0) double maxBrightness,

    // Panning-related
    @Default(Size.zero) Size displaySize,
    @Default(0.0) double minXPanning,
    @Default(0.0) double maxXPanning,
    @Default(0.0) double minYPanning,
    @Default(0.0) double maxYPanning,
  }) = _ImageAttributes;
}