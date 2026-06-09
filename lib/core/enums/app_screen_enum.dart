import 'package:flutter/material.dart';
import 'package:glosseum_frontend/model/home/ui/home_screen.dart';

enum AppScreenEnum {
  home,
  qrScanner,
  camera,
  settings,
  browser,
  information;

  String get route {
    switch (this) {
      case AppScreenEnum.home:
        return '/';
      case AppScreenEnum.qrScanner:
        return '/qrScanner';
      case AppScreenEnum.camera:
        return '/camera';
      case AppScreenEnum.settings:
        return '/settings';
      case AppScreenEnum.browser:
        return '/browser';
      case AppScreenEnum.information:
        return '/information';
    }
  }
}