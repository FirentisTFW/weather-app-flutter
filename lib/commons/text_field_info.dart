import 'package:flutter/material.dart';

class TextFieldInfo {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  TextFieldInfo();

  String get text => controller.text;

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
