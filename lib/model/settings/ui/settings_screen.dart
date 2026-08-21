import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/navbar_entries.dart';
import 'package:glosseum_frontend/core/providers/database_providers/glosseum_database_provider.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/widgets/grabbable_panel/grabbable_panel.dart';
import 'package:glosseum_frontend/core/widgets/loading_blur_overlay.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/navbar/nav_entry.dart';
import 'package:glosseum_frontend/core/widgets/navbar/top_navbar.dart';
import 'package:glosseum_frontend/core/widgets/track_scrollbar.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  void _showDataDeletionPanel(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) {
        return GrabbablePanel(
          title: 'Borrar datos',
          innerContent: Text(
            'Esta acción borrará todos los datos guardados por la'
            ' aplicación de tu dispositivo. ¿Quieres continuar?',
            style: theme.textTheme.titleSmall,
          ),
          bottomNavigationBar: BottomNavbar(
            entries: [
              NavEntry(
                icon: GlosseumIcons.cross,
                label: 'No',
                onTap: (context, _) async => context.pop(),
              ),
              NavEntry(
                icon: GlosseumIcons.accept,
                label: 'Sí',
                onTap: (context, ref) async {
                  context.pop();
                  setState(() {
                    _isLoading = true;
                  });

                  await resetDatabase(ref);

                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LoadingBlurOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: TopNavbar(leftEntries: mainTopLeftNavbarEntries),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 30),
          child: TrackScrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              controller: _scrollController,
              child: RepaintBoundary(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ajustes', style: theme.textTheme.headlineMedium),
                    Divider(
                      height: 20,
                      thickness: 3,
                      indent: 0,
                      endIndent: 0,
                      color: theme.primaryColor,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'Borrar los datos de la aplicación',
                          style: theme.textTheme.titleSmall,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showDataDeletionPanel(context);
                          },
                          child: Text('Borrar datos'),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                      indent: 0,
                      endIndent: 0,
                      color: theme.primaryColor,
                    ),
                    Text(
                      'Sobre la aplicación',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      'Los iconos utilizados en esta aplicación son obras'
                      ' originales, u obras y obras derivadas de los iconos'
                      ' creados por Simple Design System, publicados en'
                      ' Figma Community, y licenciados bajo CC BY 4.0'
                      ' (https://creativecommons.org/licenses/by/4.0/).'
                      ' Los iconos no originales han sido usados sin modificar,'
                      ' modificados respecto a los originales y combinados'
                      ' entre sí para elaborar iconos nuevos.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.hintColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(entries: mainBottomNavbarEntries),
      ),
    );
  }
}
