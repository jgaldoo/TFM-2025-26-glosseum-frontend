import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/app_screen_groups.dart';
import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bottom_nav_entry.dart';

class BottomNavbar<T> extends ConsumerWidget {
  final List<BottomNavEntry> entries;

  const BottomNavbar({
    super.key,
    required this.entries
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTheme = Theme.of(context).navigationBarTheme;

    return Container(
        height: 100,
        color: navTheme.backgroundColor,
        child: SafeArea(
          child: Row(
          children: entries,
        ),
      ),
    );
  }

/*
  Widget _entry(IconData icon, String label, T value, NavigationBarThemeData navTheme) {
    final labelStyle = navTheme.labelTextStyle?.resolve({}) ?? const TextStyle();
    final iconTheme = navTheme.iconTheme?.resolve({}) ?? const IconThemeData();

    return Expanded(
        child: InkWell(
          onTap: () => onTap(value),
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
  }*/
}