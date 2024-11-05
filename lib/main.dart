import 'package:flutter/material.dart';
import 'package:gov_client_app/core/navigation/app_navigation_service.dart';
import 'package:gov_client_app/core/navigation/navigation_observer.dart';
import 'package:gov_client_app/core/navigation/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyGovApp());
}

class MyGovApp extends StatelessWidget {
  const MyGovApp({super.key});

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
        appNavigatorObserver,
      ],
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
    );
  }
}
