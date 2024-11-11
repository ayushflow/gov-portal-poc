import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gov_client_app/core/analytics/analytics.dart';
import 'package:gov_client_app/core/analytics/sentry_analytics.dart';
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
    initAnalyticsServices();
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'http://d832e01eba4eb404fcad65df98cf54be@127.0.0.1:9000/1';
        options.tracesSampleRate = 1.0;
        options.tracesSampler = (samplingContext) {
          // return a number between 0 and 1 or null (to fallback
          // to configured value)
          return 0.3;
        };
      },
    );
    FlutterError.onError = getIt.get<CrashReportingManager>().onError;
    runApp(const MyGovApp());
  }, (exception, stackTrace) async {
    getIt.get<CrashReportingManager>().onCrash(exception, stackTrace);
  });
}

void initAnalyticsServices() {
  getIt.get<AnalyticsManager>()
    ..register(LoggerAnalyticsService())
    ..register(SentryAnalyticsService());
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
      initialRoute: '/driving-license-home',
      navigatorKey: navigatorKey,
      navigatorObservers: [
        getIt<AppNavigationObserver>(),
      ],
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
    );
  }
}

// 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

// Client Secret: 634c41d68f555560c4c16a72deee8157d59981380eeadfa6b895f63c87058c43
// Client iD: eaaac3b52c2e289431ab750a94dd2dacb4e596bb44c87ab0f35924093cb7307e
