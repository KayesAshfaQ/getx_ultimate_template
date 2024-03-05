import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Prints a log message to the console.
///
/// The [printLog] function prints a log message to the console. It takes a [message] as a required parameter and
/// optional parameters [level], [stackTrace], and [error]. The [level] parameter determines the severity of the log
/// message and defaults to `Level.debug` if not provided. If an [error] is provided without a [stackTrace], the
/// [level] is set to `Level.error`. If both [error] and [stackTrace] are provided, the [level] is set to `Level.info`.
/// If only [stackTrace] is provided, the [level] is set to `Level.trace`. The function only logs messages when the
/// application is in debug mode.
///
/// Parameters:
/// - `message`: The log message to print.
/// - `level` (optional): The severity level of the log message. Defaults to `Level.debug`.
/// - `stackTrace` (optional): The stack trace associated with the log message.
/// - `error` (optional): The error associated with the log message.
///
/// Example usage:
/// ```dart
/// printLog('This is a debug message');
/// printLog('This is an info message with error and stack trace',
///           level: Level.info,
///           error: SomeError(),
///           stackTrace: StackTrace.current);
/// ```
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
