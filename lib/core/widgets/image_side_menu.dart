import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/models/image_attribute_interface.dart';
import 'package:glosseum_frontend/core/theme/glosseum_camera_interface_theme.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/widgets/icon_slider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageSideMenu extends ConsumerWidget{
  final ImageAttributeInterface imageAttributeInterface;

  const ImageSideMenu({
    super.key,
    required this.imageAttributeInterface,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attributes = imageAttributeInterface.state;
    final camInterfaceTheme = cameraInterfaceThemeOf(context);

    final double containerWidth = 140;
    const double closingOffset = 0.75;


    return AnimatedSlide(
      duration: const Duration(milliseconds: 250),
      offset: attributes.menuOpen
          ? Offset.zero
          : const Offset(closingOffset, 0.0),
      child: Container(
        width: containerWidth,
        height: 300,
        decoration: BoxDecoration(
          color: camInterfaceTheme.primaryBackground.withValues(alpha: 0.6),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              alignment: attributes.menuOpen
                ? Alignment.centerLeft
                : Alignment.center,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => imageAttributeInterface.toggleMenu(),
                child: SizedBox(
                  // Ensure no slider can be reached when the menu is closed
                  width: containerWidth * (1 - closingOffset),
                  child: Center(
                    child: Transform.translate(
                      offset: const Offset(-5, 0),
                      child: Icon(
                        attributes.menuOpen
                            ? Icons.chevron_right
                            : Icons.chevron_left,
                        color: camInterfaceTheme.primaryIconColor,
                        size: 45,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconSlider(
                    axis: Axis.vertical,
                    lowerValueIcon: GlosseumIcons.zoom_out,
                    higherValueIcon: GlosseumIcons.zoom_in,
                    size: 30,
                    value: attributes.zoom,
                    min: attributes.minZoom,
                    max: attributes.maxZoom,
                    onChanged: (v) =>
                        Future.microtask(() {
                          imageAttributeInterface.setZoom(v);
                        }),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconSlider(
                    axis: Axis.vertical,
                    lowerValueIcon: GlosseumIcons.moon,
                    higherValueIcon: GlosseumIcons.sun,
                    size: 30,
                    value: attributes.brightness,
                    min: attributes.minBrightness,
                    max: attributes.maxBrightness,
                    onChanged: (v) =>
                        Future.microtask(() {
                          imageAttributeInterface.setBrightness(v);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
