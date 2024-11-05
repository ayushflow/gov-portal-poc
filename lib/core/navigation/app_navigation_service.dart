import 'package:flutter/material.dart';
import 'package:gov_client_app/core/navigation/redirection_data/app_redirect_data.dart';
import 'package:gov_client_app/core/navigation/redirection_data/dashboard_redirect_data.dart';
import 'package:gov_client_app/core/navigation/redirection_data/driving_license_home_redirect_data.dart';
import 'package:gov_client_app/core/navigation/redirection_data/login_redirect_data.dart';
import 'package:gov_client_app/core/navigation/redirection_data/vehicle_registration_home_redirect_data.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppNavigationService {
  void pop() {
    navigatorKey.currentState?.pop();
  }

  void pushNamedWithArguments(String routeName, Object? arguments) {
    navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pushReplacementNamedWithArguments(String routeName, Object? arguments) {
    navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pushNamedAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) predicate,
    Object? arguments,
  ) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  Future<dynamic> handleRedirection(
      String routeName, AppRedirectData redirectData) async {
    if (redirectData.clearNavigationStack) {
      return pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        redirectData,
      );
    } else if (redirectData.replaceRoute) {
      return pushReplacementNamedWithArguments(
        routeName,
        redirectData,
      );
    } else {
      return pushNamedWithArguments(
        routeName,
        redirectData,
      );
    }
  }

  Future<dynamic> redirect(AppRedirectData redirectData) async {
    switch (redirectData.redirectType) {
      case AppRedirectType.dashboard:
        return _handleDashboardRedirect(redirectData as DashboardRedirectData);

      case AppRedirectType.drivingLicenseHome:
        return _handleDrivingLicenseHomeRedirect(
            redirectData as DrivingLicenseHomeRedirectData);

      case AppRedirectType.vehicleRegistrationHome:
        _handleVehicleRegistrationHomeRedirect(
            redirectData as VehicleRegistrationHomeRedirectData);
        break;
      case AppRedirectType.login:
      default:
        return _handleLoginRedirect(redirectData as LoginRedirectData);
    }
  }

  void _handleDashboardRedirect(DashboardRedirectData redirectData) async {
    // For dashboard redirection we will clear the navigation stack and only push the dashboard route
    pushNamedAndRemoveUntil(
      '/dashboard',
      (route) => false,
      redirectData,
    );
  }

  void _handleLoginRedirect(LoginRedirectData redirectData) async {
    // For login redirection we will clear the navigation stack and only push the login route
    pushNamedAndRemoveUntil(
      '/login',
      (route) => false,
      redirectData,
    );
  }

  Future<dynamic> _handleDrivingLicenseHomeRedirect(
      DrivingLicenseHomeRedirectData redirectData) async {
    return handleRedirection(
      '/driving-license-home',
      redirectData,
    );
  }

  Future<dynamic> _handleVehicleRegistrationHomeRedirect(
      VehicleRegistrationHomeRedirectData redirectData) async {
    return handleRedirection(
      '/vehicle-registration-home',
      redirectData,
    );
  }
}
