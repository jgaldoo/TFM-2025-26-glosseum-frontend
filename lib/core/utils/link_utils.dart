import 'package:glosseum_frontend/core/config/app_logging.dart';
import 'package:url_launcher/url_launcher.dart';

final coreLogger = AppLoggers.core;
RegExp linkExpression = RegExp(
  r"(http(s)?:\/\/)?(?!\.)[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]+)+(\/[\w\.\/\?\=\&\%\#\:\@\+\~\;\,\(\)\[\]\{\}\-\']+)+(\/)?",
);

List<RegExpMatch> getLinks(String text) {
  return linkExpression.allMatches(text).toList();
}

Future<void> openLink(String url) async {
  try {
    final uri = Uri.parse(url);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (exception) {
    coreLogger.severe(exception);
  }
}
