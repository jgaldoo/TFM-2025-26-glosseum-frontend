import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/glosseum_camera_interface_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IconSlider extends StatelessWidget {
  final Axis axis;
  final IconData lowerValueIcon;
  final IconData higherValueIcon;
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
      Icon(
        isVertical ? higherValueIcon : lowerValueIcon,
        color: camInterfaceTheme.primaryIconColor,
        size: size,
      ),
      RotatedBox(
        quarterTurns: isVertical ? -1 : 0,
        child: Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
        ),
      ),
      Icon(
        isVertical ? lowerValueIcon : higherValueIcon,
        color: camInterfaceTheme.primaryIconColor,
        size: size,
      ),
    ];

    return (isVertical
        ? Column(
            children: content,
          )
        : Row(
            children: content,
          )
    );
  }
}