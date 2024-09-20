// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class SaveFeedback_a {
  String? your_name;
  String? your_city;
  String? your_mobile_no;
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
  String? remark_h;
  String? other_suggestion;
  DocumentReference? referance;

  SaveFeedback_a(
      this.your_name,
      this.your_city,
      this.your_mobile_no,
      this.group_size,
      this.exhibition_Hall,
      this.lift_lobi,
      this.viewing_gallery,
      this.external_walkways,
      this.remark,
      this.exhibition_Hall_b,
      this.lift_lobi_b,
      this.viewing_gallery_b,
      this.washroom_at_exhibition_hall,
      this.washroom_at_ticket_counter,
      this.washroom_at_vg,
      this.remark_b,
      this.body_frisking,
      this.bag_frisking,
      this.behaviour_of_security_staff,
      this.remark_c,
      this.que_manag_at_frisking_point,
      this.behaviour_of_staff,
      this.que_manage_vg,
      this.behaviour_of_gr_staff_black_white,
      this.remark_d,
      this.travelators_on_bridge,
      this.escalators,
      this.elevators_lifts,
      this.remark_e,
      this.qc_exhibits,
      this.intrective_equip,
      this.content_exhibits,
      this.remark_f,
      this.seating_arrangements,
      this.avcontant,
      this.audio_qc,
      this.video_qc,
      this.remark_g,
      this.seating_arrangements_h,
      this.cleanliness_of_seatarea,
      this.washroom_cleanliness_h,
      this.remark_h,
      this.other_suggestion,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "your_name": your_name,
      "your_city": your_city,
      "your_mobile_no": your_mobile_no,
      "group_size": group_size,
      "exhibition_Hall": exhibition_Hall,
      "lift_lobi": lift_lobi,
      "viewing_gallery": viewing_gallery,
      "external_walkways": external_walkways,
      "remark": remark,
      "exhibition_Hall_b": exhibition_Hall_b,
      "lift_lobi_b": lift_lobi_b,
      "viewing_gallery_b": viewing_gallery_b,
      "washroom_at_exhibition_hall": washroom_at_exhibition_hall,
      "washroom_at_ticket_counter": washroom_at_ticket_counter,
      "washroom_at_vg": washroom_at_vg,
      "remark_b": remark_b,
      "body_frisking": body_frisking,
      "bag_frisking": bag_frisking,
      "behaviour_of_security_staff": behaviour_of_security_staff,
      "remark_c": remark_c,
      "que_manag_at_frisking_point": que_manag_at_frisking_point,
      "behaviour_of_staff": behaviour_of_staff,
      "que_manage_vg": que_manage_vg,
      "behaviour_of_gr_staff_black_white": behaviour_of_gr_staff_black_white,
      "remark_d": remark_d,
      "travelators_on_bridge": travelators_on_bridge,
      "escalators": escalators,
      "elevators_lifts": elevators_lifts,
      "remark_e": remark_e,
      "qc_exhibits": qc_exhibits,
      "intrective_equip": intrective_equip,
      "content_exhibits": content_exhibits,
      "remark_f": remark_f,
      "seating_arrangements": seating_arrangements,
      "avcontant": avcontant,
      "audio_qc": audio_qc,
      "video_qc": video_qc,
      "remark_g": remark_g,
      "seating_arrangements_h": seating_arrangements_h,
      "cleanliness_of_seatarea": cleanliness_of_seatarea,
      "washroom_cleanliness_h": washroom_cleanliness_h,
      "other_suggestion": other_suggestion,
      "remark_h": remark_h,
    };
  }

  factory SaveFeedback_a.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_a(
        doc["your_name"],
        doc["your_city"],
        doc["your_mobile_no"],
        doc["group_size"],
        doc["exhibition_Hall"],
        doc["lift_lobi"],
        doc["viewing_gallery"],
        doc["external_walkways"],
        doc['remark'],
        doc["exhibition_Hall_b"],
        doc["lift_lobi_b"],
        doc["viewing_gallery_b"],
        doc["washroom_at_exhibition_hall"],
        doc["washroom_at_ticket_counter"],
        doc["washroom_at_vg"],
        doc["remark_b"],
        doc["body_frisking"],
        doc["bag_frisking"],
        doc["behaviour_of_security_staff"],
        doc["remark_c"],
        doc["que_manag_at_frisking_point"],
        doc["behaviour_of_staff"],
        doc["que_manage_vg"],
        doc["behaviour_of_gr_staff_black_white"],
        doc["remark_d"],
        doc["travelators_on_bridge"],
        doc["escalators"],
        doc["elevators_lifts"],
        doc["remark_e"],
        doc["qc_exhibits"],
        doc["intrective_equip"],
        doc["content_exhibits"],
        doc["remark_f"],
        doc["seating_arrangements"],
        doc["avcontant"],
        doc["audio_qc"],
        doc["video_qc"],
        doc["remark_g"],
        doc["seating_arrangements_h"],
        doc["cleanliness_of_seatarea"],
        doc["washroom_cleanliness_h"],
        doc["remark_h"],
        doc["other_suggestion"],
        doc.reference);
  }
}

class SaveFeedback_b {
  String? exhibition_Hall;
  String? lift_lobi;
  String? viewing_gallery;
  String? washroom_ticket_counter;
  String? washroom_exhibition_hall;
  String? washroom_viewing_gallery;
  String? remark;
  String? username;
  String? city;
  String? mobile_no;
  String? group_size;
  DocumentReference? referance;

  SaveFeedback_b(
      this.exhibition_Hall,
      this.lift_lobi,
      this.viewing_gallery,
      this.washroom_exhibition_hall,
      this.washroom_ticket_counter,
      this.washroom_viewing_gallery,
      this.remark,
      this.username,
      this.city,
      this.mobile_no,
      this.group_size,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "exhibition_Hall": exhibition_Hall,
      "lift_lobi": lift_lobi,
      "viewing_gallery": viewing_gallery,
      "washroom_ticket_counter": washroom_ticket_counter,
      "washroom_exhibition_hall": washroom_exhibition_hall,
      "washroom_viewing_gallery": washroom_viewing_gallery,
      "username": username,
      "city": city,
      "mobile_no": mobile_no,
      "group_size": group_size,
      "remark": remark
    };
  }

  factory SaveFeedback_b.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_b(
        doc["exhibition_Hall"],
        doc["lift_lobi"],
        doc["viewing_gallery"],
        doc["washroom_ticket_counter"],
        doc["washroom_exhibition_hall"],
        doc["washroom_viewing_gallery"],
        doc['remark'],
        doc['username'],
        doc['city'],
        doc['mobile_no'],
        doc['group_size'],
        doc.reference);
  }
}

class SaveFeedback_c {
  String? body_frisking;
  String? bag_frisking;
  String? behaviour_of_securitystaff;
  String? remarkC;
  DocumentReference? referance;

  SaveFeedback_c(this.body_frisking, this.bag_frisking,
      this.behaviour_of_securitystaff, this.remarkC,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "body_frisking": body_frisking,
      "bag_frisking": bag_frisking,
      "behaviour_of_securitystaff": behaviour_of_securitystaff,
      "remarkC": remarkC,
    };
  }

  factory SaveFeedback_c.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_c(doc["body_frisking"], doc["bag_frisking"],
        doc["behaviour_of_securitystaff"], doc["remarkC"], doc.reference);
  }
}

class SaveFeedback_d {
  String? que_mgt_frisking;
  String? behav_staff_brown_dress;
  String? que_mgt_for_vg;
  String? behav_gr_staff_black_white_dress;
  String? remarkd;
  String? name;
  String? city;
  String? mobileno;
  String? groupsize;
  DocumentReference? referance;

  SaveFeedback_d(
      this.que_mgt_frisking,
      this.behav_staff_brown_dress,
      this.que_mgt_for_vg,
      this.behav_gr_staff_black_white_dress,
      this.name,
      this.city,
      this.mobileno,
      this.groupsize,
      this.remarkd,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "que_mgt_frisking": que_mgt_frisking,
      "behav_staff_brown_dress": behav_staff_brown_dress,
      "que_mgt_for_vg": que_mgt_for_vg,
      "behav_gr_staff_black_white_dress": behav_gr_staff_black_white_dress,
      "name": name,
      "city": city,
      "mobileno": mobileno,
      "groupsize": groupsize,
      "remarkd": remarkd,
    };
  }

  factory SaveFeedback_d.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_d(
        doc["que_mgt_frisking"],
        doc["behav_staff_brown_dress"],
        doc["que_mgt_for_vg"],
        doc["behav_gr_staff_black_white_dress"],
        doc["name"],
        doc["city"],
        doc["mobileno"],
        doc["groupsize"],
        doc["remarkd"],
        doc.reference);
  }
}

class SaveFeedback_e {
  String? travelators_bridge;
  String? escalators;
  String? elevators;
  String? remarke;
  DocumentReference? referance;

  SaveFeedback_e(
      this.travelators_bridge, this.escalators, this.elevators, this.remarke,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "travelators_bridge": travelators_bridge,
      "escalators": escalators,
      "elevators": elevators,
      "remarke": remarke,
    };
  }

  factory SaveFeedback_e.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_e(doc["travelators_bridge"], doc["escalators"],
        doc["elevators"], doc["remarke"], doc.reference);
  }
}

class SaveFeedback_f {
  String? quality_exhibits;
  String? interactiv_equep;
  String? content_exhi;
  String? remarkf;
  DocumentReference? referance;

  SaveFeedback_f(this.quality_exhibits, this.interactiv_equep,
      this.content_exhi, this.remarkf,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "quality_exhibits": quality_exhibits,
      "interactiv_equep": interactiv_equep,
      "content_exhi": content_exhi,
      "remarkf": remarkf,
    };
  }

  factory SaveFeedback_f.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_f(doc["quality_exhibits"], doc["interactiv_equep"],
        doc["content_exhi"], doc["remarkf"], doc.reference);
  }
}

class SaveFeedback_g {
  String? seating_arrangements;
  String? audiovideocontant;
  String? audioquality;
  String? videoquality;
  String? remarkg;
  DocumentReference? referance;

  SaveFeedback_g(this.seating_arrangements, this.audiovideocontant,
      this.audioquality, this.videoquality, this.remarkg,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "seating_arrangements": seating_arrangements,
      "audiovideocontant": audiovideocontant,
      "audioquality": audioquality,
      "videoquality": videoquality,
      "remarkg": remarkg,
    };
  }

  factory SaveFeedback_g.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_g(
        doc["seating_arrangements"],
        doc["audiovideocontant"],
        doc["audioquality"],
        doc['videoquality'],
        doc["remarkg"],
        doc.reference);
  }
}

class SaveFeedback_h {
  String? cafeteria_seating_arrangements;
  String? cleanliness_of_seating_area;
  String? washroom_cleanliness;
  String? other_suggestions;
  String? remarkh;
  DocumentReference? referance;

  SaveFeedback_h(
      this.cafeteria_seating_arrangements,
      this.cleanliness_of_seating_area,
      this.washroom_cleanliness,
      this.other_suggestions,
      this.remarkh,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "cafeteria_seating_arrangements": cafeteria_seating_arrangements,
      "cleanliness_of_seating_area": cleanliness_of_seating_area,
      "washroom_cleanliness": washroom_cleanliness,
      "other_suggestions": other_suggestions,
      "remarkh": remarkh,
    };
  }

  factory SaveFeedback_h.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveFeedback_h(
        doc["cafeteria_seating_arrangements"],
        doc["cleanliness_of_seating_area"],
        doc["washroom_cleanliness"],
        doc['other_suggestions'],
        doc["remarkh"],
        doc.reference);
  }
}
