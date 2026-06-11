import 'package:glosseum_frontend/core/models/image_attribute_interface.dart';
import 'package:glosseum_frontend/core/models/image_attributes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_attributes_notifier.g.dart';

@riverpod
class PhotoAttributesNotifier extends _$PhotoAttributesNotifier implements
    ImageAttributeInterface {
  @override
  ImageAttributes build() => const ImageAttributes();

  @override
  void toggleMenu() {
    state = state.copyWith(menuOpen: !state.menuOpen);
  }

  @override
  void setZoom(double value) {
    state = state.copyWith(zoom: value);
  }

  @override
  void setBrightness(double value) {
    state = state.copyWith(brightness: value);
  }

  @override
  void setLimits({
    required double minZoom,
    required double maxZoom,
    required double minBrightness,
    required double maxBrightness
  }) {
    state = state.copyWith(
      minZoom: minZoom,
      maxZoom: maxZoom,
      minBrightness: minBrightness,
      maxBrightness: maxBrightness,
    );
  }
}
