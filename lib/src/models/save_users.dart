// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class SaveUsers {
  String? user_name;
  String? user_birth_day;
  String? user_city;
  String? user_gender;
  String? user_mobile_no;
  String? user_group_size;
  String? user_profession;
  DocumentReference? referance;

  SaveUsers(
      this.user_name,
      this.user_birth_day,
      this.user_city,
      this.user_gender,
      this.user_mobile_no,
      this.user_group_size,
      this.user_profession,
      [this.referance]);

  String get userId {
    return referance!.id;
  }

  Map<String, dynamic> toMap() {
    return {
      "user_name": user_name,
      "user_birth_day": user_birth_day,
      "user_city": user_city,
      "user_gender": user_gender,
      "user_mobile_no": user_mobile_no,
      "user_group_size": user_group_size,
      "user_profession": user_profession,
    };
  }

  factory SaveUsers.fromSnapshot(QueryDocumentSnapshot doc) {
    return SaveUsers(
        doc["user_name"],
        doc["user_birth_day"],
        doc["user_city"],
        doc["user_gender"],
        doc["user_mobile_no"],
        doc["user_group_size"],
        doc["user_profession"],
        doc.reference);
  }
}
