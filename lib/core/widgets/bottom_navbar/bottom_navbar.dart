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
}