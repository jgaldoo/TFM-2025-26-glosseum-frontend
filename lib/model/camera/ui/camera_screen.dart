import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/database/daos/information_dao.dart';
import 'package:glosseum_frontend/core/enums/camera_mode_enum.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/providers/camera_control_notifier.dart';
import 'package:glosseum_frontend/core/providers/database_providers/glosseum_database_provider.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/widgets/navbar/nav_entry.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/grabbable_panel/error_grabbable_panel.dart';
import 'package:glosseum_frontend/core/widgets/loading_blur_overlay.dart';
import 'package:glosseum_frontend/model/camera/data/camera_attributes_notifier.dart';
import 'package:glosseum_frontend/model/camera/ui/camera_control_bar.dart';
import 'package:glosseum_frontend/model/camera/ui/camera_gesture_layer.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/photo/data/dtos/photo_dto.dart';
import 'package:glosseum_frontend/model/photo/data/photo_api_provider.dart';
import 'package:glosseum_frontend/model/photo/data/photo_attributes_notifier.dart';
import 'package:glosseum_frontend/model/photo/ui/photo_preview.dart';
import 'package:glosseum_frontend/model/qr/ui/qr_overlay.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:glosseum_frontend/core/widgets/image_side_menu.dart';

class CameraScreen extends ConsumerStatefulWidget {
  final CameraModeEnum cameraMode;

  const CameraScreen({super.key, required this.cameraMode});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen>
    with WidgetsBindingObserver {
  late CameraModeEnum _cameraMode;
  late CameraModeEnum _lastCameraMode;
  bool _cameraPaused = false;
  bool _isLoading = false;

  void _transcribe(BuildContext context, WidgetRef ref) async {
    final state = ref.watch(cameraProvider);

    setState(() {
      _isLoading = true;
    });

    final ApiResult<InformationDTO> transcribeResult = await ref
        .read(photoAPIProvider.notifier)
        .transcribe(
          state.pictureTaken != null
              ? PhotoDTO(
                  fileBytes: await state.pictureTaken!.readAsBytes(),
                  fileName: state.pictureTaken!.name,
                )
              : PhotoDTO(),
        );

    // Ensure the widget exists before trying to do
    // further operations
    if (!context.mounted) return;

    setState(() {
      _isLoading = false;
    });

    transcribeResult.when(
      success: (infoDTO, statusCode, message) {
        final InformationDAO informationDAO = ref
            .watch(glosseumDatabaseProvider)
            .informationDAO;
        final Information information = Information.fromDTO(infoDTO);

        informationDAO.insertInformation(information);
        context.push('/information', extra: information);
      },
      error: (errorType, statusCode, message) {
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          isScrollControlled: true,
          builder: (_) {
            return ErrorGrabbablePanel(
              statusCode: statusCode,
              message: message,
            );
          },
        );
      },
    );

    // context.push(AppScreenEnum.information, info)
  }

  void _reloadLastCameraMode(WidgetRef ref) {
    setState(() {
      _cameraMode = _lastCameraMode;
    });
  }

  Widget? _screenBottomNavbar() {
    return _cameraMode == CameraModeEnum.photo
        ? BottomNavbar(
            entries: [
              NavEntry(
                icon: GlosseumIcons.back,
                label: 'Atrás',
                onTap: (context, ref) async => {_reloadLastCameraMode(ref)},
              ),
              NavEntry(
                icon: GlosseumIcons.identify,
                label: 'Identificar',
                onTap: (context, ref) async => {
                  // await petición a API
                  // context.push(AppScreenEnum.information, info)
                },
              ),
              NavEntry(
                icon: GlosseumIcons.transcribe,
                label: 'Transcribir',
                onTap: (context, ref) async {
                  _transcribe(context, ref);
                },
              ),
            ],
          )
        : SizedBox.shrink();
  }

  void _toggleMode() {
    // Ensure changes only happen between camera and qrScanner modes
    if (_cameraMode != CameraModeEnum.camera &&
        _cameraMode != CameraModeEnum.qrScanner) {
      return;
    }

    setState(() {
      _cameraMode = _cameraMode == CameraModeEnum.camera
          ? CameraModeEnum.qrScanner
          : CameraModeEnum.camera;
    });

    if (_cameraMode == CameraModeEnum.camera) {
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

    // Trigger rebuild when cameraAttributes or photoAttributes are changed
    ref.listen(cameraAttributesProvider, (_, _) {
      if (_cameraMode == CameraModeEnum.camera ||
          _cameraMode == CameraModeEnum.qrScanner) {
        setState(() {});
      }
    });

    ref.listen(photoAttributesProvider, (_, _) {
      if (_cameraMode == CameraModeEnum.photo) {
        setState(() {});
      }
    });

    if (!state.permissionGranted) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Camera permission not granted'),
              ElevatedButton(
                onPressed: () {
                  openAppSettings();
                },
                child: const Text('Go to Settings'),
              ),
            ],
          ),
        ),
      );
    }

    if (!state.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return LoadingBlurOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            CameraGestureLayer(
              imageAttributeInterface: _cameraMode == CameraModeEnum.photo
                  ? ref.watch(photoAttributesProvider.notifier)
                  : ref.watch(cameraAttributesProvider.notifier),
              enablePanning: true,
              child: IndexedStack(
                index: _cameraMode.index,
                children: [
                  // CameraModeEnum.camera
                  state.controller != null
                      ? SizedBox.expand(child: CameraPreview(state.controller!))
                      : const SizedBox.shrink(),

                  // CameraModeEnum.qrScanner
                  const QrOverlay(
                    borderRadius: 30,
                    borderLength: 80,
                    borderWidth: 5,
                  ),

                  // CameraModeEnum.photo
                  state.controller != null && state.pictureTaken != null
                      ? SizedBox.expand(
                          child: PhotoPreview(
                            imagePath: state.pictureTaken!.path,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),

            SafeArea(
              child: Align(
                alignment: Alignment(1, 0.5),
                child: ImageSideMenu(
                  imageAttributeInterface: _cameraMode == CameraModeEnum.photo
                      ? ref.watch(photoAttributesProvider.notifier)
                      : ref.watch(cameraAttributesProvider.notifier),
                ),
              ),
            ),

            if (_cameraMode != CameraModeEnum.photo)
              SafeArea(
                child: Align(
                  alignment: Alignment(0, 0.8),
                  child: CameraControlBar(
                    cameraMode: _cameraMode,
                    onScreenChange: _toggleMode,
                    onActionPressed: (() {
                      ref.read(cameraProvider.notifier).takePicture();
                      setState(() {
                        _lastCameraMode = _cameraMode;
                      });
                      setState(() {
                        _cameraMode = CameraModeEnum.photo;
                      });
                    }),
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: _screenBottomNavbar(),
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
    //AppLifecycleState is resumed when going back to the app, and is paused or
    //inactive when the app ceases to be used.
    final cameraNotifier = ref.read(cameraProvider.notifier);

    // Register when the user moves away from the camera
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
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
