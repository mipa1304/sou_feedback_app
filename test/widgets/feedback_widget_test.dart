import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sou_feedback_app/src/screens/FeedbackForm/feedback.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget singleChoiceRow(
    BuildContext context, {
    required String title,
    required List<String> options,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text("Select"),
              isExpanded: true,
              items: options.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionHeader(String title, VoidCallback? onPressed) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(3),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: Colors.black,
              ),
              softWrap: true,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: CircleBorder(),
            ),
            onPressed: onPressed,
            child: Icon(
              Icons.volume_up,
              color: const Color.fromARGB(255, 10, 10, 10),
            ),
          ),
        ],
      ),
    );
  }

  testWidgets('_buildSectionHeader shows title and volume icon',
      (WidgetTester tester) async {
    final widget =
        MaterialApp(home: Scaffold(body: sectionHeader('My Title', () {})));

    await tester.pumpWidget(widget);

    expect(find.text('My Title'), findsOneWidget);
    expect(find.byIcon(Icons.volume_up), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('_buildSingleChoiceRow contains DropdownButton and title',
      (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return singleChoiceRow(
            context,
            title: 'Select One',
            options: ['One', 'Two'],
            selectedValue: null,
            onChanged: (v) {},
          );
        }),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.text('Select One'), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsOneWidget);
  });
}
