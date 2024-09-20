// ignore_for_file: prefer_const_constructors, unnecessary_import, avoid_unnecessary_containers, avoid_print, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmbtn.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/TextFieldWithPostFixIcon.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'OTP_model.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class OTPScreen extends StatefulWidget {
  final verId;
  const OTPScreen({
    Key? key,
    this.verId,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    const IconData dialpad = IconData(0xe1ce, fontFamily: 'MaterialIcons');

    final TextEditingController _otp = TextEditingController();
    // final verId;

    var size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider<OTPScreenViewModel>(
      create: (context) => locator<OTPScreenViewModel>(),
      child: ViewModelBuilder<OTPScreenViewModel>.reactive(
          viewModelBuilder: () => OTPScreenViewModel(context),
          builder: ((context, viewModel, child) {
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ThemeColors.bgColor,
                    ThemeColors.bgColor2,
                  ],
                )),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: size.height * 0.06),
                        child: Text(
                          'We’ll send you a Verification code on the same number.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      TextFieldWithPostFixIcon(
                        postfixIconTap: () => {},
                        controller: _otp,
                        postfixIcon: dialpad,
                        hinText: "Enter OTP",
                        postfixIconColor: const Color.fromARGB(60, 82, 79, 79),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomBtn(
                        height: size.height * 0.05,
                        width: size.width * 0.6,
                        str: 'Verify OTP',
                        btnColor: ThemeColors.appDarkPrimaryColor,
                        fontWeight: FontWeight.bold,
                        btnPressed: () async {
                          // await viewModel.VerifyOTP(_otp.text.toString().trim(),
                          //     widget.verId.toString());
                        },
                        borderRadius: 10,
                        btnBorderColor: ThemeColors.textBoxOutlineBorder,
                        fontSize: 18,
                        txtColor: ThemeColors.textBoxOutlineBorder,
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
