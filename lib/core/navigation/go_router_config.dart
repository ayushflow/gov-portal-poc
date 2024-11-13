import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_client_app/core/authentication/auth.dart';
import 'package:gov_client_app/core/crash_analytics/crash_reporting_service.dart';
import 'package:gov_client_app/core/di/service_locator.dart';
import 'package:gov_client_app/core/navigation/navigation_observer.dart';
import 'package:gov_client_app/features/auth/ui/login_screen.dart';
import 'package:gov_client_app/features/dashboard/ui/dashboard_screen.dart';
import 'package:gov_client_app/features/driving_license/ui/continue_journey.dart';
import 'package:gov_client_app/features/driving_license/ui/driving_license_home_screen.dart';
import 'package:gov_client_app/features/error/error_page.dart';
import 'package:gov_client_app/features/forms/forms_landing_page.dart';
import 'package:gov_client_app/features/forms/forms_page.dart';
import 'package:gov_client_app/features/verhicle_registration/ui/vehicle_registration_home_screen.dart';

// TODO:: add authenticated routes
List<String> authenticatedRoutes = ['/dashboard'];

// GoRouter configuration
final router = GoRouter(
  observers: [getIt<AppNavigationObserver>()],
  redirect: (context, state) async {
    /// conditions for decision of movement of
    /// if logged in, proceed to page with authentication
    ///
    /// if logged out, proceed to page without authentication.
    ///   take user back on the actual page after login if required by app or
    ///   done by user

    if (authenticatedRoutes.contains(state.fullPath) &&
        authenticatedRoutes.contains(state.fullPath?.split('/')[2]) &&
        !getIt.get<Auth>().userAuthenticated) {
      return '/login';
    }
    return null;
  },
  initialLocation: '/',
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
      path: '/dashboard/:userId',
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
    GoRoute(
      path: '/forms',
      builder: (_, __) => FormsLandingPage(),
      routes: [
        GoRoute(
          path: 'form/:formId',
          builder: (_, state) => FormsPage(
            id: state.pathParameters['formId'] ?? '-',
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (_, state) {
    getIt.get<CrashReportingManager>().onError(FlutterErrorDetails(
          exception: state.error?.message ?? 'NavigatorError',
        ));
    return const ErrorPage();
  },
);
