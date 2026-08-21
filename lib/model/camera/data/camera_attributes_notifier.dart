import 'dart:ui';
import 'package:async/async.dart';
import 'package:camera/camera.dart';
import 'package:glosseum_frontend/core/models/image_attribute_interface.dart';
import 'package:glosseum_frontend/core/models/image_attributes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_attributes_notifier.g.dart';

@riverpod
class CameraAttributesNotifier extends _$CameraAttributesNotifier
    implements ImageAttributeInterface {
  CameraController? _controller;
  CancelableOperation? _zoomOperation;
  CancelableOperation? _brightnessOperation;
  int _lastZoomUpdate = DateTime.now().millisecondsSinceEpoch;

  static const int _zoomUpdateMilliseconds = 16;

  void attachController(CameraController? controller) {
    _controller = controller;
  }

  @override
  ImageAttributes build() => const ImageAttributes();

  @override
  void toggleMenu() => state = state.copyWith(menuOpen: !state.menuOpen);

  @override
  void setZoom(double value) async {
    final trueValue = value.clamp(state.minZoom, state.maxZoom);
    state = state.copyWith(zoom: trueValue);

    // Force updating at a fluid frame rate
    final now = DateTime
        .now()
        .millisecondsSinceEpoch;
    if (now - _lastZoomUpdate < _zoomUpdateMilliseconds) return;
    _lastZoomUpdate = now;

    await _zoomOperation?.cancel();

    _zoomOperation = CancelableOperation.fromFuture(
        _controller != null
            ? _controller!.setZoomLevel(trueValue)
            : Future.value(),
    );

    await _zoomOperation!.valueOrCancellation();
  }

  @override
  void setBrightness(double value) async {
    final trueValue = value.clamp(state.minBrightness, state.maxBrightness);
    state = state.copyWith(brightness: trueValue);

    await _brightnessOperation?.cancel();

    _brightnessOperation = CancelableOperation.fromFuture(
    _controller != null
    ? _controller!.setExposureOffset(trueValue)
        : Future.value(),
    );

    await _brightnessOperation!.valueOrCancellation();
  }

  @override
  void setLimits({
    required double minZoom,
    required double maxZoom,
    required double minBrightness,
    required double maxBrightness,
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

  @override
  void setExposurePoint(Offset point) {
    if (_controller != null) {
      _controller!.setFocusPoint(point);
    }
  }

  @override
  void setFocusPoint(Offset point) {
    if (_controller != null) {
      _controller!.setExposurePoint(point);
    }
  }

  // Camera preview won't accept panning
  @override
  void setPanningOffset(Offset panning) {
    return;
  }

  // Camera preview won't accept panning
  @override
  void addPanningOffset(Offset panning) {
    state = state.copyWith(panningOffset: state.panningOffset + panning);
  }
}
