import 'package:flutter/material.dart';
import 'package:gov_client_app/core/di/service_locator.dart';
import 'package:gov_client_app/core/events/events.dart';
import 'package:gov_client_app/core/navigation/app_navigation_service.dart';
import 'package:gov_client_app/core/navigation/navigation_observer.dart';
import 'package:gov_client_app/core/navigation/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register dependencies/services for app consumption
  setupLocator();

  runApp(const MyGovApp());
}

class MyGovApp extends StatefulWidget {
  const MyGovApp({super.key});

  @override
  State<MyGovApp> createState() => _MyGovAppState();
}

class _MyGovAppState extends State<MyGovApp> {
  final _eventService = getIt<EventService>();
  @override
  void initState() {
    _eventService.init();
    super.initState();
  }

  @override
  void dispose() {
    _eventService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyGov',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      navigatorKey: navigatorKey,
      navigatorObservers: [
        getIt<AppNavigationObserver>(),
      ],
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
    );
  }
}
