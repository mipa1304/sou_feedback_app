// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class SizeConfig3 {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? _blockSizeHorizontal;
  static double? _blockSizeVertical;

  static double? _safeAreaWidth;
  static double? _safeAreaHeight;
  static double? _safeBlockHorizontal;
  static double? _safeBlockVertical;

  void init(BuildContext context, BoxConstraints safeAreaBox) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;

    _blockSizeHorizontal = screenWidth! / 100;
    _blockSizeVertical = screenHeight! / 100;

    _safeAreaHeight = safeAreaBox.maxHeight;
    _safeAreaWidth = safeAreaBox.maxWidth;
    _safeBlockHorizontal = _safeAreaWidth! / 100;
    _safeBlockVertical = _safeAreaHeight! / 100;
  }

  static double relativeHeight(double multiplier) {
    return screenHeight! * multiplier;
  }

  static double relativeWidth(double multiplier) {
    return screenWidth! * multiplier;
  }
}
