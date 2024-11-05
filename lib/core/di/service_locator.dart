import 'package:get_it/get_it.dart';
import 'package:gov_client_app/core/events/events.dart';
import 'package:gov_client_app/core/navigation/app_navigation_service.dart';
import 'package:gov_client_app/core/navigation/navigation_observer.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AppNavigationService>(
    () => AppNavigationService(),
  );

  getIt.registerLazySingleton<AppNavigationObserver>(
    () => AppNavigationObserver(),
  );

  getIt.registerLazySingleton<EventService>(
    () => EventService(),
  );
}

Future<void> reset() async {
  await getIt.reset();
  setupLocator();
}
