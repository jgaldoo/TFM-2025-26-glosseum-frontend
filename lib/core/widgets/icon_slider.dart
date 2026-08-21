import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_camera_interface_theme.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon_data.dart';

class IconSlider extends StatelessWidget {
  final Axis axis;
  final GlosseumIconData lowerValueIcon;
  final GlosseumIconData higherValueIcon;
  final double size;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const IconSlider({
    super.key,
    required this.axis,
    required this.lowerValueIcon,
    required this.higherValueIcon,
    required this.size,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isVertical = axis == Axis.vertical;
    final camInterfaceTheme = cameraInterfaceThemeOf(context);

    final content = [
      GlosseumIcon(
        isVertical ? higherValueIcon : lowerValueIcon,
        color: camInterfaceTheme.primaryIconColor,
        size: size,
      ),
      RotatedBox(
        quarterTurns: isVertical ? -1 : 0,
        child: Slider(value: value, min: min, max: max, onChanged: onChanged),
      ),
      GlosseumIcon(
        isVertical ? lowerValueIcon : higherValueIcon,
        color: camInterfaceTheme.primaryIconColor,
        size: size,
      ),
    ];

    return (isVertical ? Column(children: content) : Row(children: content));
  }
}
