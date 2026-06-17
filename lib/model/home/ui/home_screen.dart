import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:glosseum_frontend/core/providers/status_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     var status = ref.watch(statusProvider);

     return Scaffold(
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               status.when(
                 loading: () => const CircularProgressIndicator(),
                 error: (e, _) => Text('Error: $e'),
                 data: (msg) => Text(msg),
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
     );
  }
}
