import 'package:flutter/cupertino.dart';
import 'package:gov_client_app/utils/logger.dart';

abstract class CrashReportingService {
  Future<void> onCrash(Object error, StackTrace stackTrace);

  Future<void> onError(FlutterErrorDetails errorDetails);
}

class LoggerCrashReportingService implements CrashReportingService {
  @override
  Future<void> onCrash(Object error, StackTrace stackTrace) async {
    Logger.info('Received Crash event');
    Logger.error(error.toString());
    Logger.error(stackTrace.toString());
  }

  @override
  Future<void> onError(FlutterErrorDetails errorDetails) async {
    Logger.info('Received Error event');
    Logger.error(errorDetails.toString());
  }
}
