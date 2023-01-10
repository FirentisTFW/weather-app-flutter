import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class SnackbarFactory {
  const SnackbarFactory._();

  static void showSnackbarWithButton(
    BuildContext context, {
    required String buttonTitle,
    required String message,
    required VoidCallback onButtonPressed,
  }) {
    _showSnackbar(
      context,
      content: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.information(),
            ),
          ),
          const Space.horizontal(8.0),
          GestureDetector(
            onTap: onButtonPressed,
            child: Text(
              buttonTitle,
              style: AppTextStyles.header(),
            ),
          ),
        ],
      ),
    );
  }

  static void _showSnackbar(
    BuildContext context, {
    required Widget content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.lightYellow,
        behavior: SnackBarBehavior.floating,
        content: content,
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }
}
