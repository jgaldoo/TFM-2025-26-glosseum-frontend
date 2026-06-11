
import 'package:flutter/material.dart';
import 'bottom_navbar/main_navbar.dart';

class RootScaffold extends StatelessWidget {
  final Widget child;
  const RootScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: MainNavbar(),
    );
  }
}