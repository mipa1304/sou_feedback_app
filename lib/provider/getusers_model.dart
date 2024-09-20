// ignore_for_file: await_only_futures, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:SOUFEEDBACKAPP/src/models/save_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersViewModel {
  final SaveUsers users;
  UsersViewModel({required this.users});

  String? get userId {
    return users.userId;
  }

  String? get name {
    return users.user_name;
  }

  String? get mobileNo {
    return users.user_mobile_no;
  }

  String? get Bday {
    return users.user_birth_day;
  }

  String? get city {
    return users.user_city;
  }

  String? get gender {
    return users.user_gender;
  }

  String? get grupsize {
    return users.user_group_size;
  }

  String? get profession {
    return users.user_profession;
  }

  Future<int> get itemsCountAsync async {
    final data = await users.referance!.collection('Users');
    return data.doc().snapshots().length;
  }

  factory UsersViewModel.fromSnapshot(QueryDocumentSnapshot doc) {
    final user = SaveUsers.fromSnapshot(doc);
    return UsersViewModel(users: user);
  }
}
