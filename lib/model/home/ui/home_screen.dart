import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/navbar_entries.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/navbar/top_navbar.dart';
import 'package:glosseum_frontend/model/information/ui/information_history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TopNavbar(rightEntries: mainTopRightNavbarEntries),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Expanded(child: InformationHistory())],
      ),
      bottomNavigationBar: BottomNavbar(entries: mainBottomNavbarEntries),
    );
  }
}
