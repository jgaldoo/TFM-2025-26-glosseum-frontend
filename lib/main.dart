import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:glosseum_frontend/core/providers/theme_notifier.dart';
import 'package:glosseum_frontend/core/theme/glosseum_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: GlosseumTheme.light,
      themeMode: themeMode,
    );
  }
}
