import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'visitor_feedback_area.dart';

class VisitorFeedbackService {
  VisitorFeedbackService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  Future<void> submit({
    required VisitorFeedbackArea area,
    required int? rating,
    required String comment,
    required String languageCode,
    required String languageName,
    required String inputMethod,
  }) async {
    final trimmedComment = comment.trim();
    if ((rating == null || rating < 1 || rating > 5) &&
        trimmedComment.isEmpty) {
      throw ArgumentError('Provide a rating or a comment.');
    }
    if (rating != null && (rating < 1 || rating > 5)) {
      throw ArgumentError.value(rating, 'rating', 'Must be between 1 and 5.');
    }
    if (trimmedComment.length > 2000) {
      throw ArgumentError.value(
        comment,
        'comment',
        'Must be 2000 characters or fewer.',
      );
    }
    if (!const {'en', 'hi', 'gu', 'ta'}.contains(languageCode)) {
      throw ArgumentError.value(languageCode, 'languageCode');
    }
    if (!const {'typed', 'voice', 'mixed'}.contains(inputMethod)) {
      throw ArgumentError.value(inputMethod, 'inputMethod');
    }

    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
    if (_auth.currentUser == null) {
      throw StateError('Anonymous sign-in did not return a user.');
    }

    await _firestore.collection('VisitorFeedback').add({
      'areaId': area.id,
      'areaName': area.name,
      'rating': rating,
      'comment': trimmedComment,
      'languageCode': languageCode,
      'languageName': languageName,
      'inputMethod': inputMethod,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
