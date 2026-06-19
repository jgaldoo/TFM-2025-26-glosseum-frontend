import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/core/enums/api_error_type.dart';

part 'api_result.freezed.dart';

@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({
    required T data,
    required int statusCode,
    required String message,
  }) = ApiSuccess<T>;

  const factory ApiResult.error({
    required ApiErrorType type,
    required int statusCode,
    required String message,
  }) = ApiError<T>;
}
