import 'dart:math';

import 'package:flutter/material.dart';

// Not exactly "brightness", it behaves like exposure does
ColorFilter brightnessFilter(double value) {
  final scale = pow(2.0, value).toDouble();
  final offset = (scale - 1.0) * 20.0;

  return ColorFilter.matrix([
    scale, 0,     0,     0, offset,
    0,     scale, 0,     0, offset,
    0,     0,     scale, 0, offset,
    0,     0,     0,     1, 0,
  ]);
}

Offset normalizePoint({
  required Offset point,
  required Size size,
}) {
  return Offset(
    point.dx / size.width,
    point.dy / size.height,
  );
}