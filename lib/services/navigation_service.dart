//TODO:need of this file

import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => navigatorKey;

  void pop() {
    return navigationKey.currentState!.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndPop(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAllAndNavigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  // Future navigateTo(String routeName,
  //     {Object? arguments, bool withreplacement = false}) {
  //   if (withreplacement) {
  //     return navigatorKey.currentState!.pushNamedAndRemoveUntil(
  //         routeName, (route) => false,
  //         arguments: arguments);
  //   } else {
  //     return navigatorKey.currentState!
  //         .pushNamed(routeName, arguments: arguments);
  //   }
  // }

  // bool pop({required String routeName, Object? argument}) {
  //   navigatorKey.currentState!.pop();

  //   return true;
  // }
}
