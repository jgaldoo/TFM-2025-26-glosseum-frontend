import 'dart:ui';

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
    final trueValue = value.clamp(state.minZoom, state.maxZoom);

    // Update panning constraints to ensure panning is appropriate
    final maxPanningWidth = ((state.displaySize.width * trueValue) - state.displaySize.width)/2;
    final maxPanningHeight = ((state.displaySize.height * trueValue) - state.displaySize.height)/2;

    state = state.copyWith(
      zoom: trueValue,
      minXPanning: -maxPanningWidth,
      maxXPanning: maxPanningWidth,
      minYPanning: -maxPanningHeight,
      maxYPanning: maxPanningHeight,
      panningOffset: Offset(
          state.panningOffset.dx.clamp(-maxPanningWidth, maxPanningWidth),
          state.panningOffset.dy.clamp(-maxPanningHeight, maxPanningHeight),
        ),
    );
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

  @override
  void setDisplaySize(Size displaySize) {
    state = state.copyWith(displaySize: displaySize);
  }

  // Photos won't take an exposure point
  @override
  void setExposurePoint(Offset point) {
    return;
  }

  // Photos won't take a focus point
  @override
  void setFocusPoint(Offset point) {
    return;
  }

  @override
  void setPanningOffset(Offset panning) {
    state = state.copyWith(
        panningOffset: Offset(
          panning.dx.clamp(state.minXPanning, state.maxXPanning),
          panning.dy.clamp(state.minYPanning, state.maxYPanning),
        ),
    );
  }

  @override
  void addPanningOffset(Offset panning) {
    state = state.copyWith(
      panningOffset: Offset(
        (state.panningOffset.dx + panning.dx).clamp(state.minXPanning, state.maxXPanning),
        (state.panningOffset.dy + panning.dy).clamp(state.minYPanning, state.maxYPanning),
      ),
    );
  }
}
