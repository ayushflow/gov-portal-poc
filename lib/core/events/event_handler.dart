import 'package:gov_client_app/core/di/service_locator.dart';
import 'package:gov_client_app/core/events/events.dart';
import 'package:gov_client_app/core/events/login_event_data.dart';
import 'package:gov_client_app/core/events/logout_event_data.dart';
import 'package:gov_client_app/core/navigation/app_navigation_service.dart';
import 'package:gov_client_app/core/navigation/redirection_data/app_redirect_data.dart';
import 'package:gov_client_app/core/navigation/redirection_data/dashboard_redirect_data.dart';
import 'package:gov_client_app/core/navigation/redirection_data/login_redirect_data.dart';
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
    final _appNavigationService = getIt<AppNavigationService>();
    _appNavigationService.redirect(
      DashboardRedirectData(
        redirectType: AppRedirectType.dashboard,
      ),
    );
  }

  static Future<void> handleLogoutEvent(LogoutEventData logoutEventData) async {
    // Clear the user data
    // Clear navigation stack and redirect to login
    final _appNavigationService = getIt<AppNavigationService>();
    _appNavigationService.redirect(
      LoginRedirectData(
        redirectType: AppRedirectType.login,
        initialMessage: logoutEventData.message,
      ),
    );
  }
}
