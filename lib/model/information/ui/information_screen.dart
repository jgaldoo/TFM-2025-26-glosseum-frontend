import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/config/navbar_entries.dart';
import 'package:glosseum_frontend/core/database/daos/chat_message_dao.dart';
import 'package:glosseum_frontend/core/database/daos/chat_session_dao.dart';
import 'package:glosseum_frontend/core/database/daos/information_dao.dart';
import 'package:glosseum_frontend/core/enums/api_error_type.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/providers/database_providers/glosseum_database_provider.dart';
import 'package:glosseum_frontend/core/widgets/grabbable_panel/error_grabbable_panel.dart';
import 'package:glosseum_frontend/core/widgets/navbar/bottom_navbar.dart';
import 'package:glosseum_frontend/core/widgets/navbar/top_navbar.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_message_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_session_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/stream_enum.dart';
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

  bool _isAnswerLoading = false;
  bool _isSimplifying = false;
  String? _progressInformation;

  Future<void> _simplifyText(BuildContext context, WidgetRef ref) async {
    final ApiResult<Stream<InformationStreamDTO>> simplificationResult =
        await ref
            .read(informationAPIProvider.notifier)
            .simplifyStream(
              InformationSimplificationRequestDTO(
                title: _information.title,
                content: _information.content,
              ),
            );

    simplificationResult.when(
      success: (informationStreamDTOGenerator, statusCode, message) async {
        final InformationDAO informationDAO = ref
            .watch(glosseumDatabaseProvider)
            .informationDAO;

        setState(() {
          _isSimplifying = true;
        });

        await for (final informationStreamDTO
            in informationStreamDTOGenerator) {
          debugPrint(
            'STREAM EVENT: ${informationStreamDTO.stream} |'
            ' ${informationStreamDTO.content}',
          );

          setState(() {
            _progressInformation = informationStreamDTO.streamInfo?.text;
            _information = _information.updateFromStreamDTO(
              informationStreamDTO,
            );
          });
        }

        setState(() {
          _progressInformation = null;
          _isSimplifying = false;
          _information = _information.copyWith(isSimplified: true);
        });
        await informationDAO.updateInformation(_information);
      },
      error: _onError,
    );
  }

  Future<void> _createSession(BuildContext context, WidgetRef ref) async {
    final ChatSessionDAO chatSessionDAO = ref
        .watch(glosseumDatabaseProvider)
        .chatSessionDAO;

    final ApiResult<ChatSessionResponseDTO> sessionResult = await ref
        .read(informationAPIProvider.notifier)
        .createSession(ChatSessionRequestDTO(document: _information.content));

    if (!context.mounted) return;

    sessionResult.when(
      success: (sessionDTO, statusCode, message) async {
        final ChatSession chatSession = ChatSession.fromDTO(sessionDTO);
        setState(() {
          _information = _information.copyWith(chatSession: chatSession);
        });
        await chatSessionDAO.insertChatSession(chatSession, _information.id);
      },
      error: _onError,
    );
  }

  // Stream chat interaction methods
  Future<void> _onStreamMessageSuccess(
    Stream<ChatMessageStreamResponseDTO> messageStreamDTOGenerator,
    int statusCode,
    String message,
  ) async {
    final ChatMessageDAO chatMessageDAO = ref
        .watch(glosseumDatabaseProvider)
        .chatMessageDAO;

    late ChatMessage receivedMessage;

    await for (final messageStreamDTO in messageStreamDTOGenerator) {
      debugPrint(
        'STREAM EVENT: ${messageStreamDTO.stream} | ${messageStreamDTO.content}',
      );
      switch (messageStreamDTO.stream) {
        case StreamEnum.start:
          receivedMessage = ChatMessage.fromStreamDTO(messageStreamDTO);

          setState(() {
            _information = _information.copyWith(
              chatSession: _information.chatSession!.copyWith(
                history: [
                  ..._information.chatSession!.history,
                  receivedMessage,
                ],
              ),
            );
            _isAnswerLoading = true;
          });

        case StreamEnum.chunk:
          final history = _information.chatSession!.history;

          final receivedMessage = history.last.appendContent(
            messageStreamDTO.content ?? '',
          );

          setState(() {
            _information = _information.copyWith(
              chatSession: _information.chatSession!.copyWith(
                history: [
                  ...history.sublist(0, history.length - 1),
                  receivedMessage,
                ],
              ),
            );
          });

        case StreamEnum.end:
          setState(() {
            _isAnswerLoading = false;
          });
          await chatMessageDAO.insertChatMessage(
            receivedMessage,
            _information.chatSession!.id,
          );
      }
    }

    // Handle a stream that ends without an explicit `end` event.
    if (mounted) {
      setState(() {
        _isAnswerLoading = false;
      });
      if (receivedMessage.content.isNotEmpty) {
        await chatMessageDAO.insertChatMessage(
          receivedMessage,
          _information.chatSession!.id,
        );
      }
    }
  }

  void _onError(ApiErrorType errorType, int statusCode, String message) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) {
        return ErrorGrabbablePanel(statusCode: statusCode, message: message);
      },
    );
  }

  Future<ApiResult<Stream<ChatMessageStreamResponseDTO>>>
  _registerStreamMessage(
    BuildContext context,
    WidgetRef ref,
    String message,
    bool updateHistory,
  ) async {
    if (updateHistory) {
      final ChatMessageDAO chatMessageDAO = ref
          .watch(glosseumDatabaseProvider)
          .chatMessageDAO;

      final ChatMessage userMessage = ChatMessage.fromUser(content: message);

      setState(() {
        _information = _information.copyWith(
          chatSession: _information.chatSession!.copyWith(
            history: [..._information.chatSession!.history, userMessage],
          ),
        );
      });

      await chatMessageDAO.insertChatMessage(
        userMessage,
        _information.chatSession!.id,
      );
    }

    return ref
        .read(informationAPIProvider.notifier)
        .chatStream(
          ChatMessageRequestDTO(
            sessionId: _information.chatSession!.id,
            message: message,
          ),
        );
  }

  Future<void> _sendStreamMessage(
    BuildContext context,
    WidgetRef ref,
    String message,
    bool updateHistory,
  ) async {
    setState(() {
      _isAnswerLoading = true;
    });

    final ApiResult<Stream<ChatMessageStreamResponseDTO>> chatResult =
        await _registerStreamMessage(context, ref, message, updateHistory);

    // Ensure the widget exists before trying to do
    // further operations
    if (!context.mounted) return;

    chatResult.when(success: _onStreamMessageSuccess, error: _onError);
  }

  Future<void> _ensureSendStreamMessage(
    BuildContext context,
    WidgetRef ref,
    String message,
  ) async {
    if (_information.chatSession == null) {
      await _createSession(context, ref);
    }

    // Ensure the widget exists before trying to do
    // further operations
    if (!context.mounted) return;

    setState(() {
      _isAnswerLoading = true;
    });

    final ApiResult<Stream<ChatMessageStreamResponseDTO>> chatResult =
        await _registerStreamMessage(context, ref, message, true);

    // Ensure the widget exists before trying to do
    // further operations
    if (!context.mounted) return;

    chatResult.when(
      success: _onStreamMessageSuccess,
      error: (errorType, statusCode, message) async {
        if (errorType == ApiErrorType.notFound) {
          await _createSession(context, ref);
          if (!context.mounted) return;
          _sendStreamMessage(context, ref, message, false);
        } else {
          _onError(errorType, statusCode, message);
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
    _information = widget.information.copyWith(lastAccess: DateTime.now());

    ref
        .read(glosseumDatabaseProvider)
        .informationDAO
        .updateLastAccess(_information);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: TopNavbar(rightEntries: mainTopRightNavbarEntries),
        body: Column(
          children: [
            Expanded(
              child: InformationText(
                information: _information,
                isAnswerLoading: _isAnswerLoading,
                isSimplifying: _isSimplifying,
                progressInformation: _progressInformation,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InformationControls(
                sendMessage: _ensureSendStreamMessage,
                simplify: _simplifyText,
                isAnswerLoading: _isAnswerLoading,
                isSimplified: (_isSimplifying || _information.isSimplified),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavbar(entries: mainBottomNavbarEntries),
      ),
    );
  }
}
