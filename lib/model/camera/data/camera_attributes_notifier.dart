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

  void attachController(CameraController? controller) {
    _controller = controller;
  }

  @override
  ImageAttributes build() => const ImageAttributes();

  @override
  void toggleMenu() => state = state.copyWith(menuOpen: !state.menuOpen);

  @override
  void setZoom(double value) async {
    state = state.copyWith(zoom: value);

    await _zoomOperation?.cancel();

    _zoomOperation = CancelableOperation.fromFuture(
        _controller != null
            ? _controller!.setZoomLevel(value)
            : Future.value(),
    );

    await _zoomOperation!.valueOrCancellation();
  }

  @override
  void setBrightness(double value) async {
    state = state.copyWith(brightness: value);

    await _brightnessOperation?.cancel();

    _brightnessOperation = CancelableOperation.fromFuture(
    _controller != null
    ? _controller!.setExposureOffset(value)
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
}