import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:glosseum_frontend/core/widgets/navbar/nav_entry.dart';

class TopNavbar<T> extends ConsumerWidget implements PreferredSizeWidget {
  final List<NavEntry> leftEntries;
  final List<NavEntry> rightEntries;
  final double height;

  const TopNavbar({
    super.key,
    this.leftEntries = const [],
    this.rightEntries = const [],
    this.height = 100,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTheme = Theme.of(context).navigationBarTheme;

    return Container(
      height: height,
      color: navTheme.backgroundColor,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                for (final entry in leftEntries)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: entry,
                  ),
              ],
            ),
            Row(
              children: [
                for (final entry in rightEntries)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: entry,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
