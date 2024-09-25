// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, avoid_print, non_constant_identifier_names, unused_field, use_build_context_synchronously, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, unused_element, unnecessary_brace_in_string_interps

// import 'package:SOUFEEDBACKAPP/src/models/sr_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';
import 'package:SOUFEEDBACKAPP/src/screens/FeedbackForm/feedback_form_model.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmbtn.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/TextFieldWithPostFixIcon.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';
import 'package:SOUFEEDBACKAPP/src/widgets/Cstmchkbtn.dart';
import 'package:SOUFEEDBACKAPP/Localization/language/languages.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  // (A)

  bool isExHall = false;
  String exHall = "No";

  bool isExHall2 = false;
  String exHall2 = "No";

  bool isExHall3 = false;
  String exHall3 = "No";

  bool isLftLoby = false;
  String LftLoby = "No";

  bool isLftLoby2 = false;
  String LftLoby2 = "No";

  bool isLftLoby3 = false;
  String LftLoby3 = "No";

  bool isVG = false;
  String VG = "No";

  bool isVG2 = false;
  String VG2 = "No";

  bool isVG3 = false;
  String VG3 = "No";

  bool isEw = false;
  String Ew = "No";

  bool isEw2 = false;
  String Ew2 = "No";

  bool isEw3 = false;
  String Ew3 = "No";

  final TextEditingController _feedbackA = TextEditingController();

  // (B)

  bool ishkex = false;
  String hkex = "No";

  bool ishkex2 = false;
  String hkex2 = "No";

  bool ishkex3 = false;
  String hkex3 = "No";

  bool ishkLftLoby = false;
  String hkLftLoby = "No";

  bool ishkLftLoby2 = false;
  String hkLftLoby2 = "No";

  bool ishkLftLoby3 = false;
  String hkLftLoby3 = "No";

  bool ishkVG = false;
  String hkVG = "No";

  bool ishkVG2 = false;
  String hkVG2 = "No";

  bool ishkVG3 = false;
  String hkVG3 = "No";

  bool iswtc = false;
  String wtc = "No";

  bool iswtc2 = false;
  String wtc2 = "No";

  bool iswtc3 = false;
  String wtc3 = "No";

  bool iswhkex = false;
  String whkex = "No";

  bool iswhkex2 = false;
  String whkex2 = "No";

  bool iswhkex3 = false;
  String whkex3 = "No";

  bool iswhkvg = false;
  String whkvg = "No";

  bool iswhkvg2 = false;
  String whkvg2 = "No";

  bool iswhkvg3 = false;
  String whkvg3 = "No";

  // (C)

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

  // (D)

  bool isqmgtfri = false;
  String qmgtfri = "No";

  bool isqmgtfri2 = false;
  String qmgtfri2 = "No";

  bool isqmgtfri3 = false;
  String qmgtfri3 = "No";

  bool isstaff_behav = false;
  String staff_behav = "No";

  bool isstaff_behav2 = false;
  String staff_behav2 = "No";

  bool isstaff_behav3 = false;
  String staff_behav3 = "No";

  bool isqmgtVG = false;
  String qmgtVG = "No";

  bool isqmgtVG2 = false;
  String qmgtVG2 = "No";

  bool isqmgtVG3 = false;
  String qmgtVG3 = "No";

  bool isgr_staff_behav = false;
  String gr_staff_behav = "No";

  bool isgr_staff_behav2 = false;
  String gr_staff_behav2 = "No";

  bool isgr_staff_behav3 = false;
  String gr_staff_behav3 = "No";

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

  // (H)

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

  int sr_no = 0;

  final TextEditingController _feedbackB = TextEditingController();

  static const snackBar = SnackBar(
    content: Text('Your Valuable FeedBack Saved SuccessFully'),
  );

  // List<Srno>? _srno;

  bool isData = false;

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.sizeOf(context);

    return ChangeNotifierProvider<FeedbackFormViewModel>(
      create: (context) => locator<FeedbackFormViewModel>(),
      child: ViewModelBuilder<FeedbackFormViewModel>.reactive(
          viewModelBuilder: () => FeedbackFormViewModel(context),
          builder: ((context, viewModel, child) {
            viewModel.getSrno();

            // srno = viewModel.srno[index].srno;

            return Scaffold(
              appBar: AppBar(
                // foregroundColor: Color.fromARGB(0, 0, 0, 0),
                // backgroundColor: Color.fromARGB(0, 0, 0, 0),
                // elevation: 0.0,
                // shadowColor: Color.fromARGB(0, 0, 0, 0),
                backgroundColor: ThemeColors.bgColor,

                actions: [
                  Container(
                    color: Color.fromARGB(0, 0, 0, 0),
                    width: size.width * 0.999,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Image.asset('assets/img/L&T Logo.png')),
                        Container(
                            alignment: Alignment.center,
                            child:
                                Image.asset('assets/img/Statue Of Unity.png')),
                        Container(
                            child: Image.asset(
                          'assets/img/UDS.png',
                        ))
                      ],
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
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
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.01),
                              child: Text(
                                Languages.of(context)!.feedbackformHeading,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.01),
                              child: Text(
                                Languages.of(context)!.feedbackformHeading2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: size.height * 0.09,
                                  ),
                                  child: Text(
                                    "Sr.No.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: size.height * 0.09,
                                  ),
                                  child: SizedBox(
                                      height: 25,
                                      width: 40,
                                      child: ListView.builder(
                                          itemCount: viewModel.srno.length,
                                          itemBuilder: (context, index) {
                                            sr_no = int.parse(
                                                viewModel.srno[index].srno);

                                            return Text(
                                              viewModel.srno[index].srno
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ThemeColors
                                                    .textBoxOutlineBorder,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            );
                                          })),
                                ),
                              ],
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
                                viewModel.your_name = value,
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
                                viewModel.your_city = value,
                              },
                              onvalidate: (value) {
                                if (value.isEmpty) {
                                  return "Please enter Your City";
                                }
                                return null;
                              },
                              hinText:
                                  Languages.of(context)!.pleaseenterYourCity,
                              postfixIconColor: Colors.white24,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFieldWithPostFixIcon(
                              postfixIconTap: () => {},
                              onTextChanged: (value) => {
                                viewModel.Your_mobile = value,
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
                                viewModel.group_size = value,
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
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(size.height * 0.01),
                                  child: Text(
                                    Languages.of(context)!
                                        .a_ambiance_general_lights,
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
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!.exhibition_hall,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isExHall,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isExHall = !isExHall;
                                            print(newValue);
                                            if (newValue == true) {
                                              exHall = "Excellent";
                                            } else {
                                              exHall = "No";
                                            }
                                            viewModel.exhibition_Hall = exHall;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isExHall2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isExHall2 = !isExHall2;
                                            print(newValue);
                                            if (newValue == true) {
                                              exHall2 = "Good";
                                            } else {
                                              exHall2 = "No";
                                            }
                                            print(exHall2);
                                            viewModel.exhibition_Hall = exHall2;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isExHall3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isExHall3 = !isExHall3;
                                            print(newValue);
                                            if (newValue == true) {
                                              exHall3 = "Avg";
                                            } else {
                                              exHall3 = "No";
                                            }
                                            print(exHall3);
                                            viewModel.exhibition_Hall = exHall3;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!.lift_loby,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isLftLoby,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isLftLoby = !isLftLoby;
                                            print(newValue);
                                            if (newValue == true) {
                                              LftLoby = "Excellent";
                                            } else {
                                              LftLoby = "No";
                                            }
                                            // print(exHall);

                                            viewModel.lift_lobi = LftLoby;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isLftLoby2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isLftLoby2 = !isLftLoby2;
                                            print(newValue);
                                            if (newValue == true) {
                                              LftLoby2 = "Good";
                                            } else {
                                              LftLoby2 = "No";
                                            }
                                            print(LftLoby2);
                                            viewModel.lift_lobi = LftLoby2;
                                          },
                                        );
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: isLftLoby3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isLftLoby3 = !isLftLoby3;
                                            print(newValue);
                                            if (newValue == true) {
                                              LftLoby3 = "Avg";
                                            } else {
                                              LftLoby3 = "No";
                                            }
                                            viewModel.lift_lobi = LftLoby3;
                                            print(exHall3);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!.viewing_gallery,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isVG,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isVG = !isVG;
                                            print(newValue);
                                            if (newValue == true) {
                                              VG = "Excellent";
                                            } else {
                                              VG = "No";
                                            }
                                            viewModel.viewing_gallery = VG;
                                            print(isVG);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isVG2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isVG2 = !isVG2;
                                            print(newValue);
                                            if (newValue == true) {
                                              VG2 = "Good";
                                            } else {
                                              VG2 = "No";
                                            }
                                            print(LftLoby2);
                                            viewModel.viewing_gallery = VG2;
                                          },
                                        );
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: isVG3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isVG3 = !isVG3;
                                            print(newValue);
                                            if (newValue == true) {
                                              VG3 = "Avg";
                                            } else {
                                              VG3 = "No";
                                            }
                                            viewModel.viewing_gallery = VG3;
                                            print(exHall3);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .external_walkways,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isEw,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isEw = !isEw;
                                            print(newValue);
                                            if (newValue == true) {
                                              Ew = "Excellent";
                                            } else {
                                              Ew = "No";
                                            }
                                            print(isVG);
                                            viewModel.external_walkways = Ew;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isEw2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isEw2 = !isEw2;
                                            print(newValue);
                                            if (newValue == true) {
                                              Ew2 = "Good";
                                            } else {
                                              Ew2 = "No";
                                            }
                                            print(LftLoby2);
                                            viewModel.external_walkways = Ew2;
                                          },
                                        );
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: isEw3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isEw3 = !isEw3;
                                            print(newValue);
                                            if (newValue == true) {
                                              Ew3 = "Avg";
                                            } else {
                                              Ew3 = "No";
                                            }
                                            print(exHall3);
                                            viewModel.external_walkways = Ew3;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.height * 0.02,
                                      right: size.height * 0.02),
                                  child: TextField(
                                      maxLines: 3,
                                      onChanged: (String str) =>
                                          {viewModel.remark = str},
                                      controller: _feedbackA,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.mic_sharp)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                        hintText: Languages.of(context)!
                                            .feedbackRemarks,
                                        hintStyle: const TextStyle(
                                          color:
                                              ThemeColors.textBoxOutlineBorder,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(size.height * 0.01),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    Languages.of(context)!.feedbackdept,
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
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .feedbackloacation,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: ishkex,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkex = !ishkex;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkex = "Excellent";
                                            } else {
                                              hkex = "No";
                                            }

                                            viewModel.exhibition_Hall_b = hkex;
                                            print(exHall);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: ishkex2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkex2 = !ishkex2;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkex2 = "Good";
                                            } else {
                                              hkex2 = "No";
                                            }
                                            print(exHall2);
                                            viewModel.exhibition_Hall_b = hkex2;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: ishkex3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkex3 = !ishkex3;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkex3 = "Avg";
                                            } else {
                                              hkex3 = "No";
                                            }
                                            print(exHall3);
                                            viewModel.exhibition_Hall_b = hkex3;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .feedbackloacation2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: ishkLftLoby,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkLftLoby = !ishkLftLoby;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkLftLoby = "Excellent";
                                            } else {
                                              hkLftLoby = "No";
                                            }
                                            print(exHall);
                                            viewModel.lift_lobi_b = hkLftLoby;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: ishkLftLoby2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkLftLoby2 = !ishkLftLoby2;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkLftLoby2 = "Good";
                                            } else {
                                              hkLftLoby2 = "No";
                                            }
                                            print(LftLoby2);
                                            viewModel.lift_lobi_b = hkLftLoby2;
                                          },
                                        );
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: ishkLftLoby3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkLftLoby3 = !ishkLftLoby3;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkLftLoby3 = "Avg";
                                            } else {
                                              hkLftLoby3 = "No";
                                            }
                                            viewModel.lift_lobi_b = hkLftLoby3;
                                            print(exHall3);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .feedbackloacation3,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: ishkVG,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkVG = !ishkVG;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkVG = "Excellent";
                                            } else {
                                              hkVG = "No";
                                            }
                                            print(isVG);
                                          },
                                        );
                                        viewModel.viewing_gallery_b = hkVG;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: ishkVG2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkVG2 = !ishkVG2;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkVG2 = "Good";
                                            } else {
                                              hkVG2 = "No";
                                            }
                                            print(LftLoby2);
                                            viewModel.viewing_gallery_b = hkVG2;
                                          },
                                        );
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: ishkVG3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ishkVG3 = !ishkVG3;
                                            print(newValue);
                                            if (newValue == true) {
                                              hkVG3 = "Avg";
                                            } else {
                                              hkVG3 = "No";
                                            }
                                            print(exHall3);
                                          },
                                        );
                                        viewModel.viewing_gallery_b = hkVG3;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .feedbackloacation4,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: iswtc,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswtc = !iswtc;
                                            print(newValue);
                                            if (newValue == true) {
                                              wtc = "Excellent";
                                            } else {
                                              wtc = "No";
                                            }
                                            print(isVG);
                                          },
                                        );
                                        viewModel.washroom_at_ticket_counter =
                                            wtc;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: iswtc2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswtc2 = !iswtc2;
                                            print(newValue);
                                            if (newValue == true) {
                                              wtc2 = "Good";
                                            } else {
                                              wtc2 = "No";
                                            }
                                            print(LftLoby2);
                                          },
                                        );
                                        viewModel.washroom_at_ticket_counter =
                                            wtc2;
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: iswtc3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswtc3 = !iswtc3;
                                            print(newValue);
                                            if (newValue == true) {
                                              wtc3 = "Avg";
                                            } else {
                                              wtc3 = "No";
                                            }
                                            print(exHall3);
                                          },
                                        );
                                        viewModel.washroom_at_ticket_counter =
                                            wtc3;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .feedbackloacation5,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: iswhkex,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswhkex = !iswhkex;
                                            print(newValue);
                                            if (newValue == true) {
                                              whkex = "Excellent";
                                            } else {
                                              whkex = "No";
                                            }
                                            print(isVG);
                                          },
                                        );
                                        viewModel.washroom_at_exhibition_hall =
                                            whkex;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: iswhkex2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswhkex2 = !iswhkex2;
                                            print(newValue);
                                            if (newValue == true) {
                                              whkex2 = "Good";
                                            } else {
                                              whkex2 = "No";
                                            }
                                            print(LftLoby2);
                                          },
                                        );
                                        viewModel.washroom_at_exhibition_hall =
                                            whkex2;
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: iswhkex3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswhkex3 = !iswhkex3;
                                            print(newValue);
                                            if (newValue == true) {
                                              whkex3 = "Avg";
                                            } else {
                                              whkex3 = "No";
                                            }
                                            print(exHall3);
                                          },
                                        );
                                        viewModel.washroom_at_exhibition_hall =
                                            whkex3;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width * 0.30,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .feedbackloacation6,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.2,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: iswhkvg,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswhkvg = !iswhkvg;
                                            print(newValue);
                                            if (newValue == true) {
                                              whkvg = "Excellent";
                                            } else {
                                              whkvg = "No";
                                            }
                                            print(isVG);
                                          },
                                        );
                                        viewModel.washroom_at_vg = whkvg;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: iswhkvg2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswhkvg2 = !iswhkvg2;
                                            print(newValue);
                                            if (newValue == true) {
                                              whkvg2 = "Good";
                                            } else {
                                              whkvg2 = "No";
                                            }
                                            print(LftLoby2);
                                          },
                                        );
                                        viewModel.washroom_at_vg = whkvg2;
                                      },
                                    ),
                                    FittedBox(
                                        child: Text(Languages.of(context)!
                                            .feedbackReviewLabel2)),
                                    Checkbox(
                                      value: iswhkvg3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            iswhkvg3 = !iswhkvg3;
                                            print(newValue);
                                            if (newValue == true) {
                                              whkvg3 = "Avg";
                                            } else {
                                              whkvg3 = "No";
                                            }
                                          },
                                        );
                                        viewModel.washroom_at_vg = whkvg3;
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.height * 0.02,
                                      right: size.height * 0.02),
                                  child: TextField(
                                      onChanged: (String str) =>
                                          {viewModel.remark_b = str},
                                      maxLines: 3,
                                      controller: _feedbackB,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.mic_sharp)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                        hintText: Languages.of(context)!
                                            .feedbackRemarks,
                                        hintStyle: const TextStyle(
                                          color:
                                              ThemeColors.textBoxOutlineBorder,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(size.height * 0.01),
                                  child: Text(
                                    Languages.of(context)!
                                        .c_security_checking_confiscating_gutka_pan_smoking_material_alcoholic_beverages_etc,
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
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!.body_frisking,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isBodyFri,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isBodyFri = !isBodyFri;
                                            print(newValue);
                                            if (newValue == true) {
                                              BodyFri = "Excellent";
                                            } else {
                                              BodyFri = "No";
                                            }
                                            viewModel.body_frisking = BodyFri;
                                            print(BodyFri);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isBodyFri2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isBodyFri2 = !isBodyFri2;
                                            print(newValue);
                                            if (newValue == true) {
                                              BodyFri2 = "Good";
                                            } else {
                                              BodyFri2 = "No";
                                            }
                                            print(BodyFri);
                                            viewModel.body_frisking = BodyFri2;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isBodyFri3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isBodyFri3 = !isBodyFri3;
                                            print(newValue);
                                            if (newValue == true) {
                                              BodyFri3 = "Avg";
                                            } else {
                                              BodyFri3 = "No";
                                            }
                                            print(BodyFri3);
                                            viewModel.body_frisking = BodyFri3;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!.bag_frisking,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isBagFri,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isBagFri = !isBagFri;
                                            print(newValue);
                                            if (newValue == true) {
                                              BagFri = "Excellent";
                                            } else {
                                              BagFri = "No";
                                            }
                                            print(BagFri);
                                            viewModel.bag_frisking = BagFri;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isBagFri2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isBagFri2 = !isBagFri2;
                                            print(newValue);
                                            if (newValue == true) {
                                              BagFri2 = "Good";
                                            } else {
                                              BagFri2 = "No";
                                            }
                                            print(BodyFri);
                                            viewModel.bag_frisking = BagFri2;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isBagFri3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isBagFri3 = !isBagFri3;
                                            print(newValue);
                                            if (newValue == true) {
                                              BagFri3 = "Avg";
                                            } else {
                                              BagFri3 = "No";
                                            }
                                            print(BodyFri3);
                                            viewModel.bag_frisking = BagFri3;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .behavior_of_security_staff,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isbehavSeqFri,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isbehavSeqFri = !isbehavSeqFri;
                                            print(newValue);
                                            if (newValue == true) {
                                              behavSeqFri = "Excellent";
                                            } else {
                                              behavSeqFri = "No";
                                            }
                                            print(BagFri);
                                            viewModel
                                                    .behaviour_of_security_staff =
                                                behavSeqFri;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isbehavSeqFri2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isbehavSeqFri2 = !isbehavSeqFri2;
                                            print(newValue);
                                            if (newValue == true) {
                                              behavSeqFri2 = "Good";
                                            } else {
                                              behavSeqFri2 = "No";
                                            }
                                            print(BodyFri);
                                            viewModel
                                                    .behaviour_of_security_staff =
                                                behavSeqFri2;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isbehavSeqFri3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isbehavSeqFri3 = !isbehavSeqFri3;
                                            print(newValue);
                                            if (newValue == true) {
                                              behavSeqFri3 = "Avg";
                                            } else {
                                              behavSeqFri3 = "No";
                                            }
                                            print(BodyFri3);
                                            viewModel
                                                    .behaviour_of_security_staff =
                                                behavSeqFri3;
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.height * 0.02,
                                      right: size.height * 0.02),
                                  child: TextField(
                                      maxLines: 3,
                                      onChanged: (String str) {
                                        viewModel.remark_c = str;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.mic_sharp)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                        hintText: Languages.of(context)!
                                            .feedbackRemarks,
                                        hintStyle: const TextStyle(
                                          color:
                                              ThemeColors.textBoxOutlineBorder,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.all(size.height * 0.01),
                                  child: Text(
                                    Languages.of(context)!
                                        .gr_queue_management_guest_relationetc,
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
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .gr_queue_management_at_friskingpoint,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isqmgtfri,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isqmgtfri = !isqmgtfri;
                                            print(newValue);
                                            if (newValue == true) {
                                              qmgtfri = "Excellent";
                                            } else {
                                              qmgtfri = "No";
                                            }

                                            viewModel
                                                    .que_manag_at_frisking_point =
                                                qmgtfri;

                                            // print(exHall);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isqmgtfri2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isqmgtfri2 = !isqmgtfri2;
                                            print(newValue);
                                            if (newValue == true) {
                                              qmgtfri2 = "Good";
                                            } else {
                                              qmgtfri2 = "No";
                                            }
                                            viewModel
                                                    .que_manag_at_frisking_point =
                                                qmgtfri2;
                                            // print(exHall2);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isqmgtfri3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isqmgtfri3 = !isqmgtfri3;
                                            print(newValue);
                                            if (newValue == true) {
                                              qmgtfri3 = "Avg";
                                            } else {
                                              qmgtfri3 = "No";
                                            }
                                            viewModel
                                                    .que_manag_at_frisking_point =
                                                qmgtfri3;
                                            // print(exHall3);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .gr_behaviour_of_staff_brown_dressed,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isstaff_behav,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isstaff_behav = !isstaff_behav;
                                            print(newValue);
                                            if (newValue == true) {
                                              staff_behav = "Excellent";
                                            } else {
                                              staff_behav = "No";
                                            }
                                            viewModel.behaviour_of_staff =
                                                staff_behav;
                                            // print(exHall);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isstaff_behav2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isstaff_behav2 = !isstaff_behav2;
                                            print(newValue);
                                            if (newValue == true) {
                                              staff_behav2 = "Good";
                                            } else {
                                              staff_behav2 = "No";
                                            }
                                            viewModel.behaviour_of_staff =
                                                staff_behav2;
                                            // print(exHall2);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isstaff_behav3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isstaff_behav3 = !isstaff_behav3;
                                            print(newValue);
                                            if (newValue == true) {
                                              staff_behav3 = "Avg";
                                            } else {
                                              staff_behav3 = "No";
                                            }
                                            viewModel.behaviour_of_staff =
                                                staff_behav3;
                                            // print(exHall3);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .gr_queue_management_for_viewing_gallery,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isqmgtVG,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isqmgtVG = !isqmgtVG;
                                            print(newValue);
                                            if (newValue == true) {
                                              qmgtVG = "Excellent";
                                            } else {
                                              qmgtVG = "No";
                                            }
                                            viewModel.que_manage_vg = qmgtVG;
                                            // print(exHall);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isqmgtVG2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isqmgtVG2 = !isqmgtVG2;
                                            print(newValue);
                                            if (newValue == true) {
                                              qmgtVG2 = "Good";
                                            } else {
                                              qmgtVG2 = "No";
                                            }
                                            viewModel.que_manage_vg = qmgtVG2;
                                            // print(exHall2);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isqmgtVG3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isqmgtVG3 = !isqmgtVG3;
                                            print(newValue);
                                            if (newValue == true) {
                                              qmgtVG3 = "Avg";
                                            } else {
                                              qmgtVG3 = "No";
                                            }
                                            viewModel.que_manage_vg = qmgtVG3;
                                            // print(exHall3);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.30,
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .gr_behavior_of_guest_relation_staff_black_white_dressed,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: size.height * 0.3,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Checkbox(
                                      value: isgr_staff_behav,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isgr_staff_behav =
                                                !isgr_staff_behav;
                                            print(newValue);
                                            if (newValue == true) {
                                              gr_staff_behav = "Excellent";
                                            } else {
                                              gr_staff_behav = "No";
                                            }
                                            viewModel
                                                    .behaviour_of_gr_staff_black_white =
                                                gr_staff_behav;
                                            // print(exHall);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel),
                                    Checkbox(
                                      value: isgr_staff_behav2,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isgr_staff_behav2 =
                                                !isgr_staff_behav2;
                                            print(newValue);
                                            if (newValue == true) {
                                              gr_staff_behav2 = "Good";
                                            } else {
                                              gr_staff_behav2 = "No";
                                            }
                                            viewModel
                                                    .behaviour_of_gr_staff_black_white =
                                                gr_staff_behav2;
                                            // print(exHall2);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel2),
                                    Checkbox(
                                      value: isgr_staff_behav3,
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            isgr_staff_behav3 =
                                                !isgr_staff_behav3;
                                            print(newValue);
                                            if (newValue == true) {
                                              gr_staff_behav3 = "Avg";
                                            } else {
                                              gr_staff_behav3 = "No";
                                            }
                                            viewModel
                                                    .behaviour_of_gr_staff_black_white =
                                                gr_staff_behav3;
                                            // print(exHall3);
                                          },
                                        );
                                      },
                                    ),
                                    Text(Languages.of(context)!
                                        .feedbackReviewLabel3),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.height * 0.02,
                                      right: size.height * 0.02),
                                  child: TextField(
                                      maxLines: 3,
                                      onChanged: (String str) {
                                        viewModel.remark_d = str;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.mic_sharp)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                        hintText: Languages.of(context)!
                                            .feedbackRemarks,
                                        hintStyle: const TextStyle(
                                          color:
                                              ThemeColors.textBoxOutlineBorder,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!.facility,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .facility_travelators_on_the_bridge,
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
                                                isTrave_Bridge =
                                                    !isTrave_Bridge;
                                                print(newValue);
                                                if (newValue == true) {
                                                  Trave_Bridge = "Excellent";
                                                } else {
                                                  Trave_Bridge = "No";
                                                }
                                                viewModel
                                                        .travelators_on_bridge =
                                                    Trave_Bridge;
                                                print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
                                        Checkbox(
                                          value: isTrave_Bridge2,
                                          onChanged: (newValue) {
                                            setState(
                                              () {
                                                isTrave_Bridge2 =
                                                    !isTrave_Bridge2;
                                                print(newValue);
                                                if (newValue == true) {
                                                  Trave_Bridge2 = "Good";
                                                } else {
                                                  Trave_Bridge2 = "No";
                                                }
                                                // print(exHall2);
                                                viewModel
                                                        .travelators_on_bridge =
                                                    Trave_Bridge2;
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
                                        Checkbox(
                                          value: isTrave_Bridge3,
                                          onChanged: (newValue) {
                                            setState(
                                              () {
                                                isTrave_Bridge3 =
                                                    !isTrave_Bridge3;
                                                print(newValue);
                                                if (newValue == true) {
                                                  Trave_Bridge3 = "Avg";
                                                } else {
                                                  Trave_Bridge3 = "No";
                                                }
                                                // print(exHall3);
                                                viewModel
                                                        .travelators_on_bridge =
                                                    Trave_Bridge3;
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!.escalators,
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
                                                viewModel.escalators = Escala;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.escalators = Escala2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel.escalators = Escala3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .elevators_Lifts,
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
                                                viewModel.escalators =
                                                    elevators;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.escalators =
                                                    elevators2;
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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

                                                viewModel.escalators =
                                                    elevators3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: size.height * 0.02,
                                          right: size.height * 0.02),
                                      child: TextField(
                                          maxLines: 3,
                                          onChanged: (String str) {
                                            viewModel.remark_e = str;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.mic_sharp)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
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
                                            hintText: Languages.of(context)!
                                                .feedbackRemarks,
                                            hintStyle: const TextStyle(
                                              color: ThemeColors
                                                  .textBoxOutlineBorder,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .f_museum_exhibits,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .quality_of_exhibits,
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
                                                viewModel.qc_exhibits = qc_exhi;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.qc_exhibits =
                                                    qc_exhi2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel.qc_exhibits =
                                                    qc_exhi3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .interactive_equipment,
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
                                                isintr_actv_equ =
                                                    !isintr_actv_equ;
                                                print(newValue);
                                                if (newValue == true) {
                                                  intr_actv_equ = "Excellent";
                                                } else {
                                                  intr_actv_equ = "No";
                                                }
                                                viewModel.intrective_equip =
                                                    intr_actv_equ;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
                                        Checkbox(
                                          value: isintr_actv_equ2,
                                          onChanged: (newValue) {
                                            setState(
                                              () {
                                                isintr_actv_equ2 =
                                                    !isintr_actv_equ2;
                                                print(newValue);
                                                if (newValue == true) {
                                                  intr_actv_equ2 = "Good";
                                                } else {
                                                  intr_actv_equ2 = "No";
                                                }
                                                viewModel.intrective_equip =
                                                    intr_actv_equ2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
                                        Checkbox(
                                          value: isintr_actv_equ3,
                                          onChanged: (newValue) {
                                            setState(
                                              () {
                                                isintr_actv_equ3 =
                                                    !isintr_actv_equ3;
                                                print(newValue);
                                                if (newValue == true) {
                                                  intr_actv_equ3 = "Avg";
                                                } else {
                                                  intr_actv_equ3 = "No";
                                                }
                                                viewModel.intrective_equip =
                                                    intr_actv_equ3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .content_of_Exhibits,
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
                                                viewModel.content_exhibits =
                                                    cont_exhi;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.content_exhibits =
                                                    cont_exhi2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel.content_exhibits =
                                                    cont_exhi3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: size.height * 0.02,
                                          right: size.height * 0.02),
                                      child: TextField(
                                          maxLines: 3,
                                          onChanged: (String str) {
                                            viewModel.remark_f = str;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.mic_sharp)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
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
                                            hintText: Languages.of(context)!
                                                .feedbackRemarks,
                                            hintStyle: const TextStyle(
                                              color: ThemeColors
                                                  .textBoxOutlineBorder,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!
                                            .g_projection_mapping_show,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .Seating_arrangements,
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
                                                viewModel.seating_arrangements =
                                                    seat_arrng;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.seating_arrangements =
                                                    seat_arrng2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel.seating_arrangements =
                                                    seat_arrng3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .audio_video_content,
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
                                                viewModel.avcontant =
                                                    av_content;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.avcontant =
                                                    av_content2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel.avcontant =
                                                    av_content3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .audio_quality,
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
                                                viewModel.audio_qc = audi_qua;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.audio_qc = audi_qua2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel.audio_qc = audi_qua3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .video_quality,
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
                                                viewModel.video_qc = vid_qc;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel.video_qc = vid_qc2;
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel.video_qc = vid_qc3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: size.height * 0.02,
                                          right: size.height * 0.02),
                                      child: TextField(
                                          maxLines: 3,
                                          onChanged: (String str) {
                                            viewModel.remark_g = str;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.mic_sharp)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
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
                                            hintText: Languages.of(context)!
                                                .feedbackRemarks,
                                            hintStyle: const TextStyle(
                                              color: ThemeColors
                                                  .textBoxOutlineBorder,
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
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.all(size.height * 0.01),
                                      child: Text(
                                        Languages.of(context)!.h_Cafeteria,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .seating_arrangements_cafe,
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
                                                viewModel
                                                        .seating_arrangements_h =
                                                    seat_arreng;
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
                                        Checkbox(
                                          value: isseat_arreng2,
                                          onChanged: (newValue) {
                                            setState(
                                              () {
                                                isseat_arreng2 =
                                                    !isseat_arreng2;
                                                print(newValue);
                                                if (newValue == true) {
                                                  seat_arreng2 = "Good";
                                                } else {
                                                  seat_arreng2 = "No";
                                                }
                                                viewModel
                                                        .seating_arrangements_h =
                                                    seat_arreng2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
                                        Checkbox(
                                          value: isseat_arreng3,
                                          onChanged: (newValue) {
                                            setState(
                                              () {
                                                isseat_arreng3 =
                                                    !isseat_arreng3;
                                                print(newValue);
                                                if (newValue == true) {
                                                  seat_arreng3 = "Avg";
                                                } else {
                                                  seat_arreng3 = "No";
                                                }
                                                viewModel
                                                        .seating_arrangements_h =
                                                    seat_arreng3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .cleanliness_of_seating_area,
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
                                                  cleaning_Seat_Area =
                                                      "Excellent";
                                                } else {
                                                  cleaning_Seat_Area = "No";
                                                }
                                                viewModel
                                                        .cleanliness_of_seatarea =
                                                    cleaning_Seat_Area;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel
                                                        .cleanliness_of_seatarea =
                                                    cleaning_Seat_Area2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel
                                                        .cleanliness_of_seatarea =
                                                    cleaning_Seat_Area3;
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.30,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.all(
                                              size.height * 0.01),
                                          child: Text(
                                            Languages.of(context)!
                                                .washroom_cleanliness,
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
                                                viewModel
                                                        .washroom_cleanliness_h =
                                                    Wash_clean;
                                                // print(exHall);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel),
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
                                                viewModel
                                                        .washroom_cleanliness_h =
                                                    Wash_clean2;
                                                // print(exHall2);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel2),
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
                                                viewModel
                                                        .washroom_cleanliness_h =
                                                    Wash_clean3;
                                                // print(exHall3);
                                              },
                                            );
                                          },
                                        ),
                                        Text(Languages.of(context)!
                                            .feedbackReviewLabel3),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: size.height * 0.02,
                                          right: size.height * 0.02),
                                      child: TextField(
                                          maxLines: 3,
                                          onChanged: (String str) {
                                            viewModel.remark_h = str;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.mic_sharp)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
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
                                            hintText: Languages.of(context)!
                                                .feedbackRemarks,
                                            hintStyle: const TextStyle(
                                              color: ThemeColors
                                                  .textBoxOutlineBorder,
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
                                            viewModel.other_suggestion = str;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.mic_sharp)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
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
                                            hintText: Languages.of(context)!
                                                .any_other_suggetion,
                                            hintStyle: const TextStyle(
                                              color: ThemeColors
                                                  .textBoxOutlineBorder,
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
                                    str:
                                        Languages.of(context)!.feedbackbtnlabel,
                                    fontWeight: FontWeight.bold,
                                    btnColor: ThemeColors.appDarkPrimaryColor,
                                    btnPressed: () async {
                                      print("===> update $sr_no");

                                      final isFormA =
                                          await viewModel.savefeedbackform();
                                      if (isFormA) {
                                        sr_no = sr_no + 1;

                                        viewModel.updateSrno(sr_no.toString());

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);

                                        viewModel.redirectToPage(homescreen);
                                      } else {
                                        print("Please Check Form Properly");
                                      }
                                    },
                                    borderRadius: 10,
                                    btnBorderColor:
                                        ThemeColors.textBoxOutlineBorder,
                                    fontSize: 20,
                                    // fontWeight: FontWeight.w300,
                                    txtColor: ThemeColors.textBoxOutlineBorder,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(size.height * 0.01),
                              child: CustomBtn(
                                width: size.width * 0.6,
                                height: size.height * 0.05,
                                str: Languages.of(context)!.labelChangeLanguage,
                                fontWeight: FontWeight.bold,
                                btnColor: ThemeColors.appDarkPrimaryColor,
                                btnPressed: () {
                                  viewModel
                                      .redirectToPage(changelanguagescreen);
                                },
                                borderRadius: 10,
                                btnBorderColor:
                                    ThemeColors.textBoxOutlineBorder,
                                fontSize: 20,
                                // fontWeight: FontWeight.w300,
                                txtColor: ThemeColors.textBoxOutlineBorder,
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.all(size.height * 0.01),
                            //   child: CustomBtn(
                            //     width: size.width * 0.8,
                            //     height: size.height * 0.05,
                            //     str: Languages.of(context)!.feedbackbtnlabel,
                            //     fontWeight: FontWeight.bold,
                            //     btnColor: ThemeColors.appDarkPrimaryColor,
                            //     btnPressed: () async {
                            //       // viewModel.getSrno();

                            //       final isFormA =
                            //           await viewModel.savefeedbackform();

                            //       if (isFormA) {
                            //         // ScaffoldMessenger.of(context)
                            //         //     .showSnackBar(snackBar);
                            //         viewModel.redirectToPage(homescreen);
                            //       } else {
                            //         print("Please Check Form Properly");
                            //       }
                            //     },
                            //     borderRadius: 10,
                            //     btnBorderColor:
                            //         ThemeColors.textBoxOutlineBorder,
                            //     fontSize: 20,
                            //     // fontWeight: FontWeight.w300,
                            //     txtColor: ThemeColors.textBoxOutlineBorder,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
