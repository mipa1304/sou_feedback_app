import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'visitor_feedback_area.dart';

class AreaQrScannerScreen extends StatefulWidget {
  const AreaQrScannerScreen({Key? key}) : super(key: key);

  @override
  State<AreaQrScannerScreen> createState() => _AreaQrScannerScreenState();
}

class _AreaQrScannerScreenState extends State<AreaQrScannerScreen> {
  final MobileScannerController _controller = MobileScannerController();
  bool _handledScan = false;
  bool _shownInvalidCodeMessage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_handledScan) return;

    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;
      if (value == null) continue;

      final area = VisitorFeedbackArea.fromQrPayload(value);
      if (area != null) {
        _handledScan = true;
        Navigator.of(context).pop(area);
        return;
      }
    }

    if (!_shownInvalidCodeMessage && mounted) {
      _shownInvalidCodeMessage = true;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This QR code is not for a visitor feedback area.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan area QR code')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
            errorBuilder: (context, error, child) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Camera unavailable (${error.errorCode.name}). '
                  'Check camera permission, or go back and choose an area manually.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Center(
              child: Container(
                width: 260,
                height: 210,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 24,
            right: 24,
            bottom: 32,
            child: Text(
              'Point your camera at the QR code displayed in this area.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                shadows: [Shadow(blurRadius: 6, color: Colors.black)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
