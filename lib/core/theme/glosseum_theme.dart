import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';

import 'package:glosseum_frontend/core/theme/glosseum_camera_interface_theme.dart';

class GlosseumTheme {
  static const String _fontFamily = 'Merriweather Sans';

  static ThemeData light = ThemeData(
    fontFamily: _fontFamily,
    brightness: Brightness.light,
    primaryColor: GlosseumColors.primary,
    scaffoldBackgroundColor: GlosseumColors.lightColor,
    colorScheme: ColorScheme.light(
      primary: GlosseumColors.primary,
      secondary: GlosseumColors.secondary,
      surface: GlosseumColors.lightColor,
      onSurface: GlosseumColors.darkColor,
    ),
    iconTheme: IconThemeData(
      size: 40,
      color: GlosseumColors.lightColor,
    ),
    primaryTextTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        color: GlosseumColors.darkColor,
      ),
      displayMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        color: GlosseumColors.darkColor,
      ),
      displaySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        color: GlosseumColors.darkColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 30,
        color: GlosseumColors.darkColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        color: GlosseumColors.darkColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: GlosseumColors.darkColor,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 40,
        color: GlosseumColors.darkColor,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        color: GlosseumColors.darkColor,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        color: GlosseumColors.darkColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        color: GlosseumColors.darkColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        color: GlosseumColors.darkColor,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        color: GlosseumColors.darkColor,
      ),
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26,
        color: GlosseumColors.darkColor,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        color: GlosseumColors.darkColor,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        color: GlosseumColors.darkColor,
      ),
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
