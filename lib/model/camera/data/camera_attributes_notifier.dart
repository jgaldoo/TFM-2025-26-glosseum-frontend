import 'package:async/async.dart';
import 'package:camera/camera.dart';
import 'package:glosseum_frontend/model/camera/data/camera_attributes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_attributes_notifier.g.dart';

@riverpod
class CameraAttributesNotifier extends _$CameraAttributesNotifier {
  CameraController? _controller;
  CancelableOperation? _zoomOperation;
  CancelableOperation? _brightnessOperation;

  void attachController(CameraController? controller) {
    _controller = controller;
  }

  @override
  CameraAttributes build() => const CameraAttributes();

  void toggleMenu() => state = state.copyWith(menuOpen: !state.menuOpen);

  Future<void> setZoom(double value) async {
    state = state.copyWith(zoom: value);

    await _zoomOperation?.cancel();

    _zoomOperation = CancelableOperation.fromFuture(
        _controller != null
            ? _controller!.setZoomLevel(value)
            : Future.value(),
    );

    await _zoomOperation!.valueOrCancellation();
  }

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