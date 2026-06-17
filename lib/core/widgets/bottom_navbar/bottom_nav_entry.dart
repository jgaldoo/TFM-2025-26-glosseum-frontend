import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/app_screen_groups.dart';
import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:glosseum_frontend/core/theme/glosseum_colors.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon_data.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavEntry extends ConsumerWidget {
  final GlosseumIconData icon;
  final String label;
  final Future<void> Function()? onTap;

  const BottomNavEntry({
    super.key,
    required this.icon,
    required this.label,
    this.onTap
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navTheme = Theme.of(context).navigationBarTheme;
    final labelStyle = navTheme.labelTextStyle?.resolve({}) ?? const TextStyle();
    final iconTheme = navTheme.iconTheme?.resolve({}) ?? const IconThemeData();

    return Expanded(
      child: InkWell(
        onTap: () async {
          if (onTap != null) {
            await onTap!();
          }
        },
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
                  GlosseumIcon(
                    icon,
                    color: iconTheme.color,
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