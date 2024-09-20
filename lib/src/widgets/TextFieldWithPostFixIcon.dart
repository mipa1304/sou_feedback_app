// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SOUFEEDBACKAPP/config/app_config.dart';

class TextFieldWithPostFixIcon extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? postfixIcon;
  final String? hinText;
  final FocusNode? focusNode;
  final double postfixIconHeight;
  final double postfixIconWidth;
  final Function? postfixIconTap;
  final Color postfixIconColor;
  final bool obscureText;
  final Function(String str)? onTextChanged;
  final Function(String str2)? onvalidate;
  final List<TextInputFormatter>? textInputFormatters;
  final TextInputType textInputType;
  final int? maxlines;

  const TextFieldWithPostFixIcon(
      {Key? key,
      this.controller,
      this.postfixIcon,
      this.hinText,
      this.focusNode,
      this.postfixIconHeight = 20,
      this.postfixIconWidth = 20,
      required this.postfixIconTap,
      this.postfixIconColor = ThemeColors.iconColor,
      this.obscureText = false,
      this.onTextChanged,
      this.textInputFormatters,
      this.textInputType = TextInputType.text,
      this.maxlines = 4,
      this.onvalidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.07,
      width: size.width * 0.7,
      margin: EdgeInsets.all(4),
      child: TextFormField(
        maxLines: maxlines,
        autofocus: false,
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        onChanged: (String str) => onTextChanged!(str),
        inputFormatters: textInputFormatters,
        keyboardType: textInputType,
        validator: (str) => onvalidate!(str!),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
                width: 5, color: ThemeColors.textBoxOutlineBorderFocus),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                  width: 5, color: ThemeColors.textBoxOutlineBorder)),
          suffixIcon: postfixIcon != null
              ? Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.only(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  child: InkWell(
                    onTap: () => postfixIconTap,
                    child: Icon(
                      postfixIcon,
                      color: postfixIconColor,
                    ),
                  ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          hintText: hinText,
          hintStyle: const TextStyle(
            color: ThemeColors.textBoxOutlineBorder,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
