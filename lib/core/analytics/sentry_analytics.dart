import 'package:gov_client_app/core/analytics/analytics.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryAnalyticsService implements AnalyticsService {
  @override
  Future<void> reportAnalytics(
      String eventName, Map<String, dynamic> data) async {
    await Sentry.captureMessage(eventName,
        params: [data], level: SentryLevel.info);
  }
}
