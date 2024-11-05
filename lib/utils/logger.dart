import 'package:flutter/foundation.dart';

enum LogLevel { info, warning, error, debug }

class Logger {
  static void log(String? message, {LogLevel level = LogLevel.info}) {
    // Only log messages in debug mode if debugModeOnly is set to true
    if (kDebugMode) {
      // Format the log message
      final formattedMessage = _formatMessage(message, level);

      // Print the log to the console
      print(formattedMessage);
    }
  }

  static void info(String? message) {
    log(message, level: LogLevel.info);
  }

  static void warning(String? message) {
    log(message, level: LogLevel.warning);
  }

  static void error(String? message) {
    log(message, level: LogLevel.error);
  }

  static void debug(String? message) {
    log(message, level: LogLevel.debug);
  }

  // Helper method to format log messages
  static String _formatMessage(String? message, LogLevel level) {
    final timestamp = DateTime.now().toIso8601String();
    final levelString = level.toString().split('.').last.toUpperCase();
    return "[$timestamp] [$levelString] $message";
  }
}
