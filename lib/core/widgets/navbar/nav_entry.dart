import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavEntry extends ConsumerWidget {
  final GlosseumIconData icon;
  final String? label;
  final Future<void> Function(BuildContext context, WidgetRef ref)? onTap;

  const NavEntry({super.key, required this.icon, this.label, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTheme = Theme.of(context).navigationBarTheme;
    final labelStyle =
        navTheme.labelTextStyle?.resolve({}) ?? const TextStyle();
    final iconTheme = navTheme.iconTheme?.resolve({}) ?? const IconThemeData();

    return InkWell(
      onTap: () async {
        if (onTap != null) {
          await onTap!(context, ref);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (label != null) Text(label!, style: labelStyle),
            const SizedBox(height: 4),

            GlosseumIcon(icon, color: iconTheme.color, size: iconTheme.size),
          ],
        ),
      ),
    );
  }
}
