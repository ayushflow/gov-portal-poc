import 'package:flutter/cupertino.dart';
import 'package:gov_client_app/utils/logger.dart';

class CrashReportingManager {
  final List<CrashReportingService> services = [];

  void register(final CrashReportingService service) {
    services.add(service);
  }

  Future<void> onCrash(Object error, StackTrace stackTrace) async {
    for (final each in services) {
      each.onCrash(error, stackTrace);
    }
  }

  Future<void> onError(FlutterErrorDetails errorDetails) async {
    for (final each in services) {
      each.onError(errorDetails);
    }
  }
}

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
  Future<void> onError(FlutterErrorDetails error) async {
    Logger.info('Received Error event');
    Logger.error(error.exception.toString());
    Logger.error(error.stack.toString());
  }
}
