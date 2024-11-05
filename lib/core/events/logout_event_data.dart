import 'package:gov_client_app/core/events/events.dart';

class LogoutEventData extends EventData {
  final String? message;

  LogoutEventData({
    required super.type,
    this.message,
  });
}
