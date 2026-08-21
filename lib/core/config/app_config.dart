import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

class AppConfig {
  final String backendUrl;
  final String port;
  final bool enableDioLogging;

  const AppConfig({
    required this.backendUrl,
    this.port = '',
    this.enableDioLogging = false,
  });
}

@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  return const AppConfig(
    backendUrl: 'http://192.168.1.35',
    port: '8000',
    enableDioLogging: true,
  );
}
