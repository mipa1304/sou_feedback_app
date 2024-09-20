// ignore_for_file: unused_import, non_constant_identifier_names, empty_catches, unused_local_variable, await_only_futures, avoid_print, dead_code, unused_field, unnecessary_brace_in_string_interps, unused_element, unnecessary_string_interpolations

import 'package:SOUFEEDBACKAPP/constant/routename.dart';
import 'package:SOUFEEDBACKAPP/enum/view_state.dart';
import 'package:SOUFEEDBACKAPP/provider/getit.dart';
import 'package:SOUFEEDBACKAPP/provider/getusers_model.dart';
import 'package:SOUFEEDBACKAPP/services/dialogService.dart';
import 'package:SOUFEEDBACKAPP/services/navigation_service.dart';
import 'package:SOUFEEDBACKAPP/src/models/Srno.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:SOUFEEDBACKAPP/src/models/save_feedback_model.dart';
import 'package:SOUFEEDBACKAPP/src/models/save_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../locator.dart';

//import 'package:SOUFEEDBACKAPP/src/models/sr_view_model.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  // late final Srno srno;
  ViewState _state = ViewState.idle;

  BuildContext? context;

  ViewState get state => _state;

  DialogService get dialogService => _dialogService;

  FirebaseAuth auth = FirebaseAuth.instance;

  QuerySnapshot? snapshot;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Srno> _srno = [];

  List<Srno> get srno => _srno;

  // int index = 0;

  Future<void> getSrno() async {
    final querySnapshot = await _firestore.collection('form_no').get();
    final srnos =
        querySnapshot.docs.map((doc) => Srno.fromMap(doc.data())).toList();

    _srno = srnos;

    print("=>>> sr nos ${_srno}");

    notifyListeners();
  }

  void setState(ViewState viewState) {
    _state = viewState;
    // authStatus = authStatus;
    // verificationId = verificationId;
    print("=====>>>>> ${_state}");
    notifyListeners();
  }

  redirectToPage(String routename, {dynamic arguments}) {
    if (arguments == null) {
      navigationService.navigateTo(routename);
    } else {
      navigationService.navigateTo(routename, arguments: arguments);
    }
  }

  final update_Srno = FirebaseFirestore.instance.collection('form_no');

  Future<void> updateSrno(String newSrno) {
    print(" ===> Sr. no $newSrno");

    return update_Srno
        .doc('CXXxGjqj3C0fyaCNSfqG')
        .update({'sr_no': '$newSrno'})
        .then((value) => print("Sr No Update Successfully"))
        .catchError((e) => print("Failed to update Sr No: $e"));
  }

  // String Username = "";  'sr_no'
  // String UserBirthDay = "";
  // String UserCity = "";
  // String UserGender = "";
  // String UserMobile = "";
  // String UserGrpSize = "";
  // String UserProfession = "";
  // String Massage = "";
  // List<UsersViewModel>? _users;

  bool isLoading = false;

  // Future<bool> saveusers() async {
  //   bool isSaved = false;
  //   final users = SaveUsers(Username, UserBirthDay, UserCity, UserGender,
  //       UserMobile, UserGrpSize, UserProfession);
  //   try {
  //     await FirebaseFirestore.instance.collection("Users").add(users.toMap());
  //     isSaved = true;
  //   } on Exception catch (_) {
  //     Massage = "Unable to save the Users";
  //   } catch (e) {
  //     Massage = "Error occured!";
  //   }

  //   notifyListeners();

  //   return isSaved;
  // }

  String? your_name;
  String? your_city;
  String? Your_mobile;
  String? group_size;
  String? exhibition_Hall;
  String? lift_lobi;
  String? viewing_gallery;
  String? external_walkways;
  String? remark;
  String? exhibition_Hall_b;
  String? lift_lobi_b;
  String? viewing_gallery_b;
  String? washroom_at_ticket_counter;
  String? washroom_at_exhibition_hall;
  String? washroom_at_vg;
  String? remark_b;
  String? body_frisking;
  String? bag_frisking;
  String? behaviour_of_security_staff;
  String? remark_c;
  String? que_manag_at_frisking_point;
  String? behaviour_of_staff;
  String? que_manage_vg;
  String? behaviour_of_gr_staff_black_white;
  String? remark_d;
  String? travelators_on_bridge;
  String? escalators;
  String? elevators_lifts;
  String? remark_e;
  String? qc_exhibits;
  String? intrective_equip;
  String? content_exhibits;
  String? remark_f;
  String? seating_arrangements;
  String? avcontant;
  String? audio_qc;
  String? video_qc;
  String? remark_g;
  String? seating_arrangements_h;
  String? cleanliness_of_seatarea;
  String? washroom_cleanliness_h;
  String? other_suggestion;
  String? remark_h;

  Future<bool> savefeedbackform() async {
    bool isFormA = false;
    // final feedForm = SaveFeedback_a(
    //     ExhibitionHall, LiftLobi, ViewingGallery, ExternalWalkways, RemarkA);

    final feedForm = SaveFeedback_a(
      your_name,
      your_city,
      Your_mobile,
      group_size,
      exhibition_Hall,
      lift_lobi,
      viewing_gallery,
      external_walkways,
      remark,
      exhibition_Hall_b,
      lift_lobi_b,
      viewing_gallery_b,
      washroom_at_ticket_counter,
      washroom_at_exhibition_hall,
      washroom_at_vg,
      remark_b,
      body_frisking,
      bag_frisking,
      behaviour_of_security_staff,
      remark_c,
      que_manag_at_frisking_point,
      behaviour_of_staff,
      que_manage_vg,
      behaviour_of_gr_staff_black_white,
      remark_d,
      travelators_on_bridge,
      escalators,
      elevators_lifts,
      remark_e,
      qc_exhibits,
      intrective_equip,
      content_exhibits,
      remark_f,
      seating_arrangements,
      avcontant,
      audio_qc,
      video_qc,
      remark_g,
      seating_arrangements_h,
      cleanliness_of_seatarea,
      washroom_cleanliness_h,
      other_suggestion,
      remark_h,
    );

    try {
      await FirebaseFirestore.instance
          .collection('Feedback')
          .add(feedForm.toMap());
      isFormA = true;

      print("=======>");
    } on Exception catch (_) {
      print("Enable To Save Feedback Form");
    } catch (e) {
      print(e);
    }

    notifyListeners();

    return isFormA;
  }

  // Future<Srno> updateSrno() async {
  //   await _firestore.collection('form_no').doc().update(srno :)
  // }

  // String BodyFrishking = "";
  // String BagFrishking = "";
  // String BahaviourofSecuritySataff = "";
  // String RemarkC = "";

  // String QueManagementFrishking = "";
  // String BehaviourofStaffBrownDress = "";
  // String QueueManagementForVG = "";
  // String BehaviourOfGRStaffBlackAndWhiteDress = "";
  // String grname = "";
  // String grcity = "";
  // String grmobile = "";
  // String grgroupsize = "";
  // String RemarkD = "";

  // bool issrNoLoading = false;

  // Future<bool> savefeedbackformB() async {
  //   bool isFormB = false;
  //   // final feedFormC = SaveFeedback_c(
  //   //     BodyFrishking, BagFrishking, BahaviourofSecuritySataff, RemarkC);

  //   final feedFormD = SaveFeedback_d(
  //       QueManagementFrishking,
  //       BehaviourofStaffBrownDress,
  //       QueueManagementForVG,
  //       BehaviourOfGRStaffBlackAndWhiteDress,
  //       grname,
  //       grcity,
  //       grmobile,
  //       grgroupsize,
  //       RemarkD);

  //   try {
  //     // await FirebaseFirestore.instance
  //     //     .collection('GuestRelation')
  //     //     .add(feedFormC.toMap());
  //     await FirebaseFirestore.instance
  //         .collection('GuestRelation')
  //         .add(feedFormD.toMap());
  //     isFormB = true;
  //   } on Exception catch (_) {
  //     print("Enable To Save Feedback Form");
  //   } catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  //   return isFormB;
  // }

  // Future<bool> savefeedbackformC() async {
  //   bool isFormB = false;
  //   final feedFormC = SaveFeedback_c(
  //       BodyFrishking, BagFrishking, BahaviourofSecuritySataff, RemarkC);

  //   // final feedFormD = SaveFeedback_d(
  //   //     QueManagementFrishking,
  //   //     BehaviourofStaffBrownDress,
  //   //     QueueManagementForVG,
  //   //     BehaviourOfGRStaffBlackAndWhiteDress,
  //   //     RemarkD);

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection(auth.currentUser!.uid)
  //         .add(feedFormC.toMap());
  //     // await FirebaseFirestore.instance
  //     //     .collection(auth.currentUser!.uid)
  //     //     .add(feedFormD.toMap());
  //     isFormB = true;
  //   } on Exception catch (_) {
  //     print("Enable To Save Feedback Form");
  //   } catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  //   return isFormB;
  // }

  // String? TravelatorsBridge;
  // String? Escalators;
  // String? Elevators;
  // String? Remarke;

  // String? QualityExhibits;
  // String? InteractivEquep;
  // String? ContentExhi;
  // String? remarkf;

  // String? SeatingArrangements;
  // String? AudioVideoContant;
  // String? AudioQuality;
  // String? VideoQuality;
  // String? remarkg;

  // Future<bool> savefeedbackformD() async {
  //   bool isFormC = false;
  //   final feedFormE =
  //       SaveFeedback_e(TravelatorsBridge, Escalators, Elevators, Remarke);

  //   final feedFormF =
  //       SaveFeedback_f(QualityExhibits, InteractivEquep, ContentExhi, remarkf);

  //   final feedFormG = SaveFeedback_g(SeatingArrangements, AudioVideoContant,
  //       AudioQuality, VideoQuality, remarkg);

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection(auth.currentUser!.uid)
  //         .add(feedFormE.toMap());
  //     await FirebaseFirestore.instance
  //         .collection(auth.currentUser!.uid)
  //         .add(feedFormF.toMap());
  //     await FirebaseFirestore.instance
  //         .collection(auth.currentUser!.uid)
  //         .add(feedFormG.toMap());
  //     isFormC = true;
  //   } on Exception catch (_) {
  //     print("Enable To Save Feedback Form");
  //   } catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  //   return isFormC;
  // }

  // String? CafeSeatingArrangements;
  // String? CleanlinessOfSeatingArea;
  // String? WashroomCleanliness;
  // String? RemarkH;
  // String? OtherSuggestions;

  // Future<bool> savefeedbackformE() async {
  //   bool isFormD = false;

  //   final feedFormH = SaveFeedback_h(
  //       CafeSeatingArrangements,
  //       CleanlinessOfSeatingArea,
  //       WashroomCleanliness,
  //       RemarkH,
  //       OtherSuggestions);

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection(auth.currentUser!.uid)
  //         .add(feedFormH.toMap());
  //     isFormD = true;
  //   } on Exception catch (_) {
  //     print("Enable To Save Feedback Form");
  //   } catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  //   return isFormD;
  // }

  // Future<bool> checkCustomerExist(String mobile) async {
  //   final QuerySnapshot result = await FirebaseFirestore.instance
  //       .collection('Users')
  //       .where('user_mobile_no', isEqualTo: mobile)
  //       .get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   notifyListeners();
  //   if (documents.isNotEmpty) {
  //     isLoading = true;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future getSrno() async {
  //   final QuerySnapshot result =
  //       await FirebaseFirestore.instance.collection('form_no').get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   notifyListeners();
  // }

  // String? phoneNumber;
  // String verificationid = "";
  // String? otp, authStatus = "";
  // String? authexception = "";
  // bool isOtpsent = false;

  // bool verifyOtp = false;

  // Future<bool> verifyPhoneNumber(
  //     BuildContext context, String phoneNumber) async {
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: '+91$phoneNumber',
  //     verificationCompleted: (AuthCredential authCredential) {
  //       authCredential.providerId;

  //       // authStatus = "Your account is successfully verified";
  //     },
  //     verificationFailed: (FirebaseAuthException authException) {
  //       // print('>>>>>> Error $authException');
  //       authexception = authException.toString();
  //       authStatus = "Authentication failed";
  //     },
  //     codeSent: (String verId, [int? forceCodeResent]) {
  //       // verId = verificationId!;
  //       verificationid = verId;
  //       authStatus = "OTP has been successfully send";
  //       isOtpsent = true;
  //     },
  //     codeAutoRetrievalTimeout: (String  ) {
  //       verificationid = verId;
  //       // verId = verificationId!;
  //       // authStatus = "TIMEOUT";
  //       // setState(verificationId as ViewState);
  //     },
  //   );

  //   // notifyListeners();
  //   return isOtpsent;
  // }

  // Future VerifyOTP(String otp, String verificationid) async {
  //   try {
  //     print('....... verid $verificationid');
  //     final AuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationid, smsCode: otp);

  //     final UserCredential user = await auth.signInWithCredential(credential);

  //     final User? currentUser = await auth.currentUser;

  //     assert(user.user!.uid == currentUser!.uid);

  //     redirectToPage(feedbackscreen);
  //     notifyListeners();
  //   } catch (e) {
  //     print("=>>> Error $e");
  //   }
  // }
}
