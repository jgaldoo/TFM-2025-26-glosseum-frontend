import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:glosseum_frontend/core/enums/camera_mode_enum.dart';

import 'package:glosseum_frontend/model/camera/ui/camera_button.dart';

class CameraControlBar extends ConsumerWidget {
  final double _height = 100;

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
    final double subButtonSize = 60;
    final double mainButtonSize = 80;

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: _height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: constraints.maxWidth * 0.2 - subButtonSize * 0.5,
                  child: CameraButton(
                    onPressed: onScreenChange,
                    icon: isCamera
                        ? GlosseumIcons.qr_code_scanner
                        : GlosseumIcons.camera,
                    primary: false,
                    size: subButtonSize,
                  ),
                ),
                if (isCamera) ...[
                  Positioned(
                    left: constraints.maxWidth * 0.5 - mainButtonSize * 0.5,
                    child: CameraButton(
                      onPressed: onActionPressed,
                      icon: GlosseumIcons.camera,
                      size: mainButtonSize,
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
