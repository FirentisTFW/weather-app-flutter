import 'package:app/commons/text_field_info.dart';
import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextFieldInfo textFieldInfo;
  final String labelText;

  AppTextField({
    required this.textFieldInfo,
    required this.labelText,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldInfo.controller,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        border: inputBorder,
        enabledBorder: inputBorder,
        fillColor: AppColors.white,
        filled: true,
        focusedBorder: inputBorder,
        focusColor: AppColors.black,
        hoverColor: AppColors.black,
        labelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 16.0,
        ),
        labelText: labelText,
      ),
      focusNode: textFieldInfo.focusNode,
    );
  }

  final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );
}
