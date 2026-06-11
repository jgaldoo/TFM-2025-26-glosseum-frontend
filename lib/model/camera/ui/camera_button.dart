import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/glosseum_camera_interface_theme.dart';

class CameraButton extends StatefulWidget {
  final IconData? icon;
  final VoidCallback onPressed;
  final bool primary;
  final double size;

  const CameraButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.primary = true,
    this.size = 56
  });

  @override
  State<StatefulWidget> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  void _animate() {
    _controller.forward(from: 0);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final camInterfaceTheme = cameraInterfaceThemeOf(context);

    final background = widget.primary
        ? camInterfaceTheme.primaryBackground
        : camInterfaceTheme.secondaryBackground;

    final iconColor = widget.primary
        ? camInterfaceTheme.primaryIconColor
        : camInterfaceTheme.secondaryIconColor;

    final borderColor = widget.primary
        ? camInterfaceTheme.primaryBackground.withValues(alpha: 0.2)
        : camInterfaceTheme.secondaryBackground.withValues(alpha: 0.2);

/*    return Material(
      color: background,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        splashColor: background.withValues(alpha: 0.2),
        highlightColor: background.withValues(alpha: 0.1),
        onTap: widget.onPressed,
        child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Center(
              child: widget.icon != null
                ? Icon(widget.icon, color: iconColor, size: widget.size * 0.5)
                : null,
            ),
          ),
      )
    );*/


    return GestureDetector(
      onTap: _animate,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
                width: widget.size*0.1,
              ),
            ),
            child: Container(
                width: widget.size*0.8,
                height: widget.size*0.8,
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: (
                    widget.icon != null
                        ? Icon(widget.icon, color: iconColor, size: widget.size*0.5)
                        : null
                )
            ),
          ),
        ],
      ),
    );
  }
}
