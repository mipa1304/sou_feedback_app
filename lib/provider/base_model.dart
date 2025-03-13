// ignore_for_file: unused_import, non_constant_identifier_names, empty_catches, unused_local_variable, await_only_futures, avoid_print, dead_code, unused_field, unnecessary_brace_in_string_interps, unused_element, unnecessary_string_interpolations

import 'dart:io';
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
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../locator.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class BaseModel extends ChangeNotifier {
  final navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  ViewState _state = ViewState.idle;
  BuildContext? context;
  ViewState get state => _state;
  DialogService get dialogService => _dialogService;
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

  final storageRef = FirebaseStorage.instance.ref();
  late final audioRef;

  Future<void> initRecorder() async {
    _recorder = FlutterSoundRecorder();
    await _recorder!.openRecorder();
  }

  bool isRecording = false;

  Future<void> requestRecordingpermission() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Recording permission not granted');
    }
  }

  Future<void> startRecording() async {
    await requestRecordingpermission();

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/audio_example.aac';
    await _recorder!.startRecorder(toFile: path);
    isRecording = true;
  }

  Future<String?> stopRecording() async {
    if (isRecording) {
      final filepath = await _recorder!.stopRecorder();
      isRecording = false;
      return filepath!;
    }
    return null;
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

  void setState(ViewState viewState) {
    _state = viewState;
    _initspeech();
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

  String get recognizedText => text ?? '';

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
