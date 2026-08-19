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
        fontSize: 44,
        color: GlosseumColors.darkColor,
      ),
      displaySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 40,
        color: GlosseumColors.darkColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: GlosseumColors.darkColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: GlosseumColors.darkColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: GlosseumColors.darkColor,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        color: GlosseumColors.darkColor,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26,
        color: GlosseumColors.darkColor,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        color: GlosseumColors.darkColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        color: GlosseumColors.darkColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        color: GlosseumColors.darkColor,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        color: GlosseumColors.darkColor,
      ),
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        color: GlosseumColors.darkColor,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 15,
        color: GlosseumColors.darkColor,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: GlosseumColors.darkColor,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: GlosseumColors.primary,
      indicatorColor: GlosseumColors.secondary,
      labelTextStyle: WidgetStatePropertyAll(
        const TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: GlosseumColors.lightColor,
        ),
      ),
      iconTheme: WidgetStatePropertyAll(const IconThemeData(size: 44)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return GlosseumColors.darkenedPrimary;
          }
          return GlosseumColors.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return GlosseumColors.lightGrayColor;
          }
          return GlosseumColors.lightColor;
        }),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder?>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        textStyle: WidgetStatePropertyAll<TextStyle?>(
          TextStyle(
            fontFamily: _fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return GlosseumColors.darkenedPrimary;
          }
          return GlosseumColors.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return GlosseumColors.lightGrayColor;
          }
          return GlosseumColors.lightColor;
        }),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder?>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        textStyle: WidgetStatePropertyAll<TextStyle?>(
          TextStyle(
            fontFamily: _fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thickness: WidgetStatePropertyAll(8),
      radius: Radius.circular(8),
      thumbVisibility: WidgetStatePropertyAll(true),
      thumbColor: WidgetStatePropertyAll(GlosseumColors.secondary),
      trackVisibility: WidgetStatePropertyAll(false),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: GlosseumColors.primary,
      refreshBackgroundColor: GlosseumColors.lightColor,
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
