import 'package:glosseum_frontend/core/enums/api_error_type.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/providers/dio_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO: check if usage is really needed after doing something similar
//  in network service
final statusProvider = FutureProvider<ApiResult<String>>((ref) async {
  final dio = ref.watch(dioProvider);

  try {
    final response = await dio.get('/').timeout(const Duration(seconds: 1));

    return ApiSuccess(
      data: response.data.toString(),
      message: response.statusMessage ?? 'Server online',
      statusCode: response.statusCode ?? 200,
    );
  } catch (_) {
    return const ApiError(
        type: ApiErrorType.serverOffline,
        message: "Couldn't reach backend",
        statusCode: 0
    );
  }
});
