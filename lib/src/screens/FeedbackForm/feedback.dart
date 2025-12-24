// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, avoid_print, non_constant_identifier_names, unused_field, use_build_context_synchronously, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, unused_element, unnecessary_brace_in_string_interps

// import 'package:SOUFEEDBACKAPP/src/models/sr_view_model.dart';
import 'package:SOUFEEDBACKAPP/provider/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ai/firebase_ai.dart';
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
  final TextEditingController _feedbackA = TextEditingController();

  int sr_no = 0;

  final BaseModel viewmodel = BaseModel();

  final TextEditingController _feedbackB = TextEditingController();

  static const snackBar = SnackBar(
    content: Text('Your Valuable FeedBack Saved SuccessFully'),
  );

  // List<Srno>? _srno;

  @override
  void initState() {
    super.initState();
    viewmodel.initRecorder();
    viewmodel.initializeFilePath();
  }

  bool isData = false;

  bool isRecording = false;

  final modelAI =
      FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider<FeedbackFormViewModel>(
      create: (context) => locator<FeedbackFormViewModel>(),
      child: ViewModelBuilder<FeedbackFormViewModel>.reactive(
          viewModelBuilder: () => FeedbackFormViewModel(context),
          builder: ((context, viewModel, child) {
            viewModel.getSrno();
            viewModel.initRecorder();

            return Scaffold(
              appBar: AppBar(
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
                                viewModel.srno.isEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(
                                          left: size.height * 0.09,
                                        ),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                              color: ThemeColors
                                                  .textBoxOutlineBorder),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                          left: size.height * 0.09,
                                        ),
                                        child: SizedBox(
                                            height: 25,
                                            width: 40,
                                            child: ListView.builder(
                                                itemCount:
                                                    viewModel.srno.length,
                                                itemBuilder: (context, index) {
                                                  sr_no = int.parse(viewModel
                                                      .srno[index].srno);

                                                  return Text(
                                                    viewModel.srno[index].srno
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: ThemeColors
                                                          .textBoxOutlineBorder,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                _buildSectionHeader(
                                  Languages.of(context)!
                                      .a_ambiance_general_lights,
                                  () {
                                    String selectedText = Languages.of(context)!
                                        .a_ambiance_general_lights;
                                    viewModel.speakText(selectedText);
                                  },
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!.exhibition_hall,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.exhibition_Hall = value!;
                                    });
                                  },
                                  selectedValue: viewModel.exhibition_Hall,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!.lift_loby,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.lift_lobi = value!;
                                    });
                                  },
                                  selectedValue: viewModel.lift_lobi,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!.viewing_gallery,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.viewing_gallery = value!;
                                    });
                                  },
                                  selectedValue: viewModel.viewing_gallery,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title:
                                      Languages.of(context)!.external_walkways,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.external_walkways = value!;
                                    });
                                  },
                                  selectedValue: viewModel.external_walkways,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.height * 0.02,
                                      right: size.height * 0.02),
                                  child: TextField(
                                      controller:
                                          viewModel.fileRemarkController,
                                      maxLines: 3,
                                      onChanged: (String str) =>
                                          {viewModel.remark = str},
                                      decoration: InputDecoration(
                                        suffixIcon: viewModel.isRecording
                                            ? IconButton(
                                                onPressed: () {
                                                  viewModel.stopRecording();
                                                },
                                                icon: Icon(Icons.stop))
                                            : IconButton(
                                                onPressed: () {
                                                  viewModel.startRecording();
                                                },
                                                icon: Icon(Icons.mic)),
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
                                _buildSectionHeader(
                                  Languages.of(context)!.feedbackdept,
                                  () {
                                    String selectedText =
                                        Languages.of(context)!.feedbackdept;
                                    viewModel.speakText(selectedText);
                                  },
                                ),

                                // _buildSingleChoiceRow(context, title: Languages.of(context)!.feedbackloacation, options: ["Excellent", "Good", "Average"], selectedValue: selectedValue, onChanged: onChanged)

                                _buildSingleChoiceRow(
                                  context,
                                  title:
                                      Languages.of(context)!.feedbackloacation,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.exhibition_Hall_b = value!;
                                    });
                                  },
                                  selectedValue: viewModel.exhibition_Hall_b,
                                ),

                                _buildSingleChoiceRow(
                                  context,
                                  title:
                                      Languages.of(context)!.feedbackloacation2,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.lift_lobi_b = value!;
                                    });
                                  },
                                  selectedValue: viewModel.lift_lobi_b,
                                ),

                                _buildSingleChoiceRow(
                                  context,
                                  title:
                                      Languages.of(context)!.feedbackloacation3,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.viewing_gallery_b = value!;
                                    });
                                  },
                                  selectedValue: viewModel.viewing_gallery_b,
                                ),

                                _buildSingleChoiceRow(
                                  context,
                                  title:
                                      Languages.of(context)!.feedbackloacation4,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.washroom_at_ticket_counter =
                                          value!;
                                    });
                                  },
                                  selectedValue:
                                      viewModel.washroom_at_ticket_counter,
                                ),

                                _buildSingleChoiceRow(
                                  context,
                                  title:
                                      Languages.of(context)!.feedbackloacation5,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.washroom_at_exhibition_hall =
                                          value!;
                                    });
                                  },
                                  selectedValue:
                                      viewModel.washroom_at_exhibition_hall,
                                ),

                                _buildSingleChoiceRow(
                                  context,
                                  title:
                                      Languages.of(context)!.feedbackloacation6,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.washroom_at_vg = value!;
                                    });
                                  },
                                  selectedValue: viewModel.washroom_at_vg,
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
                                _buildSectionHeader(
                                  Languages.of(context)!
                                      .c_security_checking_confiscating_gutka_pan_smoking_material_alcoholic_beverages_etc,
                                  () {
                                    String selectedText = Languages.of(context)!
                                        .c_security_checking_confiscating_gutka_pan_smoking_material_alcoholic_beverages_etc;
                                    viewModel.speakText(selectedText);
                                  },
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!.body_frisking,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.body_frisking = value!;
                                    });
                                  },
                                  selectedValue: viewModel.body_frisking,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!.bag_frisking,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.bag_frisking = value!;
                                    });
                                  },
                                  selectedValue: viewModel.bag_frisking,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!
                                      .behavior_of_security_staff,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.behaviour_of_security_staff =
                                          value!;
                                    });
                                  },
                                  selectedValue:
                                      viewModel.behaviour_of_security_staff,
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
                                _buildSectionHeader(
                                  Languages.of(context)!
                                      .gr_queue_management_guest_relationetc,
                                  () {
                                    String selectedText = Languages.of(context)!
                                        .gr_queue_management_guest_relationetc;
                                    viewModel.speakText(selectedText);
                                  },
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!
                                      .gr_queue_management_at_friskingpoint,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.que_manag_at_frisking_point =
                                          value!;
                                    });
                                  },
                                  selectedValue:
                                      viewModel.que_manag_at_frisking_point,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!
                                      .gr_behaviour_of_staff_brown_dressed,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.behaviour_of_staff = value!;
                                    });
                                  },
                                  selectedValue: viewModel.behaviour_of_staff,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!
                                      .gr_queue_management_for_viewing_gallery,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.que_manage_vg = value!;
                                    });
                                  },
                                  selectedValue: viewModel.que_manage_vg,
                                ),
                                _buildSingleChoiceRow(
                                  context,
                                  title: Languages.of(context)!
                                      .gr_behavior_of_guest_relation_staff_black_white_dressed,
                                  options: [
                                    Languages.of(context)!.feedbackReviewLabel,
                                    Languages.of(context)!.feedbackReviewLabel2,
                                    Languages.of(context)!.feedbackReviewLabel3
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel
                                              .behaviour_of_gr_staff_black_white =
                                          value!;
                                    });
                                  },
                                  selectedValue: viewModel
                                      .behaviour_of_gr_staff_black_white,
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
                                    _buildSectionHeader(
                                      Languages.of(context)!.facility,
                                      () {
                                        String selectedText =
                                            Languages.of(context)!.facility;
                                        viewModel.speakText(selectedText);
                                      },
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .facility_travelators_on_the_bridge,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.travelators_on_bridge =
                                              value!;
                                        });
                                      },
                                      selectedValue:
                                          viewModel.travelators_on_bridge,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!.escalators,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.escalators = value!;
                                        });
                                      },
                                      selectedValue: viewModel.escalators,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .elevators_Lifts,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.escalators = value!;
                                        });
                                      },
                                      selectedValue: viewModel.escalators,
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
                                    _buildSectionHeader(
                                      Languages.of(context)!.f_museum_exhibits,
                                      () {
                                        String selectedText =
                                            Languages.of(context)!
                                                .f_museum_exhibits;
                                        viewModel.speakText(selectedText);
                                      },
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .quality_of_exhibits,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.qc_exhibits = value!;
                                        });
                                      },
                                      selectedValue: viewModel.qc_exhibits,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .interactive_equipment,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.intrective_equip = value!;
                                        });
                                      },
                                      selectedValue: viewModel.intrective_equip,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .content_of_Exhibits,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.content_exhibits = value!;
                                        });
                                      },
                                      selectedValue: viewModel.content_exhibits,
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
                                    _buildSectionHeader(
                                      Languages.of(context)!
                                          .g_projection_mapping_show,
                                      () {
                                        String selectedText =
                                            Languages.of(context)!
                                                .g_projection_mapping_show;
                                        viewModel.speakText(selectedText);
                                      },
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .Seating_arrangements,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.seating_arrangements =
                                              value!;
                                        });
                                      },
                                      selectedValue:
                                          viewModel.seating_arrangements,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .audio_video_content,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.avcontant = value!;
                                        });
                                      },
                                      selectedValue: viewModel.avcontant,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title:
                                          Languages.of(context)!.audio_quality,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.audio_qc = value!;
                                        });
                                      },
                                      selectedValue: viewModel.audio_qc,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title:
                                          Languages.of(context)!.video_quality,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.video_qc = value!;
                                        });
                                      },
                                      selectedValue: viewModel.video_qc,
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
                                    _buildSectionHeader(
                                      Languages.of(context)!.h_Cafeteria,
                                      () {
                                        String selectedText =
                                            Languages.of(context)!.h_Cafeteria;
                                        viewmodel.speakText(selectedText);
                                      },
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .seating_arrangements_cafe,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.seating_arrangements_h =
                                              value!;
                                        });
                                      },
                                      selectedValue:
                                          viewModel.seating_arrangements_h,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .cleanliness_of_seating_area,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.cleanliness_of_seatarea =
                                              value!;
                                        });
                                      },
                                      selectedValue:
                                          viewModel.cleanliness_of_seatarea,
                                    ),
                                    _buildSingleChoiceRow(
                                      context,
                                      title: Languages.of(context)!
                                          .washroom_cleanliness,
                                      options: [
                                        Languages.of(context)!
                                            .feedbackReviewLabel,
                                        Languages.of(context)!
                                            .feedbackReviewLabel2,
                                        Languages.of(context)!
                                            .feedbackReviewLabel3
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.washroom_cleanliness_h =
                                              value!;
                                        });
                                      },
                                      selectedValue:
                                          viewModel.washroom_cleanliness_h,
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

  Widget _buildSectionHeader(String title, VoidCallback? onPressed) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(3),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              title,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: Colors.black,
              ),
              softWrap: true,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: CircleBorder(),

              // padding: EdgeInsets.all(10),
            ),
            onPressed: onPressed,
            child: Icon(
              Icons.volume_up,
              color: const Color.fromARGB(255, 10, 10, 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleChoiceRow(
    BuildContext context, {
    required String title,
    required List<String> options,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text("Select"),
              isExpanded: true,
              items: options.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
