// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmbtn.dart';
import 'package:provider/provider.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedBackForm3/Feedback_form3_model.dart';
import 'package:stacked/stacked.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';

class FeedbackForm3 extends StatefulWidget {
  const FeedbackForm3({Key? key}) : super(key: key);

  @override
  State<FeedbackForm3> createState() => _FeedbackForm3State();
}

class _FeedbackForm3State extends State<FeedbackForm3> {
  //(E)

  bool isTrave_Bridge = false;
  String Trave_Bridge = "No";

  bool isTrave_Bridge2 = false;
  String Trave_Bridge2 = "No";

  bool isTrave_Bridge3 = false;
  String Trave_Bridge3 = "No";

  bool isEscala = false;
  String Escala = "No";

  bool isEscala2 = false;
  String Escala2 = "No";

  bool isEscala3 = false;
  String Escala3 = "No";

  bool iselevators = false;
  String elevators = "No";

  bool iselevators2 = false;
  String elevators2 = "No";

  bool iselevators3 = false;
  String elevators3 = "No";

  //(f)

  bool isqc_exhi = false;
  String qc_exhi = "No";

  bool isqc_exhi2 = false;
  String qc_exhi2 = "No";

  bool isqc_exhi3 = false;
  String qc_exhi3 = "No";

  bool isintr_actv_equ = false;
  String intr_actv_equ = "No";

  bool isintr_actv_equ2 = false;
  String intr_actv_equ2 = "No";

  bool isintr_actv_equ3 = false;
  String intr_actv_equ3 = "No";

  bool iscont_exhi = false;
  String cont_exhi = "No";

  bool iscont_exhi2 = false;
  String cont_exhi2 = "No";

  bool iscont_exhi3 = false;
  String cont_exhi3 = "No";

  // (G)

  bool isseat_arrng = false;
  String seat_arrng = "No";

  bool isseat_arrng2 = false;
  String seat_arrng2 = "No";

  bool isseat_arrng3 = false;
  String seat_arrng3 = "No";

  bool isav_content = false;
  String av_content = "No";

  bool isav_content2 = false;
  String av_content2 = "No";

  bool isav_content3 = false;
  String av_content3 = "No";

  bool isaudi_qua = false;
  String audi_qua = "No";

  bool isaudi_qua2 = false;
  String audi_qua2 = "No";

  bool isaudi_qua3 = false;
  String audi_qua3 = "No";

  bool isvid_qc = false;
  String vid_qc = "No";

  bool isvid_qc2 = false;
  String vid_qc2 = "No";

  bool isvid_qc3 = false;
  String vid_qc3 = "No";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider<Feedback3ViewModel>(
      create: (context) => locator<Feedback3ViewModel>(),
      child: ViewModelBuilder<Feedback3ViewModel>.reactive(
          viewModelBuilder: () => Feedback3ViewModel(context),
          builder: ((context, viewModel, child) {
            return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
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
                      children: <Widget>[
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
                                "(E). Facility Functioning.",
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
                                    "Travelators on the Bridge",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: isTrave_Bridge,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isTrave_Bridge = !isTrave_Bridge;
                                        print(newValue);
                                        if (newValue == true) {
                                          Trave_Bridge = "Excellent";
                                        } else {
                                          Trave_Bridge = "No";
                                        }
                                        // viewModel.TravelatorsBridge =
                                        //     Trave_Bridge;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isTrave_Bridge2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isTrave_Bridge2 = !isTrave_Bridge2;
                                        print(newValue);
                                        if (newValue == true) {
                                          Trave_Bridge2 = "Good";
                                        } else {
                                          Trave_Bridge2 = "No";
                                        }
                                        // print(exHall2);
                                        // viewModel.TravelatorsBridge =
                                        //     Trave_Bridge2;
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isTrave_Bridge3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isTrave_Bridge3 = !isTrave_Bridge3;
                                        print(newValue);
                                        if (newValue == true) {
                                          Trave_Bridge3 = "Avg";
                                        } else {
                                          Trave_Bridge3 = "No";
                                        }
                                        // print(exHall3);
                                        // viewModel.TravelatorsBridge =
                                        //     Trave_Bridge3;
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
                                    "Escalators",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: isEscala,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isEscala = !isEscala;
                                        print(newValue);
                                        if (newValue == true) {
                                          Escala = "Excellent";
                                        } else {
                                          Escala = "No";
                                        }
                                        // viewModel.Escalators = Escala;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isEscala2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isEscala2 = !isEscala2;
                                        print(newValue);
                                        if (newValue == true) {
                                          Escala2 = "Good";
                                        } else {
                                          Escala2 = "No";
                                        }
                                        // viewModel.Escalators = Escala2;
                                        // print(exHall2);
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isEscala3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isEscala3 = !isEscala3;
                                        print(newValue);
                                        if (newValue == true) {
                                          Escala3 = "Avg";
                                        } else {
                                          Escala3 = "No";
                                        }
                                        // viewModel.Escalators = Escala3;
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
                                    "Elevators (Lifts)",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: iselevators,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        iselevators = !iselevators;
                                        print(newValue);
                                        if (newValue == true) {
                                          elevators = "Excellent";
                                        } else {
                                          elevators = "No";
                                        }
                                        // viewModel.Elevators = elevators;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: iselevators2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        iselevators2 = !iselevators2;
                                        print(newValue);
                                        if (newValue == true) {
                                          elevators2 = "Good";
                                        } else {
                                          elevators2 = "No";
                                        }
                                        // print(exHall2);
                                        // viewModel.Elevators = elevators2;
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: iselevators3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        iselevators3 = !iselevators3;
                                        print(newValue);
                                        if (newValue == true) {
                                          elevators3 = "Avg";
                                        } else {
                                          elevators3 = "No";
                                        }

                                        // viewModel.Elevators = elevators3;
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
                                    // viewModel.Remarke = str;
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            width: 5,
                                            color: ThemeColors
                                                .textBoxOutlineBorder)),
                                    hintText: "Add Remarks",
                                    hintStyle: const TextStyle(
                                      color: ThemeColors.textBoxOutlineBorder,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(size.height * 0.01),
                              child: Text(
                                "(F). Museum Exhibits",
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
                                    "Quality of Exhibits",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: isqc_exhi,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isqc_exhi = !isqc_exhi;
                                        print(newValue);
                                        if (newValue == true) {
                                          qc_exhi = "Excellent";
                                        } else {
                                          qc_exhi = "No";
                                        }
                                        // viewModel.QualityExhibits = qc_exhi;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isqc_exhi2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isqc_exhi2 = !isqc_exhi2;
                                        print(newValue);
                                        if (newValue == true) {
                                          qc_exhi2 = "Good";
                                        } else {
                                          qc_exhi2 = "No";
                                        }
                                        // viewModel.QualityExhibits = qc_exhi2;
                                        // print(exHall2);
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isqc_exhi3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isqc_exhi3 = !isqc_exhi3;
                                        print(newValue);
                                        if (newValue == true) {
                                          qc_exhi3 = "Avg";
                                        } else {
                                          qc_exhi3 = "No";
                                        }
                                        // viewModel.QualityExhibits = qc_exhi3;
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
                                    "Interactive Equipment",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: isintr_actv_equ,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isintr_actv_equ = !isintr_actv_equ;
                                        print(newValue);
                                        if (newValue == true) {
                                          intr_actv_equ = "Excellent";
                                        } else {
                                          intr_actv_equ = "No";
                                        }
                                        // viewModel.InteractivEquep =
                                        //     intr_actv_equ;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isintr_actv_equ2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isintr_actv_equ2 = !isintr_actv_equ2;
                                        print(newValue);
                                        if (newValue == true) {
                                          intr_actv_equ2 = "Good";
                                        } else {
                                          intr_actv_equ2 = "No";
                                        }
                                        // viewModel.InteractivEquep =
                                        //     intr_actv_equ2;
                                        // print(exHall2);
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isintr_actv_equ3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isintr_actv_equ3 = !isintr_actv_equ3;
                                        print(newValue);
                                        if (newValue == true) {
                                          intr_actv_equ3 = "Avg";
                                        } else {
                                          intr_actv_equ3 = "No";
                                        }
                                        // viewModel.InteractivEquep =
                                        //     intr_actv_equ3;
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
                                    "Content of Exhibits",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: iscont_exhi,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        iscont_exhi = !iscont_exhi;
                                        print(newValue);
                                        if (newValue == true) {
                                          cont_exhi = "Excellent";
                                        } else {
                                          cont_exhi = "No";
                                        }
                                        // viewModel.ContentExhi = cont_exhi;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: iscont_exhi2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        iscont_exhi2 = !iscont_exhi2;
                                        print(newValue);
                                        if (newValue == true) {
                                          cont_exhi2 = "Good";
                                        } else {
                                          cont_exhi2 = "No";
                                        }
                                        // viewModel.ContentExhi = cont_exhi2;
                                        // print(exHall2);
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: iscont_exhi3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        iscont_exhi3 = !iscont_exhi3;
                                        print(newValue);
                                        if (newValue == true) {
                                          cont_exhi3 = "Avg";
                                        } else {
                                          cont_exhi3 = "No";
                                        }
                                        // viewModel.ContentExhi = cont_exhi3;
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
                                    // viewModel.remarkf = str;
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            width: 5,
                                            color: ThemeColors
                                                .textBoxOutlineBorder)),
                                    hintText: "Add Remarks",
                                    hintStyle: const TextStyle(
                                      color: ThemeColors.textBoxOutlineBorder,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(size.height * 0.01),
                              child: Text(
                                "(G). Projection Mapping Show",
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
                                  value: isseat_arrng,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isseat_arrng = !isseat_arrng;
                                        print(newValue);
                                        if (newValue == true) {
                                          seat_arrng = "Excellent";
                                        } else {
                                          seat_arrng = "No";
                                        }
                                        // viewModel.SeatingArrangements =
                                        //     seat_arrng;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isseat_arrng2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isseat_arrng2 = !isseat_arrng2;
                                        print(newValue);
                                        if (newValue == true) {
                                          seat_arrng2 = "Good";
                                        } else {
                                          seat_arrng2 = "No";
                                        }
                                        // viewModel.SeatingArrangements =
                                        //     seat_arrng2;
                                        // print(exHall2);
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isseat_arrng3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isseat_arrng3 = !isseat_arrng3;
                                        print(newValue);
                                        if (newValue == true) {
                                          seat_arrng3 = "Avg";
                                        } else {
                                          seat_arrng3 = "No";
                                        }
                                        // viewModel.SeatingArrangements =
                                        //     seat_arrng3;
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
                                    "Audio/Video Content",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: isav_content,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isav_content = !isav_content;
                                        print(newValue);
                                        if (newValue == true) {
                                          av_content = "Excellent";
                                        } else {
                                          av_content = "No";
                                        }
                                        // viewModel.AudioVideoContant =
                                        //     av_content;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isav_content2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isav_content2 = !isav_content2;
                                        print(newValue);
                                        if (newValue == true) {
                                          av_content2 = "Good";
                                        } else {
                                          av_content2 = "No";
                                        }
                                        // viewModel.AudioVideoContant =
                                        //     av_content2;
                                        // print(exHall2);
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isav_content3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isav_content3 = !isav_content3;
                                        print(newValue);
                                        if (newValue == true) {
                                          av_content3 = "Avg";
                                        } else {
                                          av_content3 = "No";
                                        }
                                        // viewModel.AudioVideoContant =
                                        //     av_content3;
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
                                    "Audio Quality",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: isaudi_qua,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isaudi_qua = !isaudi_qua;
                                        print(newValue);
                                        if (newValue == true) {
                                          audi_qua = "Excellent";
                                        } else {
                                          audi_qua = "No";
                                        }
                                        // viewModel.AudioQuality = audi_qua;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isaudi_qua2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isaudi_qua2 = !isaudi_qua2;
                                        print(newValue);
                                        if (newValue == true) {
                                          audi_qua2 = "Good";
                                        } else {
                                          audi_qua2 = "No";
                                        }
                                        // viewModel.AudioQuality = audi_qua2;
                                        // print(exHall2);
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isaudi_qua3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isaudi_qua3 = !isaudi_qua3;
                                        print(newValue);
                                        if (newValue == true) {
                                          audi_qua3 = "Avg";
                                        } else {
                                          audi_qua3 = "No";
                                        }
                                        // viewModel.AudioQuality = audi_qua3;
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
                                    "Video Quality",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: size.height * 0.3,
                                        color: Colors.black),
                                  ),
                                ),
                                Checkbox(
                                  value: isvid_qc,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isvid_qc = !isvid_qc;
                                        print(newValue);
                                        if (newValue == true) {
                                          vid_qc = "Excellent";
                                        } else {
                                          vid_qc = "No";
                                        }
                                        // viewModel.VideoQuality = vid_qc;
                                        // print(exHall);
                                      },
                                    );
                                  },
                                ),
                                const Text("Excellent"),
                                Checkbox(
                                  value: isvid_qc2,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isvid_qc2 = !isvid_qc2;
                                        print(newValue);
                                        if (newValue == true) {
                                          vid_qc2 = "Good";
                                        } else {
                                          vid_qc2 = "No";
                                        }
                                        // print(exHall2);
                                        // viewModel.VideoQuality = vid_qc2;
                                      },
                                    );
                                  },
                                ),
                                const Text("Good"),
                                Checkbox(
                                  value: isvid_qc3,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        isvid_qc3 = !isvid_qc3;
                                        print(newValue);
                                        if (newValue == true) {
                                          vid_qc3 = "Avg";
                                        } else {
                                          vid_qc3 = "No";
                                        }
                                        // viewModel.VideoQuality = vid_qc3;
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
                                    // viewModel.remarkg = str;
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            width: 5,
                                            color: ThemeColors
                                                .textBoxOutlineBorder)),
                                    hintText: "Add Remarks",
                                    hintStyle: const TextStyle(
                                      color: ThemeColors.textBoxOutlineBorder,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.all(size.height * 0.01),
                              child: CustomBtn(
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                                str: 'Next',
                                fontWeight: FontWeight.bold,
                                btnColor: ThemeColors.appDarkPrimaryColor,
                                btnPressed: () async {
                                  // final isFormC =
                                  // await viewModel.savefeedbackformD();
                                  // if (isFormC) {
                                  //   viewModel.redirectToPage(feedbackscreen4);
                                  // } else {
                                  //   print("Please Check Form Properly");
                                  // }
                                  // viewModel.redirectToPage(feedbackscreen4);
                                },
                                borderRadius: 10,
                                btnBorderColor:
                                    ThemeColors.textBoxOutlineBorder,
                                fontSize: 20,
                                // fontWeight: FontWeight.w300,
                                txtColor: ThemeColors.textBoxOutlineBorder,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
