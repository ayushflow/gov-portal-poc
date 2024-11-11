import 'package:go_router/go_router.dart';
import 'package:gov_client_app/core/di/service_locator.dart';
import 'package:gov_client_app/core/navigation/navigation_observer.dart';
import 'package:gov_client_app/features/auth/ui/login_screen.dart';
import 'package:gov_client_app/features/dashboard/ui/dashboard_screen.dart';
import 'package:gov_client_app/features/driving_license/ui/continue_journey.dart';
import 'package:gov_client_app/features/driving_license/ui/driving_license_home_screen.dart';
import 'package:gov_client_app/features/verhicle_registration/ui/vehicle_registration_home_screen.dart';

// TODO:: add guard routes
// GoRouter configuration
final router = GoRouter(
  observers: [getIt<AppNavigationObserver>()],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return LoginScreen(
            initialMessage: state.pathParameters['initialMessage'] ?? '');
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return LoginScreen(
            initialMessage: state.pathParameters['initialMessage'] ?? '');
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        return DashboardScreen();
      },
    ),
    GoRoute(
      path: '/driving-license-home',
      builder: (context, state) {
        return DrivingLicenseHomeScreen();
      },
    ),
    GoRoute(
      path: '/vehicle-registration-home',
      builder: (context, state) {
        return VehicleRegistrationHomeScreen();
      },
    ),
    GoRoute(
      path: '/continue_journey',
      builder: (context, state) {
        return ContinueJourneyPage();
      },
    ),
  ],
);
