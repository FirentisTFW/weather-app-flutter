import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const String robotoFontFamily = 'Roboto';

  static const String fontFamily = robotoFontFamily;

  const AppTextStyles._();

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
