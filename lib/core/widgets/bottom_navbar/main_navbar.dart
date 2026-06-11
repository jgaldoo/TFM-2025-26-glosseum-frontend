import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/app_screen_groups.dart';
import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:glosseum_frontend/core/widgets/bottom_navbar/bottom_nav_entry.dart';
import 'package:glosseum_frontend/core/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:go_router/go_router.dart';

class MainNavbar extends StatelessWidget {
  const MainNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavbar<AppScreenEnum>(
      entries: [
        BottomNavEntry(
          icon: Icons.home,
          label: "Menú",
          onTap: () => context.push(AppScreenGroups.bottomNavbarScreens[0].route),
        ),
        BottomNavEntry(
          icon: Icons.qr_code_scanner,
          label: "Escanear QR",
          onTap: () => context.push(AppScreenGroups.bottomNavbarScreens[1].route),
        ),
        BottomNavEntry(
          icon: Icons.camera_alt_outlined,
          label: "Transcribir",
          onTap: () => context.push(AppScreenGroups.bottomNavbarScreens[2].route),
        ),
      ],
    );
  }

}