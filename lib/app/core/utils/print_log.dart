import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

printLog(String message, {Level? level, StackTrace? stackTrace, Object? error}) {
  if (kDebugMode) {
    if (level == null) {
      if (error != null && stackTrace != null) {
        level = Level.info;
      } else if (error != null) {
        level = Level.error;
      } else if (stackTrace != null) {
        level = Level.trace;
      } else {
        level ??= Level.debug;
      }
    }

    Logger().log(level, message, stackTrace: stackTrace, error: error);
  }
}
