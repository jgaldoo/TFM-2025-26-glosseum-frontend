import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

class AppConfig {
  final String backendUrl;
  final String port;
  final bool enableLogging;

  const AppConfig({
    required this.backendUrl,
    this.port = '',
    this.enableLogging = false,
  });
}

@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  return const AppConfig(
      backendUrl: 'http://192.168.1.33',
      port: '8000',
      enableLogging: true
  );
}
