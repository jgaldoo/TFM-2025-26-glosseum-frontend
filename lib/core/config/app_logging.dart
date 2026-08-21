import 'dart:developer' as developer;
import 'package:logging/logging.dart';

class AppLogging {
  static void configure({Level level = Level.INFO}) {
    Logger.root.level = level;

    Logger.root.onRecord.listen((record) {
      developer.log(
        record.message,
        name: record.loggerName,
        level: record.level.value,
        error: record.error,
        stackTrace: record.stackTrace,
      );
    });
  }
}

abstract final class AppLoggers {
  static final core = Logger('Core');
  static final database = Logger('Database');
  static final camera = Logger('Model: Camera');
  static final information = Logger('Model: Information');
  static final model = Logger('Model');
  static final ui = Logger('UI');
  static final network = Logger('Network');
}
