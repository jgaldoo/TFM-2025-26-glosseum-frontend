# Glosseum Frontend
A Flutter with Riverpod application made to interact with [this backend](https://github.com/jgaldoo/TFM-2025-26-glosseum-backend).

📖 This application was created as part of a Master's Thesis for the "Máster en Ingeniería Informática" of the "Universidad Complutense de Madrid".

⚠️ This application was exclusively made for mobile devices. Any deployment or emulation in Windows, MacOs, Linux, Web or other platforms is not guaranteed to function properly.

## Technologies

This project was developed in [Flutter](https://flutter.dev/). It additionally uses some Flutter packages to make coding easier:
- [Dio](https://pub.dev/packages/dio) to handle internet connections and API messaging
- [GoRouter](https://pub.dev/packages/go_router) to navigate through the application screens
- [Freezed](https://pub.dev/packages/freezed) as a manner of creating inmutable entities with several help methods
- [Riverpod](https://pub.dev/packages/riverpod) and [Riverpod Generator](https://pub.dev/packages/riverpod_generator) to communicate different data throughout the application

## How to run

First of all, ensure you have [Dart and Flutter installed](https://docs.flutter.dev/install) and available for CLI usage.

Secondly, ensure you have platform integration with [Android](https://docs.flutter.dev/platform-integration/android/setup) or [iOS](https://docs.flutter.dev/platform-integration/ios/setup).

Thirdly, ensure you have an emulator or physical device ready to launch the app.

Finally, download this project and open it on your IDE of preference.

From the root of the project, download all dependencies:
```
flutter pub get
```

Generate all Freezed and Riverpod files
```
dart run build_runner build
```

Run the ``main.dart`` file, either by CLI or by IDE.
```
flutter run ./lib/main.dart <device_id>
```

You can find out your device_id by running
```
flutter devices
```

That's it!

## Disclaimers

Some of the icons used in this app are works used as‑is, combined, or modified from the [Simple Design System](https://www.figma.com/community/file/1380235722331273046/simple-design-system) published on the Figma Community, licensed under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/).
