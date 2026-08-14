import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefinitionTabBar extends ConsumerWidget {
  final List<String> definitions;

  const DefinitionTabBar({super.key, required this.definitions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        for (final (i, definition) in definitions.indexed)
          Padding(
            padding: EdgeInsetsGeometry.directional(bottom: 10),
            child: Text('${i + 1}. $definition'),
          ),
      ],
    );
  }
}
