import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() => ThemeMode.light; // ThemeMode.system

  // TODO Uncomment if dark mode is implemented
  // void toggle() {
  //   state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  // }
}