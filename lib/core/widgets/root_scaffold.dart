
import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/enums/app_screen_enum.dart';
import 'package:go_router/go_router.dart';

import 'bottom_navbar.dart';

class RootScaffold extends StatelessWidget {
  final Widget child;
  const RootScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavbar(
        onTap: (AppScreenEnum appScreen) { context.push(appScreen.route); },
      ),
    );
  }
}