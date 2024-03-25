import 'package:expense_tracker/resorses/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_textstyles.dart';

class AppTheme {
  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
      elevation: 0,
      disabledForegroundColor: AppColors.white,
      backgroundColor: AppColors.blue,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: AppColors.white,
      minimumSize: const Size(0, 55),
      textStyle: AppTextStyles.bodyLargeBold,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      contentPadding: const EdgeInsets.all(15),
      focusedErrorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.red)),
      disabledBorder: inputBorder,
      border: inputBorder,
      errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.red)),
      enabledBorder: inputBorder,
      focusedBorder: inputBorder);
  static ThemeData appTheme = ThemeData(
      primaryColor: AppColors.blue,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle));
}
