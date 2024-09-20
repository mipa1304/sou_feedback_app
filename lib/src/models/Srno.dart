// ignore_for_file: file_names

// import 'package:cloud_firestore/cloud_firestore.dart';

class Srno {
  final String srno;
  // final String id;
  // DocumentReference? referance;
  // final String id;

  Srno({
    required this.srno,
  });

  factory Srno.fromMap(Map<String, dynamic> map) {
    return Srno(
      srno: map['sr_no'],
      // id: map[referance!.id.toString()]
    );
  }
}
