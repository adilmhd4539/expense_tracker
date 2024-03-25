import 'package:expense_tracker/resorses/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle get subjectIConTextStyle => const TextStyle(
      color: AppColors.white,
      fontSize: 8.16,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w700);
  static TextStyle get bodySmallNormal => const TextStyle(
      color: AppColors.black, fontSize: 10, fontWeight: FontWeight.w400);
  static TextStyle get bodySmallBold => const TextStyle(
      color: AppColors.black, fontSize: 10, fontWeight: FontWeight.w700);
  static TextStyle get bodyNormal => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.black);
  static TextStyle get bodyMedium => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black);
  static TextStyle get bodySemiBold => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.black);
  static TextStyle get bodyBold => const TextStyle(
      color: AppColors.black, fontSize: 12, fontWeight: FontWeight.w700);
  static TextStyle get bodyLargeNormal => const TextStyle(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle get bodyLargeMedium => const TextStyle(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle get bodyLargeBold => const TextStyle(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle get largeNormal => const TextStyle(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle get largeSemiBold => const TextStyle(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle get largeBold => const TextStyle(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle get extralargeBold => const TextStyle(
      color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle get subTitle => const TextStyle(
      color: AppColors.black, fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle get title => const TextStyle(
      fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.black);
}
