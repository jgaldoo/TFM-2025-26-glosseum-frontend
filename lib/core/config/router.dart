import 'package:glosseum_frontend/core/config/route_observer.dart';
import 'package:glosseum_frontend/core/enums/camera_mode_enum.dart';
import 'package:glosseum_frontend/model/camera/ui/camera_screen.dart';
import 'package:glosseum_frontend/model/home/ui/home_screen.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/information/ui/information_screen.dart';
import 'package:glosseum_frontend/model/settings/ui/settings_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      observers: [routeObserver],
      builder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(path: '/', name: 'home', builder: (_, _) => const HomeScreen()),
        GoRoute(
          path: '/qrScanner',
          name: 'qrScanner',
          builder: (_, _) => CameraScreen(cameraMode: CameraModeEnum.qrScanner),
        ),
        GoRoute(
          path: '/camera',
          name: 'camera',
          builder: (_, _) => CameraScreen(cameraMode: CameraModeEnum.camera),
        ),
        GoRoute(
          path: '/information',
          name: 'information',
          builder: (_, state) =>
              InformationScreen(information: state.extra as Information),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (_, _) => SettingsScreen(),
        ),
      ],
    ),
  ],
);
