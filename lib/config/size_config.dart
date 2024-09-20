// ignore_for_file: unused_field, avoid_print

import 'package:flutter/widgets.dart';

class SizeConfig {
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

    _safeAreaWidth = safeAreaBox.maxWidth;
    _safeAreaHeight = safeAreaBox.maxHeight;
    _safeBlockHorizontal = _safeAreaWidth! / 100;
    _safeBlockVertical = _safeAreaHeight! / 100;

    print("======> $_safeBlockHorizontal");

    _textScaleFactor = _mediaQueryData!.textScaleFactor;
  }

  static Widget verticalSpacer(double multiplier) {
    return SizedBox(
      height: _safeBlockVertical! * multiplier,
    );
  }

  static Widget horizontalSpacer(double multiplier) {
    return SizedBox(
      width: _safeBlockHorizontal! * multiplier,
    );
  }

  static double relativeHeight(double multiplier) {
    return screenHeight! * multiplier;
  }

  static double relativeWidth(double multiplier) {
    return screenWidth! * multiplier;
  }

  static double relativeSize(double multiplier) {
    return (_safeBlockVertical! / _safeBlockHorizontal!) * multiplier;
  }

  static double? _textScaleFactor;
  static num uiWidthPx = 1920;
  // static num uiHeightPx = 812;
  static num uiHeightPx = 400;
  static bool allowFontScaling = true;

  static double get scaleWidth => screenWidth! / uiWidthPx;

  static double get scaleHeight => screenHeight! / uiHeightPx;

  static double get scaleText => scaleWidth;

  static double setSp(double fontSize) => (allowFontScaling
      ? (fontSize * scaleText)
      : ((fontSize * scaleText) / _textScaleFactor!));
}
