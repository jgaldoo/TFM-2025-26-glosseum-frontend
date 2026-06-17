import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:glosseum_frontend/core/enums/camera_mode_enum.dart';

import 'package:glosseum_frontend/model/camera/ui/camera_button.dart';

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
    final isCamera = cameraMode == CameraModeEnum.camera;

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
                      icon: isCamera
                          ? GlosseumIcons.qr_code_scanner
                          : GlosseumIcons.camera,
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
                    icon: isCamera
                        ? GlosseumIcons.camera
                        : GlosseumIcons.qr_code_scanner,
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
