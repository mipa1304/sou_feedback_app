// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, use_build_context_synchronously, unused_field, unused_local_variable, unused_import

import 'package:SOUFEEDBACKAPP/src/widgets/TextFieldWithPostFixIcon.dart';
import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedBackForm2/feedback_model.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmbtn.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/Localization/language/languages.dart';

class Feedback2 extends StatefulWidget {
  final a_exhihall;
  final a_lftloby;
  final a_vg;
  final a_exhi_walk;
  final b_exhall;
  final b_lftloby;
  final b_vg;
  final b_wash_tkt_count;
  final b_wash_room_Exhi_hall;
  final b_wash_vg;

  const Feedback2(
      {Key? key,
      this.a_exhihall,
      this.a_exhi_walk,
      this.a_lftloby,
      this.a_vg,
      this.b_exhall,
      this.b_lftloby,
      this.b_vg,
      this.b_wash_room_Exhi_hall,
      this.b_wash_tkt_count,
      this.b_wash_vg})
      : super(key: key);

  @override
  State<Feedback2> createState() => _Feedback2State();
}

class _Feedback2State extends State<Feedback2> {
  // (c)

  bool isBodyFri = false;
  String BodyFri = "No";

  bool isBodyFri2 = false;
  String BodyFri2 = "No";

  bool isBodyFri3 = false;
  String BodyFri3 = "No";

  bool isBagFri = false;
  String BagFri = "No";

  bool isBagFri2 = false;
  String BagFri2 = "No";

  bool isBagFri3 = false;
  String BagFri3 = "No";

  bool isbehavSeqFri = false;
  String behavSeqFri = "No";

  bool isbehavSeqFri2 = false;
  String behavSeqFri2 = "No";

  bool isbehavSeqFri3 = false;
  String behavSeqFri3 = "No";

  static const snackBar = SnackBar(
    content: Text('Your Valuable FeedBack Saved SuccessFully'),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider<Feedback2ViewModel>(
      create: (context) => locator<Feedback2ViewModel>(),
      child: ViewModelBuilder<Feedback2ViewModel>.reactive(
        viewModelBuilder: () => Feedback2ViewModel(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColors.bgColor,
              centerTitle: true,
              title: Text(
                Languages.of(context)!.feedbackformHeading,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            Languages.of(context)!.feedbackformHeading2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
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
                            // viewModel.grname = value,
                          },
                          hinText: 'Sr. No.',
                          postfixIconColor: Colors.white24,
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
                            // viewModel.grname = value,
                          },
                          hinText: Languages.of(context)!.yourname,
                          postfixIconColor: Colors.white24,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        TextFieldWithPostFixIcon(
                          postfixIconTap: () => {},
                          onTextChanged: (value) => {
                            // viewModel.grcity = value,
                          },
                          onvalidate: (value) {
                            if (value.isEmpty) {
                              return "Please enter Your City";
                            }
                            return null;
                          },
                          hinText: Languages.of(context)!.pleaseenterYourCity,
                          postfixIconColor: Colors.white24,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWithPostFixIcon(
                          postfixIconTap: () => {},
                          onTextChanged: (value) => {
                            // viewModel.grmobile = value,
                          },
                          onvalidate: (value) {
                            if (value.isEmpty) {
                              return "Please enter Your Mobile No.";
                            }
                            return null;
                          },
                          hinText: Languages.of(context)!.yourmobilenumber,
                          postfixIconColor: Colors.white24,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWithPostFixIcon(
                          postfixIconTap: () => {},
                          hinText: Languages.of(context)!.groupsize,
                          onTextChanged: (value) => {
                            // viewModel.grgroupsize = value,
                          },
                          onvalidate: (value) {
                            if (value.isEmpty) {
                              return "Please enter Your Group Size";
                            }
                            return null;
                          },
                          postfixIconColor: Colors.white24,
                        ),
                        // ,

                        //   Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: <Widget>[
                        //       Container(
                        //         alignment: Alignment.centerLeft,
                        //         margin: EdgeInsets.all(size.height * 0.01),
                        //         child: Text(
                        //           Languages.of(context)!
                        //               .gr_queue_management_guest_relationetc,
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.w900,
                        //               fontSize: 15,
                        //               color: Colors.black),
                        //         ),
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: <Widget>[
                        //           Container(
                        //             width: size.width * 0.34,
                        //             alignment: Alignment.centerLeft,
                        //             margin: EdgeInsets.all(size.height * 0.01),
                        //             child: Text(
                        //               Languages.of(context)!
                        //                   .gr_queue_management_at_friskingpoint,
                        //               textAlign: TextAlign.start,
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   // fontSize: size.height * 0.3,
                        //                   color: Colors.black),
                        //             ),
                        //           ),
                        //           Checkbox(
                        //             value: isqmgtfri,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isqmgtfri = !isqmgtfri;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     qmgtfri = "Excellent";
                        //                   } else {
                        //                     qmgtfri = "No";
                        //                   }

                        //                   viewModel.QueManagementFrishking =
                        //                       qmgtfri;

                        //                   // print(exHall);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(
                        //               Languages.of(context)!.feedbackReviewLabel),
                        //           Checkbox(
                        //             value: isqmgtfri2,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isqmgtfri2 = !isqmgtfri2;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     qmgtfri2 = "Good";
                        //                   } else {
                        //                     qmgtfri2 = "No";
                        //                   }
                        //                   viewModel.QueManagementFrishking =
                        //                       qmgtfri2;
                        //                   // print(exHall2);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel2),
                        //           Checkbox(
                        //             value: isqmgtfri3,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isqmgtfri3 = !isqmgtfri3;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     qmgtfri3 = "Avg";
                        //                   } else {
                        //                     qmgtfri3 = "No";
                        //                   }
                        //                   viewModel.QueManagementFrishking =
                        //                       qmgtfri3;
                        //                   // print(exHall3);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel3),
                        //         ],
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: <Widget>[
                        //           Container(
                        //             width: size.width * 0.34,
                        //             alignment: Alignment.centerLeft,
                        //             margin: EdgeInsets.all(size.height * 0.01),
                        //             child: Text(
                        //               Languages.of(context)!
                        //                   .gr_behaviour_of_staff_brown_dressed,
                        //               textAlign: TextAlign.start,
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   // fontSize: size.height * 0.3,
                        //                   color: Colors.black),
                        //             ),
                        //           ),
                        //           Checkbox(
                        //             value: isstaff_behav,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isstaff_behav = !isstaff_behav;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     staff_behav = "Excellent";
                        //                   } else {
                        //                     staff_behav = "No";
                        //                   }
                        //                   viewModel.BehaviourofStaffBrownDress =
                        //                       staff_behav;
                        //                   // print(exHall);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(
                        //               Languages.of(context)!.feedbackReviewLabel),
                        //           Checkbox(
                        //             value: isstaff_behav2,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isstaff_behav2 = !isstaff_behav2;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     staff_behav2 = "Good";
                        //                   } else {
                        //                     staff_behav2 = "No";
                        //                   }
                        //                   viewModel.BehaviourofStaffBrownDress =
                        //                       staff_behav2;
                        //                   // print(exHall2);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel2),
                        //           Checkbox(
                        //             value: isstaff_behav3,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isstaff_behav3 = !isstaff_behav3;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     staff_behav3 = "Avg";
                        //                   } else {
                        //                     staff_behav3 = "No";
                        //                   }
                        //                   viewModel.BehaviourofStaffBrownDress =
                        //                       staff_behav3;
                        //                   // print(exHall3);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel3),
                        //         ],
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: <Widget>[
                        //           Container(
                        //             width: size.width * 0.34,
                        //             alignment: Alignment.centerLeft,
                        //             margin: EdgeInsets.all(size.height * 0.01),
                        //             child: Text(
                        //               Languages.of(context)!
                        //                   .gr_queue_management_for_viewing_gallery,
                        //               textAlign: TextAlign.start,
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   // fontSize: size.height * 0.3,
                        //                   color: Colors.black),
                        //             ),
                        //           ),
                        //           Checkbox(
                        //             value: isqmgtVG,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isqmgtVG = !isqmgtVG;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     qmgtVG = "Excellent";
                        //                   } else {
                        //                     qmgtVG = "No";
                        //                   }
                        //                   viewModel.QueueManagementForVG = qmgtVG;
                        //                   // print(exHall);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(
                        //               Languages.of(context)!.feedbackReviewLabel),
                        //           Checkbox(
                        //             value: isqmgtVG2,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isqmgtVG2 = !isqmgtVG2;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     qmgtVG2 = "Good";
                        //                   } else {
                        //                     qmgtVG2 = "No";
                        //                   }
                        //                   viewModel.QueueManagementForVG =
                        //                       qmgtVG2;
                        //                   // print(exHall2);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel2),
                        //           Checkbox(
                        //             value: isqmgtVG3,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isqmgtVG3 = !isqmgtVG3;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     qmgtVG3 = "Avg";
                        //                   } else {
                        //                     qmgtVG3 = "No";
                        //                   }
                        //                   viewModel.QueueManagementForVG =
                        //                       qmgtVG3;
                        //                   // print(exHall3);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel3),
                        //         ],
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: <Widget>[
                        //           Container(
                        //             width: size.width * 0.34,
                        //             alignment: Alignment.centerLeft,
                        //             margin: EdgeInsets.all(size.height * 0.01),
                        //             child: Text(
                        //               Languages.of(context)!
                        //                   .gr_behavior_of_guest_relation_staff_black_white_dressed,
                        //               textAlign: TextAlign.start,
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   // fontSize: size.height * 0.3,
                        //                   color: Colors.black),
                        //             ),
                        //           ),
                        //           Checkbox(
                        //             value: isgr_staff_behav,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isgr_staff_behav = !isgr_staff_behav;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     gr_staff_behav = "Excellent";
                        //                   } else {
                        //                     gr_staff_behav = "No";
                        //                   }
                        //                   viewModel
                        //                           .BehaviourOfGRStaffBlackAndWhiteDress =
                        //                       gr_staff_behav;
                        //                   // print(exHall);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(
                        //               Languages.of(context)!.feedbackReviewLabel),
                        //           Checkbox(
                        //             value: isgr_staff_behav2,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isgr_staff_behav2 = !isgr_staff_behav2;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     gr_staff_behav2 = "Good";
                        //                   } else {
                        //                     gr_staff_behav2 = "No";
                        //                   }
                        //                   viewModel
                        //                           .BehaviourOfGRStaffBlackAndWhiteDress =
                        //                       gr_staff_behav2;
                        //                   // print(exHall2);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel2),
                        //           Checkbox(
                        //             value: isgr_staff_behav3,
                        //             onChanged: (newValue) {
                        //               setState(
                        //                 () {
                        //                   isgr_staff_behav3 = !isgr_staff_behav3;
                        //                   print(newValue);
                        //                   if (newValue == true) {
                        //                     gr_staff_behav3 = "Avg";
                        //                   } else {
                        //                     gr_staff_behav3 = "No";
                        //                   }
                        //                   viewModel
                        //                           .BehaviourOfGRStaffBlackAndWhiteDress =
                        //                       gr_staff_behav3;
                        //                   // print(exHall3);
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //           Text(Languages.of(context)!
                        //               .feedbackReviewLabel3),
                        //         ],
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(
                        //             left: size.height * 0.02,
                        //             right: size.height * 0.02),
                        //         child: TextField(
                        //             maxLines: 3,
                        //             onChanged: (String str) {
                        //               viewModel.RemarkD = str;
                        //             },
                        //             decoration: InputDecoration(
                        //               focusedBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(20.0),
                        //                 borderSide: BorderSide(
                        //                     width: 5,
                        //                     color: ThemeColors
                        //                         .textBoxOutlineBorderFocus),
                        //               ),
                        //               border: OutlineInputBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(20.0),
                        //                   borderSide: BorderSide(
                        //                       width: 5,
                        //                       color: ThemeColors
                        //                           .textBoxOutlineBorder)),
                        //               hintText:
                        //                   Languages.of(context)!.feedbackRemarks,
                        //               hintStyle: const TextStyle(
                        //                 color: ThemeColors.textBoxOutlineBorder,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 14,
                        //               ),
                        //             )),
                        //       ),
                        // ]),
                        //     Container(
                        //       margin: EdgeInsets.all(size.height * 0.01),
                        //       child: CustomBtn(
                        //         width: size.width * 0.8,
                        //         height: size.height * 0.05,
                        //         str: Languages.of(context)!.feedbackbtnlabel,
                        //         fontWeight: FontWeight.bold,
                        //         btnColor: ThemeColors.appDarkPrimaryColor,
                        //         btnPressed: () async {
                        //           final isFormB =
                        //               await viewModel.savefeedbackformB();
                        //           if (isFormB) {
                        //             ScaffoldMessenger.of(context)
                        //                 .showSnackBar(snackBar);
                        //             viewModel.redirectToPage(homescreen);
                        //           } else {
                        //             print("Please Check Form Properly");
                        //           }
                        //         },
                        //         borderRadius: 10,
                        //         btnBorderColor:
                        //             ThemeColors.textBoxOutlineBorder,
                        //         fontSize: 20,
                        //         // fontWeight: FontWeight.w300,
                        //         txtColor: ThemeColors.textBoxOutlineBorder,
                        //       ),
                        //     ),
                        // Container(
                        //   margin: EdgeInsets.all(size.height * 0.01),
                        //   child: CustomBtn(
                        //     width: size.width * 0.6,
                        //     height: size.height * 0.05,
                        //     str: Languages.of(context)!.labelChangeLanguage,
                        //     fontWeight: FontWeight.bold,
                        //     btnColor: ThemeColors.appDarkPrimaryColor,
                        //     btnPressed: () {
                        //       viewModel
                        //           .redirectToPage(changelanguagescreen);
                        //     },
                        //     borderRadius: 10,
                        //     btnBorderColor:
                        //         ThemeColors.textBoxOutlineBorder,
                        //     fontSize: 20,
                        //     // fontWeight: FontWeight.w300,
                        //     txtColor: ThemeColors.textBoxOutlineBorder,
                        //   ),
                        // ),
                        //   ],
                        // )
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
