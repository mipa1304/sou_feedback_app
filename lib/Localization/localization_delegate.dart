import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/Localization/language/language_eng.dart';
import 'package:SOUFEEDBACKAPP/Localization/language/language_hindi.dart';
import 'package:SOUFEEDBACKAPP/Localization/language/language_gujarati.dart';
import 'package:SOUFEEDBACKAPP/Localization/language/language_tamil.dart';
import 'package:SOUFEEDBACKAPP/Localization/language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'hi', 'gu', 'ta'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEng();
      case 'hi':
        return LanguageHin();
      case 'gu':
        return LanguageGuj();
      case 'ta':
        return LanguageTamil();
      default:
        return LanguageEng();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
