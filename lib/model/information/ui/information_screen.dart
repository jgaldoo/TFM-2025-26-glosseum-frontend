import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/navbar_entries.dart';
import 'package:glosseum_frontend/core/enums/api_error_type.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/widgets/grabbable_panel/error_grabbable_panel.dart';
import 'package:glosseum_frontend/core/widgets/loading_blur_overlay.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/navbar/top_navbar.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_message_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_session_dto.dart';
import 'package:glosseum_frontend/model/information/data/information_api_provider.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_message.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_session.dart';
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

  void _onMessageSuccess(
    ChatMessageResponseDTO messageDTO,
    int statusCode,
    String message,
  ) {
    _information = _information.copyWith(
      chatSession: _information.chatSession!.copyWith(
        history: [
          ..._information.chatSession!.history,
          ChatMessage.fromDTO(messageDTO),
        ],
      ),
    );
    setState(() {
      _isAnswerLoading = false;
    });
  }

  void _onChatError(ApiErrorType errorType, int statusCode, String message) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) {
        return ErrorGrabbablePanel(statusCode: statusCode, message: message);
      },
    );
  }

  Future<void> _createSession(BuildContext context, WidgetRef ref) async {
    final ApiResult<ChatSessionResponseDTO> sessionResult = await ref
        .read(informationAPIProvider.notifier)
        .createSession(ChatSessionRequestDTO(document: _information.content));

    if (!context.mounted) return;

    sessionResult.when(
      success: (sessionDTO, statusCode, message) {
        setState(() {
          _information = _information.copyWith(
            chatSession: ChatSession.fromDTO(sessionDTO),
          );
        });
      },
      error: _onChatError,
    );
  }

  Future<ApiResult<ChatMessageResponseDTO>> _registerMessage(
    BuildContext context,
    WidgetRef ref,
    String message,
    bool updateHistory,
  ) async {
    if (updateHistory) {
      setState(() {
        _information = _information.copyWith(
          chatSession: _information.chatSession!.copyWith(
            history: [
              ..._information.chatSession!.history,
              ChatMessage.fromUser(content: message),
            ],
          ),
        );
      });
    }

    return await ref
        .read(informationAPIProvider.notifier)
        .chat(
          ChatMessageRequestDTO(
            sessionId: _information.chatSession!.sessionId,
            message: message,
          ),
        );
  }

  void _sendMessage(
    BuildContext context,
    WidgetRef ref,
    String message,
    bool updateHistory,
  ) async {
    setState(() {
      _isAnswerLoading = true;
    });

    final ApiResult<ChatMessageResponseDTO> chatResult = await _registerMessage(
      context,
      ref,
      message,
      updateHistory,
    );

    // Ensure the widget exists before trying to do
    // further operations
    if (!context.mounted) return;

    chatResult.when(success: _onMessageSuccess, error: _onChatError);
  }

  void _ensureSendMessage(
    BuildContext context,
    WidgetRef ref,
    String message,
  ) async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_information.chatSession == null) {
      await _createSession(context, ref);
    }

    // Ensure the widget exists before trying to do
    // further operations
    if (!context.mounted) return;

    setState(() {
      _isAnswerLoading = true;
    });

    final ApiResult<ChatMessageResponseDTO> chatResult = await _registerMessage(
      context,
      ref,
      message,
      true,
    );

    // Ensure the widget exists before trying to do
    // further operations
    if (!context.mounted) return;

    chatResult.when(
      success: _onMessageSuccess,
      error: (errorType, statusCode, message) async {
        if (errorType == ApiErrorType.notFound) {
          await _createSession(context, ref);
          if (!context.mounted) return;
          _sendMessage(context, ref, message, false);
        } else {
          _onChatError(errorType, statusCode, message);
        }

        setState(() {
          _isAnswerLoading = false;
        });
      },
    );
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
                sendMessage: _ensureSendMessage,
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
