import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/navbar_entries.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/navbar/top_navbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:glosseum_frontend/core/providers/status_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var status = ref.watch(statusProvider);

    return Scaffold(
      appBar: TopNavbar(rightEntries: mainTopRightNavbarEntries),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            status.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Error: $e'),
              data: (msg) => msg.when(
                success: (data, statusCode, message) {
                  return Text('Code: $statusCode\n$message\nContent: $data');
                },
                error: (errorType, statusCode, message) {
                  return Text('Code: $statusCode, $errorType\n$message\n');
                },
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                status = ref.refresh(statusProvider);
              },
              child: const Text('Refresh status'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(entries: mainBottomNavbarEntries),
    );
  }
}
