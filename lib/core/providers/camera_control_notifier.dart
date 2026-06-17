import 'package:flutter/foundation.dart';
import 'package:glosseum_frontend/model/camera/data/camera_attributes_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:glosseum_frontend/core/providers/camera_state.dart';

part 'camera_control_notifier.g.dart';

@riverpod
class CameraNotifier extends _$CameraNotifier {
  bool _isInitializing = false;
  bool _isDisposing = false;

  @override
  CameraState build() => const CameraState();

  Future<bool> checkCameraPermission(bool requestPermission) async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    }
    else if (status.isDenied && requestPermission) {
      return await Permission.camera.request().isGranted;
    }

    return false;
  }

  Future<void> initCamera(bool requestPermission) async {
    if (_isInitializing) return;
    _isInitializing = true;

    try {
      final granted = await checkCameraPermission(requestPermission);

      if (!granted) {
        state = state.copyWith(permissionGranted: false);
        return;
      }

      state = state.copyWith(permissionGranted: true);

      final cameras = await availableCameras();
      final controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await controller.initialize();

      ref.read(cameraAttributesProvider.notifier)
          .attachController(controller);

      final minZoom = await controller.getMinZoomLevel();
      final maxZoom = await controller.getMaxZoomLevel();
      final minExposure = await controller.getMinExposureOffset();
      final maxExposure = await controller.getMaxExposureOffset();

      ref.read(cameraAttributesProvider.notifier).setLimits(
        minZoom: minZoom,
        maxZoom: maxZoom,
        minBrightness: minExposure,
        maxBrightness: maxExposure,
      );

      state = state.copyWith(
        controller: controller,
        isInitialized: true,
      );
    } finally { // Ensure we remove the initialization flag
      _isInitializing = false;
    }
  }

  Future<void> takePicture() async {
    if (!state.isInitialized || state.controller == null) {
      throw FlutterError('Tried to take a picture while the camera controller '
          "wasn't set. Please ensure the controller has been initialized "
          'beforehand.'
      );
    }

    final picture = await state.controller!.takePicture();
    state = state.copyWith(pictureTaken: picture);
  }

  void dispose() {
    if (_isDisposing) return;
    _isDisposing = true;

    try {
      state.controller?.dispose();
      state = state.copyWith(
        controller: null,
        isInitialized: false,
      );
    } finally {
      _isDisposing = false;
    }
  }

}
