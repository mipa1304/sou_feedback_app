// ignore_for_file: unused_element, unused_import

import 'package:SOUFEEDBACKAPP/src/screens/Login%20GR/gr_login.dart';
import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedBackForm2/feedback2.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedBackForm4/FeedBackForm4.dart';
// import 'package:SOUFEEDBACKAPP/src/screens/HomeScreen/home_screen.dart';
// import 'package:SOUFEEDBACKAPP/src/screens/home_screen.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedbackForm/feedback.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:fimber/fimber.dart';
import 'package:page_transition/page_transition.dart';
import 'package:SOUFEEDBACKAPP/src/screens/SignUp/Signup.dart';
import 'src/screens/FeedBackForm3/FeedbackForm3.dart';
import 'src/screens/OTP Screen/OTP_Screen.dart';
import 'package:SOUFEEDBACKAPP/src/screens/Login/login.dart';
import 'package:SOUFEEDBACKAPP/src/screens/ChangeLanguageScreen/change_language_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings, {dynamic args}) {
  switch (settings.name) {
    case homescreen:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const LoginScreen());
    case grhomescreen:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const GRLoginScreen());
    case changelanguagescreen:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const ChangeLanguageScreen());
    case feedbackscreen:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const FeedbackScreen());
    case feedbackscreen2:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const Feedback2());
    case signupScreen:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const SignUpScreen());
    case feedbackscreen3:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const FeedbackForm3());
    case feedbackscreen4:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const FeedBackForm4());
    case otpscreen:
      return _getPageRoute(
          routeName: settings.name,
          viewToShow: const OTPScreen(
            verId: '',
          ));
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

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings,
//       {dynamic arguments}) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => const HomeScreen());
//       case '/second':
//         return MaterialPageRoute(builder: (_) => const HomeScreen2());
// //      // Validation of correct data type
// //        if (args is String) {
// //          return MaterialPageRoute(
// //            builder: (_) => SecondPage(
// //              data: args,
// //            ),
// //          );
// //        }
// //        // If args is not of the correct type, return an error page.
// //        // You can also throw an exception while in development.
// //        return _errorRoute();
//       default:
//         // If there is no such named route in the switch statement, e.g. /third
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Error'),
//         ),
//         body: const Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
// }

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  Fimber.i('Navigating To $routeName');
  return PageTransition(
    type: PageTransitionType.fade,
    child: SafeArea(child: viewToShow!),
  );
}
