import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_chat_bubble_theme.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_track_scrollbar_theme.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';

import 'package:glosseum_frontend/core/theme/extensions/glosseum_camera_interface_theme.dart';

class GlosseumTheme {
  static const String _fontFamily = 'Merriweather Sans';

  static ThemeData light = ThemeData(
    fontFamily: _fontFamily,
    brightness: Brightness.light,
    primaryColor: GlosseumColors.primary,
    scaffoldBackgroundColor: GlosseumColors.lightColor,
    hintColor: GlosseumColors.lightenedPrimary,
    colorScheme: ColorScheme.light(
      primary: GlosseumColors.primary,
      secondary: GlosseumColors.secondary,
      surface: GlosseumColors.lightColor,
      onSurface: GlosseumColors.darkColor,
    ),
    iconTheme: IconThemeData(size: 40, color: GlosseumColors.lightColor),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 48,
        color: GlosseumColors.darkColor,
      ),
      displayMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 40,
        color: GlosseumColors.darkColor,
      ),
      displaySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        color: GlosseumColors.darkColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 42,
        fontWeight: FontWeight.w500,
        color: GlosseumColors.darkColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: GlosseumColors.darkColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: GlosseumColors.darkColor,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 42,
        color: GlosseumColors.darkColor,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 34,
        color: GlosseumColors.darkColor,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26,
        color: GlosseumColors.darkColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        color: GlosseumColors.darkColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        color: GlosseumColors.darkColor,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: GlosseumColors.darkColor,
      ),
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        color: GlosseumColors.darkColor,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: GlosseumColors.darkColor,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        color: GlosseumColors.darkColor,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: GlosseumColors.primary,
      indicatorColor: GlosseumColors.secondary,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: GlosseumColors.lightColor,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: GlosseumColors.primary,
        foregroundColor: GlosseumColors.lightColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thickness: WidgetStateProperty.all(8),
      radius: Radius.circular(8),
      thumbVisibility: WidgetStateProperty.all(true),
      thumbColor: WidgetStateProperty.all(GlosseumColors.secondary),
      trackVisibility: WidgetStateProperty.all(false),
    ),
    extensions: [
      GlosseumCameraInterfaceTheme(
        primaryBackground: GlosseumColors.lightColor,
        primaryIconColor: GlosseumColors.darkColor,
        secondaryBackground: GlosseumColors.darkColor,
        secondaryIconColor: GlosseumColors.lightColor,
      ),
      GlosseumChatBubbleTheme(chatBubbleColor: GlosseumColors.lightGrayColor),
      GlosseumTrackScrollbarTheme(
        trackColor: GlosseumColors.primary,
        trackThickness: 1,
      ),
    ],
  );
}
