import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? textScaleFactor;
  static double? defaultSize;
  static EdgeInsets? paddings;
  static Orientation? orientation;

  // Baseline for Pixel 7 (logical pixels / dp)
  static const double baseWidth = 412.0;
  static const double baseHeight = 915.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
    textScaleFactor = _mediaQueryData?.textScaleFactor;
    paddings = _mediaQueryData?.padding;
  }
}

double heightFlex(
    Orientation orientation, double heightLandcape, double heightPotrate) {
  double height = 0;
  (orientation == Orientation.landscape)
      ? height = SizeConfig.screenHeight! / heightLandcape
      : height = SizeConfig.screenHeight! / heightPotrate;
  return (height);
}

double heightfit(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  return (inputHeight / SizeConfig.baseHeight) * screenHeight!;
}

double widthfit(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  return (inputWidth / SizeConfig.baseWidth) * screenWidth!;
}

double getScaledOrMaxSize(double textSize, double maxScaleFactor) {
  return SizeConfig.textScaleFactor! > maxScaleFactor
      ? textSize * maxScaleFactor / SizeConfig.textScaleFactor!
      : textSize;
}

double getFixedSize(double textSize) {
  return SizeConfig.textScaleFactor != 1.0
      ? textSize / SizeConfig.textScaleFactor!
      : textSize;
}
