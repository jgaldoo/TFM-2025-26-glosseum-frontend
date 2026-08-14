import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/widgets/grabbable_panel/grabbable_panel.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';
import 'package:glosseum_frontend/model/technicism/ui/definition_tab_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TechnicismDefinitionPanel extends ConsumerWidget {
  final Technicism technicism;

  const TechnicismDefinitionPanel({super.key, required this.technicism});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return GrabbablePanel(
      title: technicism.canonicalName,
      tabs: [
        PanelTab(
          title: 'Definiciones',
          child: DefinitionTabBar(
            definitions: technicism.definitions
                .map((definition) => definition.definition)
                .toList(),
          ), //technicism.definitions),
        ),
        PanelTab(
          title: 'Traducir',
          child: Text(
            'No se ha implementado aún esta funcionalidad',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
