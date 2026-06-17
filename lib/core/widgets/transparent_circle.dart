import 'package:flutter/material.dart';

class TransparentCircle extends StatelessWidget {
  final double radius;
  final Offset offset;

  const TransparentCircle({
    super.key,
    required this.radius,
    required this.offset
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclePainter(radius: radius, offset: offset),
      child: Container(),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double radius;
  final Offset offset;

  _CirclePainter({
    required this.radius,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final transparentPaint = Paint()
      ..blendMode = BlendMode.clear;

    canvas.drawCircle(offset, radius, transparentPaint);
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) {
    return oldDelegate.radius != radius ||
        oldDelegate.offset != offset;
  }
}