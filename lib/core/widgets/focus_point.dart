import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_camera_interface_theme.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/widgets/transparent_circle.dart';

class FocusPoint extends StatelessWidget {
  final double focusPointSize;
  final double containerSizeWidth;
  final Offset? focusDisplayOffset;

  final double brightness;
  final double minBrightness;
  final double maxBrightness;

  const FocusPoint({
    super.key,
    required this.focusPointSize,
    required this.containerSizeWidth,
    this.focusDisplayOffset,
    required this.brightness,
    required this.minBrightness,
    required this.maxBrightness,
  });

  @override
  Widget build(BuildContext context) {
    final cameraInterfaceTheme = cameraInterfaceThemeOf(context);
    final focusRadius = focusPointSize / 2;
    final double iconSize = 20;
    final double barWidth = 2;
    final brightnessBarHeight = focusPointSize * 1.5 + iconSize / 2;
    final brightnessBarCircleHeight =
        brightnessBarHeight *
        (1 - (brightness - minBrightness) / (maxBrightness - minBrightness));

    final bool showLeft =
        focusDisplayOffset != null &&
        focusDisplayOffset!.dx > containerSizeWidth * 0.7;

    // dx +- iconSize +- focusRadius - barContainerWidth
    final double brightnessBarSpacing = showLeft
        ? focusDisplayOffset!.dx - iconSize - focusRadius - 20
        : focusDisplayOffset != null
        ? focusDisplayOffset!.dx + iconSize + focusRadius - 20
        : 0;

    return focusDisplayOffset != null
        ? Stack(
            children: [
              Positioned(
                left: focusDisplayOffset!.dx - focusRadius,
                top: focusDisplayOffset!.dy - focusRadius,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: focusPointSize,
                      height: focusPointSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: cameraInterfaceTheme.secondaryIconColor,
                          width: 4,
                        ),
                      ),
                    ),
                    Container(
                      width: focusPointSize,
                      height: focusPointSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: cameraInterfaceTheme.primaryIconColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.dstOut,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: brightnessBarSpacing,
                      top:
                          focusDisplayOffset!.dy -
                          (brightnessBarHeight / 2) -
                          (iconSize / 2),
                      child: SizedBox(
                        height: brightnessBarHeight + iconSize,
                        width: 40,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 20 - barWidth / 2,
                              top: iconSize / 2,
                              child: Container(
                                width: barWidth,
                                height: brightnessBarHeight,
                                color: cameraInterfaceTheme.primaryIconColor,
                              ),
                            ),
                            TransparentCircle(
                              radius: (iconSize / 2) + 1,
                              offset: Offset(
                                20,
                                brightnessBarCircleHeight + (iconSize / 2),
                              ),
                            ),
                            Positioned(
                              left: 20 - (iconSize / 2),
                              top: brightnessBarCircleHeight,
                              child: GlosseumIcon(
                                GlosseumIcons.sun,
                                color: cameraInterfaceTheme.primaryIconColor,
                                size: iconSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
