// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/src/screens/HomeScreen/home_screen_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenViewModel>(
      create: (context) => locator<HomeScreenViewModel>(),
      child: ViewModelBuilder<HomeScreenViewModel>.reactive(
          viewModelBuilder: () => HomeScreenViewModel(context),
          builder: (context, model, child) {
            return Scaffold(
              body: Center(
                child: Text("data"),
              ),
            );
          }),
    );
  }
}
