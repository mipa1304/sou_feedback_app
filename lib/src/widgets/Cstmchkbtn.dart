import 'package:flutter/material.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;

  const CustomCheckBox({Key? key, required this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return isChecked
        ? Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              height: size.height * 0.7,
              width: size.width * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                border: Border.all(
                  color: const Color(0xffcfcfcf),
                  width: 0.7586206896551724,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: ThemeColors.appPrimaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              height: size.height * 0.7,
              width: size.width * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                border: Border.all(
                  color: const Color(0xffcfcfcf),
                  width: 0.7586206896551724,
                ),
              ),
            ),
          );
  }
}
