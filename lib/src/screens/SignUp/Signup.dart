// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unused_element

import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmbtn.dart';
import 'package:provider/provider.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/src/screens/SignUp/sign_up_model.dart';
import 'package:stacked/stacked.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/TextFieldWithPostFixIcon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? dob = "Your Birth Day";
  DateTime currentDate = DateTime.now();
  String? genderradiobtn;
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(3000));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        var dateTime = DateTime.parse(pickedDate.toString());
        dob = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
        print('===> Date $dob');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return ChangeNotifierProvider(
      create: (context) => locator<SignUpviewScreenModel>(),
      child: ViewModelBuilder<SignUpviewScreenModel>.reactive(
        viewModelBuilder: () => SignUpviewScreenModel(context),
        builder: (context, model, child) {
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(left: 25, right: 25, bottom: 25),
                        child: Text(
                          'Sign Up Here',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWithPostFixIcon(
                        postfixIconTap: () => {},
                        onvalidate: (value) {
                          if (value.isEmpty) {
                            return "Please enter Your name";
                          }
                          return null;
                        },
                        onTextChanged: (value) => {
                          // model.Username = value,
                        },
                        hinText: "Your Name",
                        postfixIconColor: Colors.white24,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _selectDate(context);
                      //   },
                      //   child: Container(
                      //       margin: const EdgeInsets.symmetric(horizontal: 10),
                      //       height: size.height * 0.07,
                      //       width: size.width * 0.7,
                      //       alignment: Alignment.centerLeft,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black),
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: dob == null
                      //             ? Text(
                      //                 dob.toString(),
                      //                 style: TextStyle(
                      //                   color: ThemeColors.textBoxOutlineBorder,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 15,
                      //                 ),
                      //               )
                      //             : Text(
                      //                 // model.UserBirthDay = dob.toString(),
                      //                 style: TextStyle(
                      //                   color: ThemeColors.textBoxOutlineBorder,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 15,
                      //                 ),
                      //               ),
                      //       )),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWithPostFixIcon(
                        postfixIconTap: () => {},
                        onTextChanged: (value) => {
                          // model.UserCity = value,
                        },
                        onvalidate: (value) {
                          if (value.isEmpty) {
                            return "Please enter Your City";
                          }
                          return null;
                        },
                        hinText: "Your City",
                        postfixIconColor: Colors.white24,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: size.height * 0.07,
                        width: size.width * 0.7,
                        // alignment: Alignment.center,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: size.width * 0.2,
                                child: Container(
                                    child: Text(
                                  'Gender :',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ThemeColors.textBoxOutlineBorder,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ))),
                            Container(
                              child: Row(
                                children: [
                                  Radio(
                                    value: "Male",
                                    onChanged: (value) {
                                      setState(() {
                                        genderradiobtn = value.toString();
                                        // model.UserGender = value.toString();
                                      });
                                    },
                                    groupValue: genderradiobtn,
                                  ),
                                  const Text(
                                    "Male",
                                    style: TextStyle(
                                      color: ThemeColors.textBoxOutlineBorder,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Radio(
                                    value: "Female",
                                    onChanged: (value) {
                                      setState(() {
                                        genderradiobtn = value.toString();
                                        // model.UserGender = value.toString();
                                      });
                                    },
                                    groupValue: genderradiobtn,
                                  ),
                                  const Text(
                                    "Female",
                                    style: TextStyle(
                                      color: ThemeColors.textBoxOutlineBorder,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWithPostFixIcon(
                        postfixIconTap: () => {},
                        onTextChanged: (value) => {
                          // model.UserMobile = value,
                        },
                        onvalidate: (value) {
                          if (value.isEmpty) {
                            return "Please enter Your Mobile No.";
                          }
                          return null;
                        },
                        hinText: "Your Mobile No.",
                        postfixIconColor: Colors.white24,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWithPostFixIcon(
                        postfixIconTap: () => {},
                        hinText: "Group Size",
                        onTextChanged: (value) => {
                          // model.UserGrpSize = value,
                        },
                        onvalidate: (value) {
                          if (value.isEmpty) {
                            return "Please enter Your Group Size";
                          }
                          return null;
                        },
                        postfixIconColor: Colors.white24,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWithPostFixIcon(
                        postfixIconTap: () => {},
                        onTextChanged: (value) => {
                          // model.UserProfession = value
                        },
                        hinText: "Profession",
                        onvalidate: (value) {
                          if (value.isEmpty) {
                            return "Please enter Your Profession";
                          }
                          return null;
                        },
                        postfixIconColor: Colors.white24,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomBtn(
                        height: size.height * 0.05,
                        width: size.width * 0.25,
                        str: 'SignUp!',
                        fontWeight: FontWeight.bold,
                        btnColor: ThemeColors.appDarkPrimaryColor,
                        btnPressed: () async {
                          // if (_formKey.currentState!.validate()) {
                          //   final isSaved = await model.saveusers();
                          //   if (isSaved) {
                          //     model.redirectToPage(homescreen);
                          //   }
                          // }
                        },
                        borderRadius: 10,
                        btnBorderColor: ThemeColors.textBoxOutlineBorder,
                        fontSize: 18,
                        // fontWeight: FontWeight.w300,
                        txtColor: ThemeColors.textBoxOutlineBorder,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
