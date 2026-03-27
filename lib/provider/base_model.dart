// ignore_for_file: unused_import, non_constant_identifier_names, empty_catches, unused_local_variable, await_only_futures, avoid_print, dead_code, unused_field, unnecessary_brace_in_string_interps, unused_element, unnecessary_string_interpolations

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sou_feedback_app/constant/routename.dart';
import 'package:sou_feedback_app/dataconnect_generated/generated.dart';
import 'package:sou_feedback_app/enum/view_state.dart';
import 'package:sou_feedback_app/provider/getit.dart';
import 'package:sou_feedback_app/provider/getusers_model.dart';
import 'package:sou_feedback_app/services/dialogService.dart';
import 'package:sou_feedback_app/services/navigation_service.dart';
import 'package:sou_feedback_app/src/models/Srno.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sou_feedback_app/src/models/save_feedback_model.dart';
import 'package:sou_feedback_app/src/models/save_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../locator.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  ViewState _state = ViewState.idle;
  BuildContext? context;
  // ViewState get state => _state;
  // DialogService get dialogService => _dialogService;
  FirebaseAuth auth = FirebaseAuth.instance;
  QuerySnapshot? snapshot;
  FlutterSoundRecorder? _recorder;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Srno> _srno = [];
  List<Srno> get srno => _srno;
  AnimationController? _animationController;
  final bool _isAnimating = false;
  String? text = "";
  bool isMatchFound = false;
  final SpeechToText speech = SpeechToText();
  bool speechTest = false;
  PersistentBottomSheetController? _controller;
  bool isListening = true;
  bool isLoading = false;
  late final Future<QueryResult<ListAnalysisReportsData?, void>>
      _reportListFuture;
  final FlutterTts flutterTts = FlutterTts();
  String? stopfilePath;
  late final File file;
  final storageRef = FirebaseStorage.instance.ref();
  // late final audioRef;
  final TextEditingController fileRemarkController = TextEditingController();
  final modelAI =
      FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');

  Future<void> speakText(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  Future<void> initRecorder() async {
    _recorder = FlutterSoundRecorder();
    await _recorder!.openRecorder();
    print("Recorder initialized ${_recorder!.isStopped}");
  }

  bool isRecording = false;

  Future<void> requestRecordingpermission() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Recording permission not granted');
    }
  }

  Future<void> requestStoragePermission() async {
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;
    final statusStorage = android.version.sdkInt >= 30
        ? await Permission.manageExternalStorage.request()
        : await Permission.storage.request();

    if (statusStorage == PermissionStatus.granted) {
      print("Media & Storage permissions granted");
    } else {
      print("Media permissions denied");
      // Handle denied permissions
      openAppSettings();
    }
  }

  Future<void> requestSmsPermission() async {
    final statusSms = await Permission.sms.request();
    if (statusSms == PermissionStatus.granted) {
      print("SMS permissions granted");
    } else if (statusSms == PermissionStatus.denied) {
      print("SMS permissions denied");
    } else if (statusSms == PermissionStatus.permanentlyDenied) {
      print("SMS permissions permanently denied, opening app settings");
      openAppSettings();
    }
  }

  Future<void> initializeFilePath() async {
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory!.path}/${DateTime.now()}.aac';
    print("File path initialized: $filePath");
    file = File(filePath);
    await file.create(recursive: true);
  }

  Future<void> startRecording() async {
    final directory = await getExternalStorageDirectory();
    print("directory ${directory!.path}");
    final filePath = '${directory.path}/${DateTime.now()}.aac';
    await requestRecordingpermission();
    print("Directory: ${filePath}");
    await _recorder!.startRecorder(
      toFile: filePath,
      codec: Codec.aacADTS,
    );
    stopfilePath = filePath;
    isRecording = true;
    notifyListeners();
  }

  Future<void> stopRecording() async {
    await requestStoragePermission();
    print("Recording Stope :-- ");
    final filePath = await _recorder?.stopRecorder();
    print("Recording Stopped File Path: $stopfilePath");
    isRecording = false;
    if (stopfilePath != null) {
      final file = File(stopfilePath!);
      if (await file.exists()) {
        print("File exists: ");
        final audioRef = storageRef.child('audio/${DateTime.now()}.aac');
        await audioRef.putFile(file);
        print("File uploaded successfully!");
        updateTextBoxWithAudioPath(stopfilePath!);
        print("print StopfilePath: $stopfilePath");
      } else {
        print("File does not exist: $filePath");
      }
    } else {
      print("File path is null");
    }
    notifyListeners();
  }

  Future<bool> checkCustomerExist(String mobile) async {
    if (mobile.trim().isEmpty) return false;
    try {
      final result = await FirebaseFirestore.instance
          .collection('Users')
          .where('user_mobile_no', isEqualTo: mobile)
          .get();
      return result.docs.isNotEmpty;
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print("Permission denied to access Firestore: ${e.message}");
      }
      return false;
    }
  }

  String? phoneNumber;
  String verificationid = "";
  String? otp, authStatus = "";
  String? authexception = "";
  bool isOtpsent = false;

  Future<bool> loginWithEmailPassword(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email.trim(), password: password);

      final User? user = userCredential.user;

      if (user != null) {
        authStatus = "Logged in successfully";
        notifyListeners();
        return true;
      } else {
        authStatus = "Login failed";
        notifyListeners();
        return false;
      }
    } on FirebaseAuthException catch (e) {
      authexception = e.message;
      authStatus = e.code;
      print('Login error: $e');
      notifyListeners();
      return false;
    } catch (e) {
      print('Unexpected login error: $e');
      authStatus = "Login failed";
      notifyListeners();
      return false;
    }
  }

  // Future VerifyOTP(String otp, String verificationid) async {
  //   try {
  //     print('....... verid $verificationid');
  //     final AuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationid, smsCode: otp);
  //     final UserCredential user = await auth.signInWithCredential(credential);
  //     final User? currentUser = await auth.currentUser;
  //     assert(user.user!.uid == currentUser!.uid);
  //     // redirectToPage(feedbackscreen);
  //     notifyListeners();
  //   } catch (e) {
  //     print("=>>> Error $e");
  //   }
  // }

  String Username = "";
  String UserBirthDay = "";
  String UserCity = "";
  String UserGender = "";
  String UserMobile = "";
  String UserGrpSize = "";
  String UserProfession = "";
  String Massage = "";
  String email_id = "";
  String password = "";

  Future<bool> saveusers() async {
    bool isSaved = false;
    final users = SaveUsers(Username, UserBirthDay, UserCity, UserGender,
        UserMobile, UserGrpSize, UserProfession, email_id, password);
    try {
      await FirebaseFirestore.instance.collection("Users").add(users.toMap());
      isSaved = true;
    } on Exception catch (_) {
      Massage = "Unable to save the Users";
    } catch (e) {
      Massage = "Error occured!";
    }

    notifyListeners();

    return isSaved;
  }

  Future<User?> signUp(String email, String password) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle errors like weak-password or email-already-in-use
      print('Firebase Auth Error: ${e.code}');
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        try {
          _reportListFuture =
              ExampleConnector.instance.listAnalysisReports().execute();
          _reportListFuture.then(
            (result) {
              if (kDebugMode) {
                print('Report list future completed');
              }
            },
            onError: (error) {
              if (kDebugMode) {
                print('Report list future failed with error: $error');
              }
            },
          );
        } catch (e) {
          if (kDebugMode) print('Failed to fetch report list: $e');
        }
      } else {
        if (kDebugMode) print('Skipping report fetch: no authenticated user');
      }
      await FirebaseAuth.instance.signOut();
      print("User signed out successfully");
    } on FirebaseAuthException catch (e) {
      print('Error signing out: $e');
    } catch (e) {
      print(e.toString());
    }
  }

  void updateTextBoxWithAudioPath(String path) {
    // remark = fileRemarkController.text;

    // fileRemarkController.text = File(path.path).path;
    // var remark = fileRemarkController.text;
    // file = fileRemarkController.text.toString() as File;

    path = fileRemarkController.text;
    fileRemarkController.text = path;
    print("fileRemarkController.text: ${fileRemarkController.text}");
    // print("remark: $remark");

    notifyListeners();
  }

  Future<void> handleMicButtonPress() async {
    if (isRecording) {
      await stopRecording();
    } else {
      await startRecording();
    }
    notifyListeners();
  }

  Future<void> getSrno() async {
    final querySnapshot = await _firestore.collection('form_no').get();
    final srnos =
        querySnapshot.docs.map((doc) => Srno.fromMap(doc.data())).toList();

    _srno = srnos;

    print("=>>> sr nos ${_srno}");

    notifyListeners();
  }

  void _initspeech() async {
    bool available = await speech.initialize();
    if (available) {
      speechTest = true;
      notifyListeners();
    } else {
      speechTest = false;
    }
  }

  void setState(ViewState viewState) {
    _state = viewState;
    _initspeech();
    notifyListeners();
  }

  void startListening() {
    speech.listen(onResult: (result) {
      text = result.recognizedWords;
      notifyListeners();
    });
    isListening = true;
    notifyListeners();
  }

  void stopListening() {
    speech.stop();
    isListening = false;
    notifyListeners();
  }

  // String get recognizedText => text ?? '';

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

  // bool isLoading = false;
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
}
