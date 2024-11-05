import 'package:flutter/material.dart';

final appNavigatorObserver = AppNavigationObserver();

class AppNavigationObserver extends NavigatorObserver {
  static final AppNavigationObserver _instance =
      AppNavigationObserver._internal();
  final List<Route<dynamic>> _navigationStack = [];

  factory AppNavigationObserver() {
    return _instance;
  }

  AppNavigationObserver._internal();

  List<Route<dynamic>> get navigationStack =>
      List.unmodifiable(_navigationStack);

  void logStack() {
    print('Current Navigation Stack:');
    for (var route in _navigationStack) {
      print(route.settings.name);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStack.add(route);
    logStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStack.remove(route);
    logStack();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStack.remove(route);
    logStack();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (oldRoute != null) {
      _navigationStack.remove(oldRoute);
    }
    if (newRoute != null) {
      _navigationStack.add(newRoute);
    }
    logStack();
  }
}
