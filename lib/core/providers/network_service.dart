import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:glosseum_frontend/core/enums/api_error_type.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_service.g.dart';

// Class to abstract error handling on api petitions
class NetworkService {
  final Dio dio;

  NetworkService(this.dio);

  Future<bool> checkStatus() async {
    final response = await dio.get(
      '/',
      options: Options(
        sendTimeout: const Duration(seconds: 1),
        receiveTimeout: const Duration(seconds: 1),
        connectTimeout: const Duration(seconds: 1),
      ),
    );
    return response.statusCode == 200;
  }

  Future<ApiResult<T>> safeRequest<T>(
    Future<Response> Function() call,
    T Function(dynamic) fromJson,
  ) async {
    try {
      print("safeRequest entered");

      print("checking status...");
      await checkStatus();
      print('status checked');

      final response = await call();

      return ApiResult.success(
        data: fromJson(response.data),
        statusCode: response.statusCode ?? 200,
        message: response.statusMessage ?? 'OK',
      );
    } on DioException catch (e) {
      log('Network Service caught a Dio exception: $e');
      final apiErrorType = dioErrorToApiErrorType(e);
      return ApiResult.error(
        type: apiErrorType,
        statusCode: e.response?.statusCode ?? 0,
        message: e.response?.data['detail'] ?? apiErrorType.errorText,
      );
    } catch (e) {
      log('Network Service caught an unexpected exception: $e');

      return const ApiResult.error(
        type: ApiErrorType.unknown,
        statusCode: -1,
        message: 'Unexpected non-Dio error',
      );
    }
  }

  Future<ApiResult<Stream<T>>> safeStreamRequest<T>(
    Future<Response> Function() call,
    T Function(dynamic) fromJson,
  ) async {
    try {
      print("safeStreamRequest entered");

      print("checking status...");
      await checkStatus();
      print('status checked');

      final response = await call();

      final responseBody = response.data;

      Stream<T> stream() async* {
        final byteStream = responseBody.stream.cast<List<int>>();

        final lines = byteStream
            .transform(utf8.decoder)
            .transform(const LineSplitter());

        await for (final line in lines) {
          if (line.trim().isEmpty) {
            continue;
          }

          yield fromJson(jsonDecode(line));
        }
      }

      return ApiResult.success(
        data: stream(),
        statusCode: response.statusCode ?? 200,
        message: response.statusMessage ?? 'OK',
      );
    } on DioException catch (e) {
      log('Network Service caught a Dio exception: $e');
      final apiErrorType = dioErrorToApiErrorType(e);
      return ApiResult.error(
        type: apiErrorType,
        statusCode: e.response?.statusCode ?? 0,
        message: e.response?.data['detail'] ?? apiErrorType.errorText,
      );
    } catch (e) {
      log('Network Service caught an unexpected exception: $e');

      return const ApiResult.error(
        type: ApiErrorType.unknown,
        statusCode: -1,
        message: 'Unexpected non-Dio error',
      );
    }
  }
}

@Riverpod(keepAlive: true)
NetworkService networkService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return NetworkService(dio);
}
