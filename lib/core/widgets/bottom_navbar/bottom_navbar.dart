import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:glosseum_frontend/core/widgets/bottom_navbar/bottom_nav_entry.dart';

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
