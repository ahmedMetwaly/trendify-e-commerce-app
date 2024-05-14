import 'package:flutter/material.dart';
import 'package:shop_app/resources/colors_manager.dart';
import 'package:shop_app/resources/text_manager.dart';

import 'values_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: ColorsManager.primary,
        onPrimary: ColorsManager.onPrimary,
        secondary: ColorsManager.background,
        onSecondary: ColorsManager.background,
        error: ColorsManager.error,
        onError: ColorsManager.error.withOpacity(0.4),
        background: ColorsManager.background,
        onBackground: ColorsManager.background.withOpacity(0.4),
        surface: ColorsManager.black,
        onSurface: ColorsManager.grey,
        inversePrimary: ColorsManager.white,
        outline: ColorsManager.grey,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorsManager.background,
        titleTextStyle: FontManager.getAppBarTextStyle(),
      ),
      textTheme: TextTheme(
        headlineLarge: FontManager.getHeadLineLargeStyle(),
        headlineMedium: FontManager.getHeadLineStyle(),
        headlineSmall: FontManager.getTabBarStyle(),
        bodyMedium: FontManager.getBodyTextStyle(),
        bodyLarge: FontManager.getBodyLargeTextStyle(),
        bodySmall: FontManager.getHintTextStyle(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManager.white,
        labelStyle:
            FontManager.getBodyTextStyle().copyWith(color: ColorsManager.grey),
        hintStyle:
            FontManager.getBodyTextStyle().copyWith(color: ColorsManager.grey),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(SizeManager.borderRadiusOfInputField),
            borderSide: const BorderSide(
              color: ColorsManager.grey,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(SizeManager.borderRadiusOfInputField),
            borderSide: const BorderSide(
              color: ColorsManager.error,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(SizeManager.borderRadiusOfInputField),
            borderSide: const BorderSide(
              color: ColorsManager.grey,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(SizeManager.borderRadiusOfInputField),
            borderSide: const BorderSide(
              color: ColorsManager.error,
            )),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: FontManager.getBodyTextStyle(),
        contentPadding: const EdgeInsets.symmetric(horizontal:  PaddingManager.p10),
        iconColor: ColorsManager.grey,
      ));
}
