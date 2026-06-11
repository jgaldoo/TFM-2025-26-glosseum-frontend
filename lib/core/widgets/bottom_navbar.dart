import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/app_screen_groups.dart';
import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavbar extends ConsumerWidget {
  final ValueChanged<AppScreenEnum> onTap;

  const BottomNavbar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTheme = Theme.of(context).navigationBarTheme;
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = AppScreenGroups.bottomNavbarScreens.indexWhere(
          (s) => location.startsWith(s.route),
    );

    navTheme.iconTheme;
    navTheme.labelTextStyle;
    return  Container(
        height: 100,
        color: navTheme.backgroundColor,
        child: SafeArea(
          child: Row(
          children: [
            _entry(Icons.home, "Menú", AppScreenGroups.bottomNavbarScreens[0], navTheme),
            _entry(Icons.qr_code_scanner, "Escanear QR", AppScreenGroups.bottomNavbarScreens[1], navTheme),
            _entry(Icons.camera_alt_outlined, "Transcribir", AppScreenGroups.bottomNavbarScreens[2], navTheme)
          ],
        ),
      ),
    );
  }

  Widget _entry(IconData icon, String label, AppScreenEnum appScreen, NavigationBarThemeData navTheme) {
    final labelStyle = navTheme.labelTextStyle?.resolve({}) ?? const TextStyle();
    final iconTheme = navTheme.iconTheme?.resolve({}) ?? const IconThemeData();

    return Expanded(
        child: InkWell(
          onTap: () => onTap(appScreen),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: GlosseumColors.darkColor, width: 1),
                right: BorderSide(color: GlosseumColors.darkColor, width: 1),
              ),
            ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(label, style: labelStyle),
                      const SizedBox(height: 4),
                      Icon(
                        icon,
                        color: iconTheme.color,
                        applyTextScaling: iconTheme.applyTextScaling,
                        fill: iconTheme.fill,
                        grade: iconTheme.grade,
                        opticalSize: iconTheme.opticalSize,
                        shadows: iconTheme.shadows,
                        size: iconTheme.size,
                      )
                    ],
                  )
              ),
          ),
        ),
    );
  }
}