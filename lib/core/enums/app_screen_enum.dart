enum AppScreenEnum {
  home,
  qrScanner,
  camera,
  settings,
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
      case AppScreenEnum.information:
        return '/information';
    }
  }
}
