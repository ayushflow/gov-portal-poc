import 'package:gov_client_app/core/events/events.dart';
import 'package:gov_client_app/core/events/login_event_data.dart';
import 'package:gov_client_app/core/events/logout_event_data.dart';
import 'package:gov_client_app/core/navigation/go_router_config.dart';
import 'package:gov_client_app/utils/logger.dart';

class EventHandler {
  static Future<void> handleEvent(EventData event) async {
    switch (event.type) {
      case EventType.login:
        await handleLoginEvent(event as LoginEventData);
        break;
      case EventType.logout:
        await handleLogoutEvent(event as LogoutEventData);
        break;
      default:
        Logger.error('Unhandled event type: ${event.type}');
        break;
    }
  }

  static Future<void> handleLoginEvent(LoginEventData loginEventData) async {
    // Set the initial redirect data
    // Clear navigation stack and redirect to dashboard

    router.go('/dashboard');
  }

  static Future<void> handleLogoutEvent(LogoutEventData logoutEventData) async {
    router.go('/login');
  }
}
