import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gov_client_app/core/crash_analytics/crash_reporting_service.dart';
import 'package:gov_client_app/core/crash_analytics/sentry_reporting_service.dart';
import 'package:gov_client_app/core/di/service_locator.dart';
import 'package:gov_client_app/core/events/events.dart';
import 'package:gov_client_app/core/navigation/app_navigation_service.dart';
import 'package:gov_client_app/core/navigation/navigation_observer.dart';
import 'package:gov_client_app/core/navigation/router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    initCrashServices();
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://893b2224d34937c34ca40528ba1b5e9f@o4508246912204800.ingest.de.sentry.io/4508246915154000';
      },
    );
    FlutterError.onError = getIt.get<CrashReportingManager>().onError;
    runApp(const MyGovApp());
  }, (exception, stackTrace) async {
    getIt.get<CrashReportingManager>().onCrash(exception, stackTrace);
  });
}

void initCrashServices() {
  getIt.get<CrashReportingManager>()
    ..register(LoggerCrashReportingService())
    ..register(SentryReportingService());
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
