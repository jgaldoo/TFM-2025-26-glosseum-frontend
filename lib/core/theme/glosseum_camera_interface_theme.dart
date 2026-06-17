
import 'package:flutter/material.dart';

class GlosseumCameraInterfaceTheme extends ThemeExtension<GlosseumCameraInterfaceTheme> {
  final Color primaryBackground;
  final Color primaryIconColor;

  final Color secondaryBackground;
  final Color secondaryIconColor;

  const GlosseumCameraInterfaceTheme({
    required this.primaryBackground,
    required this.primaryIconColor,
    required this.secondaryBackground,
    required this.secondaryIconColor,
  });

  @override
  ThemeExtension<GlosseumCameraInterfaceTheme> copyWith({
    Color? primaryBackground,
    Color? primaryIconColor,
    Color? secondaryBackground,
    Color? secondaryIconColor,
  }) {
    return GlosseumCameraInterfaceTheme(
      primaryBackground: primaryBackground ?? this.primaryBackground,
      primaryIconColor: primaryIconColor ?? this.primaryIconColor,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      secondaryIconColor: secondaryIconColor ?? this.secondaryIconColor,
    );
  }

  @override
  ThemeExtension<GlosseumCameraInterfaceTheme> lerp(covariant ThemeExtension<GlosseumCameraInterfaceTheme>? other, double t) {
    if (other is! GlosseumCameraInterfaceTheme) return this;

    return GlosseumCameraInterfaceTheme(
      primaryBackground: Color.lerp(
          primaryBackground, other.primaryBackground, t
      ) ?? primaryBackground,
      primaryIconColor: Color.lerp(
          primaryIconColor, other.primaryIconColor, t
      ) ?? primaryIconColor,
      secondaryBackground: Color.lerp(
          secondaryBackground, other.secondaryBackground, t
      ) ?? secondaryBackground,
      secondaryIconColor: Color.lerp(
          secondaryIconColor, other.secondaryIconColor, t
      ) ?? secondaryIconColor,
    );
  }
}

GlosseumCameraInterfaceTheme cameraInterfaceThemeOf(BuildContext context) {
  final cameraInterfaceTheme = Theme.of(context).extension<GlosseumCameraInterfaceTheme>();

  if (cameraInterfaceTheme == null) {
    throw FlutterError(
        "GlosseumCameraInterfaceTheme hasn't been found in ThemeData.extensions.\n"
            "Please ensure you've added this to GlosseumTheme before retrying."
    );
  }

  return cameraInterfaceTheme;
}