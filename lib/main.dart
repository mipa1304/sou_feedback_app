// ignore_for_file: unused_import, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sou_feedback_app/Localization/localization_delegate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sou_feedback_app/Managers/DialogManager.dart';
// import 'package:sou_feedback_app/provider/getit.dart';
// import 'package:sou_feedback_app/route_generator.dart';
import 'package:sou_feedback_app/services/dialogService.dart';
import 'package:sou_feedback_app/services/navigation_service.dart';
// import 'constant/routename.dart';
import 'locator.dart';
import 'route_generator.dart';
import 'package:sou_feedback_app/constant/routename.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'Localization/locale_constants.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:sou_feedback_app/dataconnect_generated/generated.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Firebase Auth using a custom token from a secure endpoint.
  // Replace the URL below with your token provider endpoint.
  // try {
  //   final Uri tokenEndpoint = Uri.parse('http://localhost:3000/token');
  //   if (kDebugMode) {
  //     print('Requesting custom token from $tokenEndpoint');
  //   }

  //   final resp = await http.get(tokenEndpoint);
  //   if (resp.statusCode == 200) {
  //     final token = resp.body.trim();
  //     if (token.isNotEmpty) {
  //       try {
  //         await FirebaseAuth.instance.signInWithCustomToken(token);
  //         if (kDebugMode) {
  //           print('Signed in with custom token');
  //         }
  //       } on FirebaseAuthException catch (e) {
  //         if (kDebugMode) {
  //           print('Custom token sign-in failed: ${e.message}');
  //         }
  //       }
  //     } else {
  //       if (kDebugMode) {
  //         print('Received empty token from token endpoint');
  //       }
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       print('Token endpoint returned ${resp.statusCode}: ${resp.body}');
  //     }
  //   }
  // } catch (e) {
  // if (kDebugMode) {
  //   print('Error during custom token authentication: $e');
  // }
  // }

  // try {
  //   if (kIsWeb) {
  //     // Provide your reCAPTCHA v3 site key for web App Check initialization.
  //     // Replace the placeholder with your actual site key from Firebase Console.
  //     await FirebaseAppCheck.instance
  //         .activate(webRecaptchaSiteKey: 'REPLACE_WITH_YOUR_SITE_KEY');
  //   } else {
  //     await FirebaseAppCheck.instance
  //         .activate(androidProvider: AndroidProvider.playIntegrity);
  //   }
  // } catch (e) {
  //   // If App Check activation fails, log and continue — avoid crashing the app.
  //   if (kDebugMode) print('App Check activation failed: $e');
  // }
  setupLocator();

  runApp(const MyApp());
}

final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');

RouteSettings? settings;

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  final String? routePath;
  const MyApp({Key? key, this.routePath}) : super(key: key);

  // Future<QueryResult<ListAnalysisReportsData, void>> _reportlistFuture = ExampleConnector.instance.listAnalysisReports().execute();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  late final Future<QueryResult<ListAnalysisReportsData?, void>>
      _reportListFuture;

  @override
  void initState() {
    super.initState();
    _reportListFuture =
        ExampleConnector.instance.listAnalysisReports().execute();

    _reportListFuture.then(
      (result) {
        if (kDebugMode) {
          print('Report list future completed');
        }
      },
      onError: (error) {
        if (kDebugMode) {
          print('Report list future failed with error: $error');
        }
      },
    );
  }

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
