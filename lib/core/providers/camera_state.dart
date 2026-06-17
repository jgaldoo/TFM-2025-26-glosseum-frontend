import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';
import 'package:glosseum_frontend/core/enums/camera_mode_enum.dart';

part 'camera_state.freezed.dart';

@freezed
abstract class CameraState with _$CameraState {
  const factory CameraState({
    @Default(false) bool isInitialized,
    CameraController? controller,
    XFile? pictureTaken,
    @Default(false) bool permissionGranted,
  }) = _CameraState;
}