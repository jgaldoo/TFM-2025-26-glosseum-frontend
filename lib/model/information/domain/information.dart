// TEMP DEBUG
// ignore: unused_import
import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'information.freezed.dart';
part 'information.g.dart';

@freezed
abstract class Information with _$Information {
  const factory Information({
    required String title,
    required String content,
    required String status,
  }) = _Information;

  factory Information.fromJson(Map<String, dynamic> json) =>
      _$InformationFromJson(json);
}
