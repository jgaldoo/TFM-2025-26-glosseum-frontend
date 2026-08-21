import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';

part 'camera_state.freezed.dart';

@freezed
abstract class CameraState with _$CameraState {
  const factory CameraState({
    @Default(false) bool isInitialized,
    @Default(false) bool isScanning,
    @Default(false) bool isProcessingScan,
    CameraController? controller,
    XFile? pictureTaken,
    String? scannedValue,
    @Default(false) bool permissionGranted,
  }) = _CameraState;
}
