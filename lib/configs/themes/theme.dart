import 'package:flutter/material.dart';
import 'package:task_management_app/shared/styles/app_color.dart';
import 'package:task_management_app/shared/styles/app_text_style.dart';

class AppTheme {
  ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColor.primaryYellowColor,
      scaffoldBackgroundColor: AppColor.primaryBackgroundLight,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.primaryYellowColor,
        onPrimary: AppColor.black,
        secondary: AppColor.brownDark1,
        onSecondary: AppColor.white,
        error: AppColor.danger1,
        onError: AppColor.white,
        surface: AppColor.grey1,
        onSurface: AppColor.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primaryBackgroundLight,
        foregroundColor: AppColor.black,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: const CardThemeData(
        color: AppColor.secondarybackgroundLight,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyle.heading1(color: AppColor.black),
        headlineMedium: AppTextStyle.heading2(color: AppColor.black),
        headlineSmall: AppTextStyle.heading3(color: AppColor.black),
        bodyLarge: AppTextStyle.body1(color: AppColor.brownDark1),
        bodyMedium: AppTextStyle.body2(color: AppColor.brownDark1),
        bodySmall: AppTextStyle.body3(color: AppColor.brownDark1),
        displayLarge: AppTextStyle.description1(color: AppColor.grey1),
        displayMedium: AppTextStyle.description2(color: AppColor.grey1),
        displaySmall: AppTextStyle.description3(color: AppColor.grey1),
      ),
    );
  }

  ThemeData darkThemeData(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColor.primaryYellowColor,
      scaffoldBackgroundColor: AppColor.primaryBackgroundDark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColor.primaryYellowColor,
        onPrimary: AppColor.black,
        secondary: AppColor.brownDark2,
        onSecondary: AppColor.white,
        error: AppColor.danger1,
        onError: AppColor.white,
        surface: AppColor.grey2,
        onSurface: AppColor.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primaryBackgroundDark,
        foregroundColor: AppColor.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: const CardThemeData(
        color: AppColor.secondaryBackgroundDark,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyle.heading1(color: AppColor.white),
        headlineMedium: AppTextStyle.heading2(color: AppColor.white),
        headlineSmall: AppTextStyle.heading3(color: AppColor.white),
        bodyLarge: AppTextStyle.body1(color: AppColor.brownDark1),
        bodyMedium: AppTextStyle.body2(color: AppColor.brownDark1),
        bodySmall: AppTextStyle.body3(color: AppColor.brownDark1),
        displayLarge: AppTextStyle.description1(color: AppColor.grey1),
        displayMedium: AppTextStyle.description2(color: AppColor.grey1),
        displaySmall: AppTextStyle.description3(color: AppColor.grey1),
      ),
    );
  }
}
