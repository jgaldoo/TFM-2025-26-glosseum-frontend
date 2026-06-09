import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/widgets/bottom_navbar.dart';
import 'package:glosseum_frontend/model/camera/ui/camera_screen.dart';
import 'package:glosseum_frontend/model/home/ui/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    // with BottomNavbar
    ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const BottomNavbar(),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (_, __) => const HomeScreen(),
          ),
        ]),
    // with CameraBar
    GoRoute(
      path: '/qrScanner',
      name: 'qrScanner',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/camera',
      name: 'camera',
      builder: (_, __) => const CameraScreen(),
    ),
    /*GoRoute(
      path: '/content/:id',
      builder: (_, state) {
        final id = state.pathParameters['id'];
        return ContentScreen(id);
      },
    ),*/
  ],
);