import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String robotoFontFamily = 'Roboto';

  static const String fontFamily = robotoFontFamily;

  static TextStyle actionButton() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle header() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle text() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle title() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
    );
  }
}
