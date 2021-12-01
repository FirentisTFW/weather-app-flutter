import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppDecorations {
  const AppDecorations._();

  static BoxDecoration actionButton() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      color: AppColors.blue,
    );
  }
}
