import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppDecorations {
  const AppDecorations._();

  static BoxDecoration actionButton() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      color: AppColors.lightBrown,
    );
  }

  static BoxDecoration defaultCell() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      boxShadow: [
        BoxShadow(
          blurRadius: 10.0,
          color: AppColors.grey.withOpacity(0.1),
          spreadRadius: 0.1,
        ),
      ],
      color: AppColors.white,
    );
  }
}
