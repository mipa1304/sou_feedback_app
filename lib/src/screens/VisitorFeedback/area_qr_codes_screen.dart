import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'visitor_feedback_area.dart';

class AreaQrCodesScreen extends StatelessWidget {
  const AreaQrCodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Area QR codes')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Display or print the matching code in each visitor area.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          for (final area in VisitorFeedbackArea.all)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    QrImageView(
                      data: area.qrPayload,
                      version: QrVersions.auto,
                      size: 128,
                      errorCorrectionLevel: QrErrorCorrectLevel.M,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        area.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
