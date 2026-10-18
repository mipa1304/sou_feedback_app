import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sou_feedback_app/src/screens/VisitorFeedback/visitor_feedback_area.dart';

void main() {
  group('VisitorFeedbackArea QR payloads', () {
    test('round-trips a generated area QR payload', () {
      const expected = VisitorFeedbackArea(
        id: 'viewing_gallery',
        name: 'Viewing Gallery',
        icon: Icons.landscape_outlined,
      );

      expect(
        VisitorFeedbackArea.fromQrPayload(expected.qrPayload)?.id,
        expected.id,
      );
    });

    test('accepts an area slug for manually generated QR codes', () {
      expect(
        VisitorFeedbackArea.fromQrPayload('cafeteria')?.name,
        'Cafeteria',
      );
    });

    test('rejects unknown or unrelated QR payloads', () {
      expect(VisitorFeedbackArea.fromQrPayload('unknown_area'), isNull);
      expect(
        VisitorFeedbackArea.fromQrPayload('https://example.com/feedback'),
        isNull,
      );
    });
  });
}
