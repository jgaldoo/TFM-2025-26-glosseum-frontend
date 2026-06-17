import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/glosseum_camera_interface_theme.dart';

class QrOverlay extends StatelessWidget {
  final double borderRadius;
  final double borderLength;
  final double borderWidth;

  const QrOverlay({
    super.key,
    required this.borderRadius,
    required this.borderLength,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    final overlayColor = cameraInterfaceThemeOf(context)
        .primaryBackground.withValues(alpha: 0.6);

    return LayoutBuilder(
        builder: (_, constraints) {
          final size = constraints.maxWidth * 0.75;

          return Center(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: CustomPaint(
                painter: _QrCornerPainter(
                  color: overlayColor,
                  length: size * 0.25,
                  width: borderWidth,
                  radius: borderRadius,
                ),
              ),
            ),
          );
        }
    );
  }
}

class _QrCornerPainter extends CustomPainter {
  final Color color;
  final double length;
  final double width;
  final double radius;

  _QrCornerPainter({
    required this.color,
    required this.length,
    required this.width,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.strokeWidth = width;
    paint.style = PaintingStyle.stroke;

    // Top-left
    canvas.drawPath(
      Path()
          ..moveTo(0, length)
          ..lineTo(0, radius)
          ..quadraticBezierTo(0, 0, radius, 0)
          ..lineTo(length, 0),
      paint,
    );

    // Top-right
    canvas.drawPath(
      Path()
          ..moveTo(size.width - length, 0)
          ..lineTo(size.width - radius, 0)
          ..quadraticBezierTo(size.width, 0, size.width, radius)
          ..lineTo(size.width, length),
      paint,
    );

    // Bottom-left
    canvas.drawPath(
      Path()
          ..moveTo(0, size.height - length)
          ..lineTo(0, size.height - radius)
          ..quadraticBezierTo(0, size.height, radius, size.height)
          ..lineTo(length, size.height),
      paint,
    );

    // Bottom-right
    canvas.drawPath(
      Path()
          ..moveTo(size.width - length, size.height)
          ..lineTo(size.width - radius, size.height)
          ..quadraticBezierTo(size.width,
              size.height,
              size.width,
              size.height - radius
          )
          ..lineTo(size.width, size.height - length),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
