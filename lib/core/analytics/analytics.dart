import 'package:gov_client_app/utils/logger.dart';

class AnalyticsManager {
  final List<AnalyticsService> services = [];

  void register(final AnalyticsService service) {
    services.add(service);
  }

  Future<void> reportAnalytics(
      String eventName, Map<String, dynamic> data) async {
    for (final each in services) {
      each.reportAnalytics(eventName, data);
    }
  }
}

abstract class AnalyticsService {
  Future<void> reportAnalytics(String eventName, Map<String, dynamic> data);
}

class LoggerAnalyticsService implements AnalyticsService {
  @override
  Future<void> reportAnalytics(
      String eventName, Map<String, dynamic> data) async {
    Logger.info('$eventName: ${data.toString()}');
  }
}
