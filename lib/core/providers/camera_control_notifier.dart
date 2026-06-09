import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'camera_state.dart';

part 'camera_control_notifier.g.dart';

@riverpod
class CameraNotifier extends _$CameraNotifier {
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
    );

    await controller.initialize();

    state = state.copyWith(
      controller: controller,
      isInitialized: true,
    );
  }

  Future<void> takePicture() async {
    if (!state.isInitialized || state.controller == null) return;

    final picture = await state.controller!.takePicture();
    state = state.copyWith(lastPicture: picture);
  }

  void dispose() {
    state.controller?.dispose();
  }

}
