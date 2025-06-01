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
