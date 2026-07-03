import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/navbar_entries.dart';
import 'package:glosseum_frontend/core/widgets/loading_blur_overlay.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/navbar/top_navbar.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/information/ui/information_controls.dart';
import 'package:glosseum_frontend/model/information/ui/information_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InformationScreen extends ConsumerStatefulWidget {
  final Information information;

  const InformationScreen({super.key, required this.information});

  @override
  ConsumerState<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends ConsumerState<InformationScreen> {
  bool _isLoading = false;
  bool _isSimplifying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(rightEntries: mainTopRightNavbarEntries),
      body: Stack(
        children: [
          LoadingBlurOverlay(
            isLoading: _isLoading,
            useBlur: false,
            child: SingleChildScrollView(
              child: InformationText(information: widget.information),
            ),
          ),
          InformationControls(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(entries: mainBottomNavbarEntries),
    );
  }
}
