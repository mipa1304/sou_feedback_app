// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get feedbackformHeading;

  String get feedbackformHeading2;

  String get feedbackdept;

  String get feedbackloacation;

  String get feedbackReviewLabel;

  String get feedbackReviewLabel2;

  String get feedbackReviewLabel3;

  String get feedbackloacation2;

  String get feedbackloacation3;

  String get feedbackloacation4;

  String get feedbackloacation5;

  String get feedbackloacation6;

  String get feedbackRemarks;

  String get feedbackbtnlabel;

  String get labelChangeLanguage;

  String get labelSelectLanguage;

  String get pleaseenterYourCity;

  String get yourname;

  String get yourmobilenumber;

  String get groupsize;

  String get gr_queue_management_guest_relationetc;

  String get gr_queue_management_at_friskingpoint;

  String get gr_behaviour_of_staff_brown_dressed;

  String get gr_queue_management_for_viewing_gallery;

  String get gr_behavior_of_guest_relation_staff_black_white_dressed;

  String get a_ambiance_general_lights;

  String get exhibition_hall;

  String get lift_loby;

  String get viewing_gallery;

  String get external_walkways;

  String get facility;

  String get facility_travelators_on_the_bridge;

  String get escalators;

  String get elevators_Lifts;

  String get f_museum_exhibits;

  String get quality_of_exhibits;

  String get interactive_equipment;

  String get content_of_Exhibits;

  String get g_projection_mapping_show;

  String get Seating_arrangements;

  String get audio_video_content;

  String get audio_quality;

  String get video_quality;

  String get h_Cafeteria;

  String get seating_arrangements_cafe;

  String get cleanliness_of_seating_area;

  String get washroom_cleanliness;

  String get any_other_suggetion;

  String
      get c_security_checking_confiscating_gutka_pan_smoking_material_alcoholic_beverages_etc;

  String get body_frisking;

  String get bag_frisking;

  String get behavior_of_security_staff;

  // String get behavior_of_security_staff;
}
