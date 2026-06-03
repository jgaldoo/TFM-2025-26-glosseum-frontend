import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppConfig {
  final String backendUrl;
  final String port;
  final bool enableLogging;

  const AppConfig({
    required this.backendUrl,
    this.port = "",
    this.enableLogging = false,
  });
}

final appConfigProvider = Provider<AppConfig>((ref) {
  return const AppConfig(
      backendUrl: 'http://10.0.2.2',
      port: '8000',
      enableLogging: true
  );
});