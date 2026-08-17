import 'package:dio/dio.dart';
import 'package:glosseum_frontend/core/config/app_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final appConfig = ref.watch(appConfigProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl:
          '${appConfig.backendUrl}'
          '${appConfig.port != '' ? ':${appConfig.port}' : ''}',
    ),
  );

  if (appConfig.enableLogging) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  return dio;
}
