// ignore_for_file: unused_import, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:SOUFEEDBACKAPP/Localization/localization_delegate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/Managers/DialogManager.dart';
// import 'package:SOUFEEDBACKAPP/provider/getit.dart';
// import 'package:SOUFEEDBACKAPP/route_generator.dart';
import 'package:SOUFEEDBACKAPP/services/dialogService.dart';
import 'package:SOUFEEDBACKAPP/services/navigation_service.dart';
// import 'constant/routename.dart';
import 'locator.dart';
import 'route_generator.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Localization/locale_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.playIntegrity);
  setupLocator();

  runApp(const MyApp());
}

RouteSettings? settings;

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  final String? routePath;
  const MyApp({Key? key, this.routePath}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      title: 'Statue Of Unity Feedback Form',
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('hi', ''),
        Locale('gu', ''),
        Locale('ta', ''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      builder: (context, child) => ScrollConfiguration(
        behavior: CustomScrollBehaviour(),
        child: Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: ((context) => DialogManager(child: child!))),
        ),
      ),
      initialRoute: homescreen,
      onGenerateRoute: generateRoute,
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
