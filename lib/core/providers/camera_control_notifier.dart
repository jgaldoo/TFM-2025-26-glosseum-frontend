import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:glosseum_frontend/model/camera/data/camera_attributes_notifier.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:glosseum_frontend/core/models/camera_state.dart';

part 'camera_control_notifier.g.dart';

@riverpod
class CameraNotifier extends _$CameraNotifier {
  CameraDescription? _camera;
  CameraController? _cameraController;
  BarcodeScanner? _barcodeScanner;
  Rect? _scanArea;
  bool _isInitializing = false;
  bool _isDisposing = false;
  bool _isProcessing = false;
  bool _isStartingScan = false;

  @override
  CameraState build() => const CameraState();

  Future<void> _processCameraImage(CameraImage image) async {
    if (_camera == null ||
        _isDisposing ||
        _isProcessing ||
        state.isProcessingScan) {
      return;
    }

    try {
      _isProcessing = true;
      final conversionResult = _inputImageFromCameraImage(image);

      final inputImage = conversionResult?.$1;
      final rotation = conversionResult?.$2;

      if (inputImage == null) return;

      final barcodes = await _barcodeScanner!.processImage(inputImage);

      if (barcodes.isEmpty) {
        return;
      }
      final code = barcodes.first;
      if (_scanArea != null) {
        // Determine area in pixels from normalize rectangle
        final areDimensionsRotated =
            (rotation == InputImageRotation.rotation90deg ||
            rotation == InputImageRotation.rotation270deg);
        final usableWidth = areDimensionsRotated
            ? image.width.toDouble()
            : image.height.toDouble();
        final usableHeight = areDimensionsRotated
            ? image.height.toDouble()
            : image.width.toDouble();

        final imageScanArea = Rect.fromLTRB(
          _scanArea!.left * usableHeight,
          _scanArea!.top * usableWidth,
          _scanArea!.right * usableHeight,
          _scanArea!.bottom * usableWidth,
        );

        if (imageScanArea.contains(code.boundingBox.center)) {
          state = state.copyWith(
            scannedValue: code.rawValue,
            isProcessingScan: true,
          );
          await stopScanning();
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  // Code taken from google_mlkit_commons on pub.dev and adapted to this project
  // ----
  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  (InputImage, InputImageRotation)? _inputImageFromCameraImage(
    CameraImage image,
  ) {
    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas
    final sensorOrientation = _camera!.sensorOrientation;
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[_cameraController!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (_camera!.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    if (rotation == null) return null;

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return (
      InputImage.fromBytes(
        bytes: plane.bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: rotation, // used only in Android
          format: format, // used only in iOS
          bytesPerRow: plane.bytesPerRow, // used only in iOS
        ),
      ),
      rotation,
    );
  }

  // ----

  Future<void> finishProcessingScan() async {
    if (!state.isProcessingScan) return;

    state = state.copyWith(scannedValue: null, isProcessingScan: false);

    await startScanning();
  }

  Future<void> startScanning() async {
    if (_isStartingScan ||
        _cameraController == null ||
        !state.isInitialized ||
        state.isScanning ||
        state.isProcessingScan) {
      return;
    }

    try {
      _isStartingScan = true;

      _barcodeScanner ??= BarcodeScanner(formats: [BarcodeFormat.qrCode]);

      await _cameraController!.startImageStream(_processCameraImage);

      state = state.copyWith(isScanning: true);
    } finally {
      _isStartingScan = false;
    }
  }

  Future<void> stopScanning() async {
    if (_cameraController == null || !state.isScanning) return;

    await _cameraController!.stopImageStream();

    state = state.copyWith(isScanning: false);
  }

  Future<bool> checkCameraPermission(bool requestPermission) async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied && requestPermission) {
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
      _camera = cameras.first;
      final controller = CameraController(
        _camera!,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: switch (defaultTargetPlatform) {
          TargetPlatform.android => ImageFormatGroup.nv21,
          TargetPlatform.iOS => ImageFormatGroup.bgra8888,
          _ => null,
        },
      );

      await controller.initialize();

      ref.read(cameraAttributesProvider.notifier).attachController(controller);

      final minZoom = await controller.getMinZoomLevel();
      final maxZoom = await controller.getMaxZoomLevel();
      final minExposure = await controller.getMinExposureOffset();
      final maxExposure = await controller.getMaxExposureOffset();

      _cameraController = controller;

      ref
          .read(cameraAttributesProvider.notifier)
          .setLimits(
            minZoom: minZoom,
            maxZoom: maxZoom,
            minBrightness: minExposure,
            maxBrightness: maxExposure,
          );

      state = state.copyWith(
        controller: _cameraController,
        isInitialized: true,
      );
    } finally {
      // Ensure we remove the initialization flag
      _isInitializing = false;
    }
  }

  Future<void> takePicture() async {
    if (!state.isInitialized || state.controller == null) {
      throw FlutterError(
        'Tried to take a picture while the camera controller '
        "wasn't set. Please ensure the controller has been initialized "
        'beforehand.',
      );
    }

    final picture = await state.controller!.takePicture();
    state = state.copyWith(pictureTaken: picture);
  }

  void dispose() async {
    if (_isDisposing) return;
    _isDisposing = true;

    try {
      if (state.isScanning) {
        await stopScanning();
      }
      await _cameraController?.dispose();
      await _barcodeScanner?.close();

      state = state.copyWith(controller: null, isInitialized: false);
    } finally {
      _isDisposing = false;
    }
  }

  Future<void> pause() async {
    if (state.isScanning) {
      await stopScanning();
    }

    await _cameraController?.pausePreview();
  }

  Future<void> resume() async {
    await _cameraController?.resumePreview();
  }

  void setScanArea(Rect? scanArea) {
    _scanArea = scanArea;
  }
}
