import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';

@freezed
abstract class PhotoDTO with _$PhotoDTO {
  const factory PhotoDTO({
    @JsonKey(includeFromJson: false, includeToJson: false) Uint8List? fileBytes,
    @JsonKey(includeFromJson: false, includeToJson: false) String? fileName,
  }) = _PhotoDTO;
}
