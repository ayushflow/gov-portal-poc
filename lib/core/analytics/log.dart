import 'package:gov_client_app/core/analytics/analytics.dart';
import 'package:gov_client_app/core/di/service_locator.dart';

Future<void> logAnalytics(String eventName, Map<String, dynamic> data) async {
  getIt.get<AnalyticsManager>().reportAnalytics(eventName, data);
}
