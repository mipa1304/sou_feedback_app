// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedBackForm4/feedback_form_model4.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmbtn.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../constant/routename.dart';

class FeedBackForm4 extends StatefulWidget {
  const FeedBackForm4({Key? key}) : super(key: key);

  @override
  State<FeedBackForm4> createState() => _FeedBackForm4State();
}

class _FeedBackForm4State extends State<FeedBackForm4> {
  bool isseat_arreng = false;
  String seat_arreng = "No";

  bool isseat_arreng2 = false;
  String seat_arreng2 = "No";

  bool isseat_arreng3 = false;
  String seat_arreng3 = "No";

  bool iscleaning_Seat_Area = false;
  String cleaning_Seat_Area = "No";

  bool iscleaning_Seat_Area2 = false;
  String cleaning_Seat_Area2 = "No";

  bool iscleaning_Seat_Area3 = false;
  String cleaning_Seat_Area3 = "No";

  bool isWash_clean = false;
  String Wash_clean = "No";

  bool isWash_clean2 = false;
  String Wash_clean2 = "No";

  bool isWash_clean3 = false;
  String Wash_clean3 = "No";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider<Feedback4ViewModel>(
      create: (context) => locator<Feedback4ViewModel>(),
      child: ViewModelBuilder<Feedback4ViewModel>.reactive(
        viewModelBuilder: () => Feedback4ViewModel(context),
        builder: (context, viewModel, child) {
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
                  children: [
                    Container(
                      child: Text(
                        'FEEDBACK FORM',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '(Only for Statue of Unity Premises)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.all(size.height * 0.01),
                          child: Text(
                            "(H). Cafeteria",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: size.width * 0.34,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(size.height * 0.01),
                              child: Text(
                                "Seating Arrangements",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: size.height * 0.3,
                                    color: Colors.black),
                              ),
                            ),
                            Checkbox(
                              value: isseat_arreng,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    isseat_arreng = !isseat_arreng;
                                    print(newValue);
                                    if (newValue == true) {
                                      seat_arreng = "Excellent";
                                    } else {
                                      seat_arreng = "No";
                                    }
                                    // print(exHall);
                                    // viewModel.CafeSeatingArrangements =
                                    //     seat_arreng;
                                  },
                                );
                              },
                            ),
                            const Text("Excellent"),
                            Checkbox(
                              value: isseat_arreng2,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    isseat_arreng2 = !isseat_arreng2;
                                    print(newValue);
                                    if (newValue == true) {
                                      seat_arreng2 = "Good";
                                    } else {
                                      seat_arreng2 = "No";
                                    }
                                    // viewModel.CafeSeatingArrangements =
                                    //     seat_arreng2;
                                    // print(exHall2);
                                  },
                                );
                              },
                            ),
                            const Text("Good"),
                            Checkbox(
                              value: isseat_arreng3,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    isseat_arreng3 = !isseat_arreng3;
                                    print(newValue);
                                    if (newValue == true) {
                                      seat_arreng3 = "Avg";
                                    } else {
                                      seat_arreng3 = "No";
                                    }
                                    // viewModel.CafeSeatingArrangements =
                                    //     seat_arreng3;
                                    // print(exHall3);
                                  },
                                );
                              },
                            ),
                            const Text("Avg"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: size.width * 0.34,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(size.height * 0.01),
                              child: Text(
                                "Cleanliness of Seating Area",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: size.height * 0.3,
                                    color: Colors.black),
                              ),
                            ),
                            Checkbox(
                              value: iscleaning_Seat_Area,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    iscleaning_Seat_Area =
                                        !iscleaning_Seat_Area;
                                    print(newValue);
                                    if (newValue == true) {
                                      cleaning_Seat_Area = "Excellent";
                                    } else {
                                      cleaning_Seat_Area = "No";
                                    }
                                    // viewModel.CleanlinessOfSeatingArea =
                                    //     cleaning_Seat_Area;
                                    // print(exHall);
                                  },
                                );
                              },
                            ),
                            const Text("Excellent"),
                            Checkbox(
                              value: iscleaning_Seat_Area2,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    iscleaning_Seat_Area2 =
                                        !iscleaning_Seat_Area2;
                                    print(newValue);
                                    if (newValue == true) {
                                      cleaning_Seat_Area2 = "Good";
                                    } else {
                                      cleaning_Seat_Area2 = "No";
                                    }
                                    // viewModel.CleanlinessOfSeatingArea =
                                    //     cleaning_Seat_Area2;
                                    // print(exHall2);
                                  },
                                );
                              },
                            ),
                            const Text("Good"),
                            Checkbox(
                              value: iscleaning_Seat_Area3,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    iscleaning_Seat_Area3 =
                                        !iscleaning_Seat_Area3;
                                    print(newValue);
                                    if (newValue == true) {
                                      cleaning_Seat_Area3 = "Avg";
                                    } else {
                                      cleaning_Seat_Area3 = "No";
                                    }
                                    // print(exHall3);
                                    // viewModel.CleanlinessOfSeatingArea =
                                    //     cleaning_Seat_Area3;
                                  },
                                );
                              },
                            ),
                            const Text("Avg"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: size.width * 0.34,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(size.height * 0.01),
                              child: Text(
                                "Washroom Cleanliness",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: size.height * 0.3,
                                    color: Colors.black),
                              ),
                            ),
                            Checkbox(
                              value: isWash_clean,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    isWash_clean = !isWash_clean;
                                    print(newValue);
                                    if (newValue == true) {
                                      Wash_clean = "Excellent";
                                    } else {
                                      Wash_clean = "No";
                                    }
                                    // viewModel.WashroomCleanliness = Wash_clean;
                                    // print(exHall);
                                  },
                                );
                              },
                            ),
                            const Text("Excellent"),
                            Checkbox(
                              value: isWash_clean2,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    isWash_clean2 = !isWash_clean2;
                                    print(newValue);
                                    if (newValue == true) {
                                      Wash_clean2 = "Good";
                                    } else {
                                      Wash_clean2 = "No";
                                    }
                                    // viewModel.WashroomCleanliness = Wash_clean2;
                                    // print(exHall2);
                                  },
                                );
                              },
                            ),
                            const Text("Good"),
                            Checkbox(
                              value: isWash_clean3,
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    isWash_clean3 = !isWash_clean3;
                                    print(newValue);
                                    if (newValue == true) {
                                      Wash_clean3 = "Avg";
                                    } else {
                                      Wash_clean3 = "No";
                                    }
                                    // viewModel.WashroomCleanliness = Wash_clean3;
                                    // print(exHall3);
                                  },
                                );
                              },
                            ),
                            const Text("Avg"),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.height * 0.02,
                              right: size.height * 0.02),
                          child: TextField(
                              maxLines: 3,
                              onChanged: (String str) {
                                // viewModel.RemarkH = str;
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      width: 5,
                                      color: ThemeColors
                                          .textBoxOutlineBorderFocus),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        width: 5,
                                        color:
                                            ThemeColors.textBoxOutlineBorder)),
                                hintText: "Add Remarks",
                                hintStyle: const TextStyle(
                                  color: ThemeColors.textBoxOutlineBorder,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.height * 0.02,
                              right: size.height * 0.02,
                              top: size.height * 0.03),
                          child: TextField(
                              maxLines: 5,
                              onChanged: (String str) {
                                // viewModel.OtherSuggestions = str;
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      width: 5,
                                      color: ThemeColors
                                          .textBoxOutlineBorderFocus),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        width: 5,
                                        color:
                                            ThemeColors.textBoxOutlineBorder)),
                                hintText: "Any other Suggestions",
                                hintStyle: const TextStyle(
                                  color: ThemeColors.textBoxOutlineBorder,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(size.height * 0.01),
                      child: CustomBtn(
                        width: size.width * 0.8,
                        height: size.height * 0.05,
                        str: 'Submit Form',
                        fontWeight: FontWeight.bold,
                        btnColor: ThemeColors.appDarkPrimaryColor,
                        btnPressed: () async {
                          // final isFormD = await viewModel.savefeedbackformE();
                          // if (isFormD) {
                          //   viewModel.redirectToPage(homescreen);
                          //   await FirebaseAuth.instance.signOut();
                          // } else {
                          //   print("Please Check Form Properly");
                          // }
                        },
                        borderRadius: 10,
                        btnBorderColor: ThemeColors.textBoxOutlineBorder,
                        fontSize: 20,
                        // fontWeight: FontWeight.w300,
                        txtColor: ThemeColors.textBoxOutlineBorder,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
