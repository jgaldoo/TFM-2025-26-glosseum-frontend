import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:glosseum_frontend/core/config/app_screen_groups.dart';
import 'package:glosseum_frontend/core/providers/widget_providers/app_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavbar extends ConsumerWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = AppScreenGroups.bottomNavbarScreens.indexWhere(
          (s) => location.startsWith(s.route),
    );

    return NavigationBar(
      selectedIndex: selectedIndex < 0 ||
          selectedIndex > AppScreenGroups.bottomNavbarScreens.length
          ? 0 : selectedIndex,
      onDestinationSelected: (i) {
        context.push(AppScreenGroups.bottomNavbarScreens[i].route);
        },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Menú'),
        NavigationDestination(icon: Icon(Icons.qr_code_scanner), label: 'Escanear'),
        NavigationDestination(icon: Icon(Icons.camera_alt_outlined), label: 'Transcribir'),
      ],
    );
  }
}