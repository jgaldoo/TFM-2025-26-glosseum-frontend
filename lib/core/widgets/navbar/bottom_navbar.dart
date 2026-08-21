import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:glosseum_frontend/core/widgets/navbar/nav_entry.dart';

class BottomNavbar<T> extends ConsumerWidget implements PreferredSizeWidget {
  final List<NavEntry> entries;
  final double height;

  const BottomNavbar({super.key, required this.entries, this.height = 100});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTheme = Theme.of(context).navigationBarTheme;

    return Container(
      height: height,
      color: navTheme.backgroundColor,
      child: MediaQuery.removeViewInsets(
        context: context,
        removeBottom: true,
        child: SafeArea(
          child: Row(
            children: [
              for (final entry in entries)
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: GlosseumColors.darkColor,
                          width: 0.5,
                        ),
                        right: BorderSide(
                          color: GlosseumColors.darkColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: entry,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
