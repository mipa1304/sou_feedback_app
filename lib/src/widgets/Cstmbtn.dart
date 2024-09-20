// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_import, library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
// import 'package:flutter_mvvm_with_getit/config/app_config.dart';
import 'package:SOUFEEDBACKAPP/config/size_config2.dart';

class CustomBtn extends StatefulWidget {
  double height;
  double width;
  Color btnColor;
  String str;
  Color txtColor;
  double fontSize;
  FontWeight fontWeight;
  void Function() btnPressed;
  Color btnBorderColor;
  double borderRadius;
  CustomBtn({
    Key? key,
    this.height = 0,
    this.width = 0,
    this.btnColor = Colors.grey,
    this.str = "btn",
    this.txtColor = Colors.black87,
    this.fontSize = 8,
    this.fontWeight = FontWeight.normal,
    required this.btnPressed,
    this.btnBorderColor = Colors.amberAccent,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  _CustomBtnState createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.btnPressed,
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.btnColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: widget.btnBorderColor,
            width: 0.3,
          ),
        ),
        child: Text(
          widget.str,
          style: TextStyle(
            color: widget.txtColor,
            fontSize: 12,
            fontWeight: widget.fontWeight,
          ),
        ),
      ),
    );
  }
}
