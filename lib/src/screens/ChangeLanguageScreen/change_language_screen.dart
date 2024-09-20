// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:SOUFEEDBACKAPP/Localization/language/languages.dart';
import 'package:SOUFEEDBACKAPP/Localization/locale_constants.dart';
import 'package:SOUFEEDBACKAPP/src/models/language_model.dart';
import 'package:SOUFEEDBACKAPP/src/screens/ChangeLanguageScreen/change_language_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:stacked/stacked.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeLanguageViewModel>(
        create: (context) => locator<ChangeLanguageViewModel>(),
        child: ViewModelBuilder<ChangeLanguageViewModel>.reactive(
          viewModelBuilder: () => ChangeLanguageViewModel(context),
          builder: ((context, viewModel, child) {
            return Scaffold(
              body: SafeArea(
                  child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Languages.of(context)!.labelChangeLanguage,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    _createLanguageDropDown()
                  ],
                ),
              )),
            );
          }),
        ));
  }

  _createLanguageDropDown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DropdownButton<LanguageModel>(
          iconSize: 30,
          underline: SizedBox(),
          hint: Text(Languages.of(context)!.labelSelectLanguage),
          onChanged: (LanguageModel? language) {
            changeLanguage(context, language!.languageCode);

            print(language.languageCode);
          },
          items: LanguageModel.languageList()
              .map<DropdownMenuItem<LanguageModel>>(
                (e) => DropdownMenuItem<LanguageModel>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
