import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';

import 'package:glosseum_frontend/core/theme/glosseum_camera_interface_theme.dart';

class GlosseumTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'Merriweather Sans',
    brightness: Brightness.light,
    primaryColor: GlosseumColors.primary,
    scaffoldBackgroundColor: GlosseumColors.lightColor,
    colorScheme: ColorScheme.light(
      primary: GlosseumColors.primary,
      secondary: GlosseumColors.secondary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: GlosseumColors.primary,
      indicatorColor: GlosseumColors.secondary,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          fontFamily: 'Merriweather Sans',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: GlosseumColors.lightColor,
        ),
      ),
      iconTheme: WidgetStateProperty.all(
        const IconThemeData(
            size: 40,
            color: GlosseumColors.lightColor,
        ),
      ),
    ),
    extensions: [
      GlosseumCameraInterfaceTheme(
        primaryBackground: GlosseumColors.lightColor,
        primaryIconColor: GlosseumColors.darkColor,
        secondaryBackground: GlosseumColors.darkColor,
        secondaryIconColor: GlosseumColors.lightColor,
      )
    ]
  );
}
