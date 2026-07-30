import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/navbar_entries.dart';
import 'package:glosseum_frontend/core/widgets/loading_blur_overlay.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/navbar/top_navbar.dart';
import 'package:glosseum_frontend/model/information/domain/chat_turn/chat_turn.dart';
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
  late Information _information;

  bool _isLoading = false;
  bool _isAnswerLoading = false;
  bool _isSimplifying = false;

  void _askQuestion(String question) {
    setState(() {
      _information = _information.copyWith(
        chatTurns: [
          ..._information.chatTurns,
          ChatTurn(question: question),
        ],
      );
      _isAnswerLoading = true;
    });
    try {
      // TODO Send to backend
    } finally {}
  }

  @override
  void initState() {
    super.initState();
    _information = widget.information;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(rightEntries: mainTopRightNavbarEntries),
      body: LoadingBlurOverlay(
        isLoading: _isLoading,
        useBlur: false,
        child: Column(
          children: [
            Expanded(
              child: InformationText(
                information: _information,
                isAnswerLoading: _isAnswerLoading,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InformationControls(
                askQuestion: _askQuestion,
                isAnswerLoading: _isAnswerLoading,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(entries: mainBottomNavbarEntries),
    );
  }
}
