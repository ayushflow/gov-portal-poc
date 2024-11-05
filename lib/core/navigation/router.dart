import 'package:flutter/material.dart';
import 'package:gov_client_app/core/navigation/redirection_data/login_redirect_data.dart';
import 'package:gov_client_app/features/auth/ui/login_screen.dart';
import 'package:gov_client_app/features/dashboard/ui/dashboard_screen.dart';
import 'package:gov_client_app/features/driving_license/ui/driving_license_home_screen.dart';
import 'package:gov_client_app/features/verhicle_registration/ui/vehicle_registration_home_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return buildLoginScreenRoute(settings);
      case '/login':
        return buildLoginScreenRoute(settings);
      case '/dashboard':
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case '/driving-license-home':
        return MaterialPageRoute(
          builder: (_) => const DrivingLicenseHomeScreen(),
        );
      case '/vehicle-registration-home':
        return MaterialPageRoute(
          builder: (_) => const VehicleRegistrationHomeScreen(),
        );
      default:
        return buildUnknownRoute(settings);
    }
  }

  // build login screen route
  static Route<dynamic> buildLoginScreenRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    String? initialMessage;
    if (arguments != null && arguments is LoginRedirectData) {
      initialMessage = arguments.initialMessage;
    }
    return MaterialPageRoute(
      builder: (_) => LoginScreen(
        initialMessage: initialMessage,
      ),
    );
  }

  // onUnknownRoute is called when the app is unable to find the route defined in the app
  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return buildUnknownRoute(settings);
  }

  static buildUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
