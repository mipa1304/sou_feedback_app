import 'package:flutter/material.dart';
import 'package:fimber/fimber.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sou_feedback_app/constant/routename.dart';
import 'package:sou_feedback_app/src/screens/VisitorFeedback/visitor_feedback_home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homescreen:
    case visitorFeedbackScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const VisitorFeedbackHomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => SafeArea(
          top: true,
          child: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, required Widget viewToShow}) {
  Fimber.i('Navigating To $routeName');
  return PageTransition(
    type: PageTransitionType.fade,
    child: SafeArea(child: viewToShow),
  );
}
