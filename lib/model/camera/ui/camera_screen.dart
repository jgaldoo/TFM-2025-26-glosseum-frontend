import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/enums/camera_mode_enum.dart';
import 'package:glosseum_frontend/core/providers/camera_control_notifier.dart';
import 'package:glosseum_frontend/model/camera/data/camera_attributes_notifier.dart';
import 'package:glosseum_frontend/model/camera/ui/camera_control_bar.dart';
import 'package:glosseum_frontend/model/camera/ui/qr_overlay.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'camera_side_menu.dart';


class CameraScreen extends ConsumerStatefulWidget {
  final CameraModeEnum cameraMode;

  const CameraScreen({
    super.key,
    required this.cameraMode
  });

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();

}

class _CameraScreenState extends ConsumerState<CameraScreen>
    with WidgetsBindingObserver {
  late CameraModeEnum _cameraMode;
  bool _cameraPaused = false;

  void _toggleMode() {
    setState(() {
      _cameraMode = _cameraMode == CameraModeEnum.photo
          ? CameraModeEnum.qrScanner
          : CameraModeEnum.photo;
    });

    if (_cameraMode == CameraModeEnum.photo) {
      ref.read(cameraProvider.notifier).initCamera(false);
    } else {
      ref.read(cameraProvider.notifier).dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    _cameraMode = widget.cameraMode;

    // Register lifecycle observer
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(cameraProvider.notifier).initCamera(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cameraProvider);
    final attributes = ref.watch(cameraAttributesProvider);

    if (!state.permissionGranted) {
      return Scaffold(
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Camera permission not granted"),
                ElevatedButton(onPressed: () {
                  openAppSettings();
                }, child: const Text('Go to Settings')),
              ],
            )),
      );
    }

    if (!state.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          IndexedStack(
            index: _cameraMode.index,
            children: [
              // CameraModeEnum.photo
              state.controller != null
                  ? SizedBox.expand(child: CameraPreview(state.controller!))
                  : const SizedBox.shrink(),

              // CameraModeEnum.qrScanner
              const QrOverlay(
                borderRadius: 30,
                borderLength: 80,
                borderWidth: 5,
              ),
            ],
          ),

          SafeArea(
            child: Align(
              alignment: Alignment(1, 0.5),
              child: CameraSideMenu(),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment(0, 0.8),
              child: CameraControlBar(
                cameraMode: _cameraMode,
                onScreenChange: _toggleMode,
                onActionPressed: (() {
                  ref.read(cameraProvider.notifier).takePicture();
                }),
              ),
            )
          )

        ],
      )
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //AppLifecycleState is resumed when going back to the app, and is paused or
    //inactive when the app ceases to be used.
    final cameraNotifier = ref.read(cameraProvider.notifier);

    // Register when the user moves away from the camera
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _cameraPaused = true;
      cameraNotifier.dispose();
    }

    // If the user moved away from the camera and is now back, reinitialize
    if (state == AppLifecycleState.resumed && _cameraPaused) {
      _cameraPaused = false;
      cameraNotifier.initCamera(false);
    }
  }
}