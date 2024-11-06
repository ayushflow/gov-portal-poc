import 'package:flutter/foundation.dart';
import 'package:gov_client_app/core/crash_analytics/crash_reporting_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryReportingService implements CrashReportingService {
  @override
  Future<void> onCrash(Object error, StackTrace stackTrace) async {
    await Sentry.captureException(error, stackTrace: stackTrace);
  }

  @override
  Future<void> onError(FlutterErrorDetails error) async {
    await Sentry.captureException(error.exception, stackTrace: error.stack);
  }
}
