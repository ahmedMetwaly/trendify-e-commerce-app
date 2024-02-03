import 'package:flutter/material.dart';
import 'package:shop_app/resources/colors_manager.dart';

import 'values_manager.dart';

class FontManager {
  static TextStyle _getTextStyle(double fontSize,
      {Color color = ColorsManager.black,
      String fontFamily = "Metropolis",
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight);
  }

  static TextStyle getHeadLineLargeStyle() =>
      _getTextStyle(
        
        SizeManager.headLineTextSize,
          fontFamily: "ArchivoBlack",
          fontWeight: FontWeight.w900, color: ColorsManager.white);

  static TextStyle getHeadLineStyle() =>
      _getTextStyle(SizeManager.headLineTextSize, fontWeight: FontWeight.w800);
  static TextStyle getAppBarTextStyle() =>
      _getTextStyle(SizeManager.appBarTextSize);
  static TextStyle getErrorTextStyle() =>
      _getTextStyle(SizeManager.errorTextSize, color: ColorsManager.error);
  static TextStyle getBodyTextStyle() =>
      _getTextStyle(SizeManager.bodyTextSize);
  static TextStyle getBodyLargeTextStyle() =>
      _getTextStyle(SizeManager.bodyLargeTextSize, color: ColorsManager.white);

  static TextStyle getHintTextStyle() =>
      _getTextStyle(SizeManager.bodyTextSize, color: ColorsManager.grey);
}
