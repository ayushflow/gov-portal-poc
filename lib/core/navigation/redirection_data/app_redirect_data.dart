enum AppRedirectType {
  login,
  dashboard,
  drivingLicenseHome,
  vehicleRegistrationHome,
}

class AppRedirectData {
  final AppRedirectType redirectType;
  final bool clearNavigationStack;
  final bool replaceRoute;

  const AppRedirectData({
    required this.redirectType,
    this.clearNavigationStack = false,
    this.replaceRoute = false,
  });
}
