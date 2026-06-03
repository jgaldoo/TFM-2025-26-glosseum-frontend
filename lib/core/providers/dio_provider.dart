import 'package:dio/dio.dart';
import 'package:glosseum_frontend/core/config/app_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final appConfig = ref.watch(appConfigProvider);

  final dio = Dio(
      BaseOptions(
        baseUrl: "${appConfig.backendUrl}${appConfig.port != "" ? ":${appConfig.port}" : ""}"
    )
  );

  if (appConfig.enableLogging) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  return dio;
});
