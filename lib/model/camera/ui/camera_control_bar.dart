import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/app_screen_groups.dart';
import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:glosseum_frontend/core/theme/glosseum_camera_interface_theme.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';
import 'package:glosseum_frontend/core/theme/glosseum_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:glosseum_frontend/core/enums/camera_mode_enum.dart';

import 'camera_button.dart';

class CameraControlBar extends ConsumerWidget {
  final CameraModeEnum cameraMode;
  final VoidCallback onScreenChange;
  final VoidCallback onActionPressed;
  const CameraControlBar({
    super.key,
    required this.cameraMode,
    required this.onScreenChange,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isQR = cameraMode == CameraModeEnum.qrScanner;
    final isCamera = cameraMode == CameraModeEnum.photo;

    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child : CameraButton(
                      onPressed: onScreenChange,
                      icon: isCamera ? Icons.qr_code_scanner : Icons.camera_alt_outlined,
                      primary: false,
                      size: 60,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: CameraButton(
                    onPressed: onActionPressed,
                    icon: isQR ? Icons.qr_code_scanner : Icons.camera_alt_outlined,
                    size: 80,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
    );
  }

}