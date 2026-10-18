import 'package:flutter/material.dart';

import 'area_qr_codes_screen.dart';
import 'area_qr_scanner_screen.dart';
import 'visitor_feedback_area.dart';
import 'visitor_feedback_form_screen.dart';

class VisitorFeedbackHomeScreen extends StatelessWidget {
  const VisitorFeedbackHomeScreen({Key? key}) : super(key: key);

  Future<void> _openForm(
    BuildContext context,
    VisitorFeedbackArea area,
  ) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => VisitorFeedbackFormScreen(area: area),
      ),
    );
  }

  Future<void> _scanCode(BuildContext context) async {
    final area = await Navigator.of(context).push<VisitorFeedbackArea>(
      MaterialPageRoute<VisitorFeedbackArea>(
        builder: (_) => const AreaQrScannerScreen(),
      ),
    );
    if (area != null && context.mounted) {
      await _openForm(context, area);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick visitor feedback'),
        actions: [
          IconButton(
            tooltip: 'Area QR codes',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const AreaQrCodesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.qr_code_2),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.location_on_outlined, size: 52),
          const SizedBox(height: 12),
          Text(
            'Tell us about this area',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'Scan the QR code displayed nearby, or choose the area below.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: () => _scanCode(context),
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Scan area QR code'),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Choose an area',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          for (final area in VisitorFeedbackArea.all)
            Card(
              child: ListTile(
                leading: Icon(area.icon),
                title: Text(area.name),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openForm(context, area),
              ),
            ),
        ],
      ),
    );
  }
}
