import 'package:flutter/material.dart';

Widget _buildSectionHeader(String title) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 15,
        color: Colors.black,
      ),
    ),
  );
}

Widget _buildSingleChoiceRow(
  BuildContext context, {
  required String title,
  required List<String> options,
  required String? selectedValue,
  required ValueChanged<String?> onChanged,
}) {
  return Row(
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
  );
}

Widget _buildRemarksField(
  BuildContext context, {
  required String hintText,
  required ValueChanged<String> onChanged,
}) {
  return TextField(
    maxLines: 3,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}
