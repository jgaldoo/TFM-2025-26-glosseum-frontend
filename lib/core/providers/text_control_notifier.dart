import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_control_notifier.g.dart';

@riverpod
class TextControlNotifier extends _$TextControlNotifier {
  late final TextEditingController controller;

  @override
  Future<void> build(String id) async {
    controller = TextEditingController();
    ref.onDispose(controller.dispose);
    return;
  }
}
