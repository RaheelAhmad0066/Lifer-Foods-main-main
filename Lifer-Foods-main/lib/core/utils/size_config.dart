import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void initSizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateHeight(
  double px, {
  double figmaHeight = 844,
}) {
  // Calculate the proportional height based on the figmaHeight and current screen height
  return (px / figmaHeight.sp) * SizeConfig.screenHeight;
}

double getProportionateWidth(
  double px, {
  double figmaWidth = 390,
}) {
  // Calculate the proportional width based on the figmaWidth and current screen width
  return (px / figmaWidth.sp) * SizeConfig.screenWidth;
}
