import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/providers/camera_control_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});

  ConsumerState<CameraScreen> createState() => _CameraScreenState();

}

class _CameraScreenState extends ConsumerState<CameraScreen>
with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();

    // Register lifecycle observer
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cameraProvider.notifier).initCamera(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cameraProvider);

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
      body: CameraPreview(state.controller!),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(cameraProvider.notifier).takePicture();
        },
        child: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //AppLifecycleState is resumed when going back to the app
    if (state == AppLifecycleState.resumed) {
      ref.read(cameraProvider.notifier).initCamera(false);
    }
  }
}