import 'dart:ui';

import 'package:flutter/material.dart';

class GlosseumTrackScrollbarTheme
    extends ThemeExtension<GlosseumTrackScrollbarTheme> {
  final Color? trackColor;
  final double trackThickness;

  const GlosseumTrackScrollbarTheme({
    this.trackColor,
    required this.trackThickness,
  });

  @override
  ThemeExtension<GlosseumTrackScrollbarTheme> copyWith({
    Color? trackColor,
    double? trackThickness,
  }) {
    return GlosseumTrackScrollbarTheme(
      trackColor: trackColor ?? this.trackColor,
      trackThickness: trackThickness ?? this.trackThickness,
    );
  }

  @override
  ThemeExtension<GlosseumTrackScrollbarTheme> lerp(
    covariant ThemeExtension<GlosseumTrackScrollbarTheme>? other,
    double t,
  ) {
    if (other is! GlosseumTrackScrollbarTheme) return this;

    return GlosseumTrackScrollbarTheme(
      trackColor: Color.lerp(trackColor, other.trackColor, t) ?? trackColor,
      trackThickness:
          lerpDouble(trackThickness, other.trackThickness, t) ?? 0.0,
    );
  }
}

GlosseumTrackScrollbarTheme trackScrollbarThemeOf(BuildContext context) {
  final trackScrollbarTheme = Theme.of(
    context,
  ).extension<GlosseumTrackScrollbarTheme>();

  if (trackScrollbarTheme == null) {
    throw FlutterError(
      "GlosseumTrackScrollbarTheme hasn't been found in "
      "ThemeData.extensions.\n Please ensure you've added this to "
      'GlosseumTheme before retrying.',
    );
  }

  return trackScrollbarTheme;
}
