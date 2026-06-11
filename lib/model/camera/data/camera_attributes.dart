import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_attributes.freezed.dart';

@freezed
abstract class CameraAttributes with _$CameraAttributes {
  const factory CameraAttributes({
    @Default(false) bool menuOpen,
    @Default(1.0) double zoom,
    @Default(0.0) double brightness,

    // Límites
    @Default(1.0) double minZoom,
    @Default(4.0) double maxZoom,
    @Default(-2.0) double minBrightness,
    @Default(2.0) double maxBrightness,
  }) = _CameraAttributes;
}