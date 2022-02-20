import 'package:flutter/material.dart';

class TextFieldInfo {
  final TextEditingController controller;
  final FocusNode focusNode;

  const TextFieldInfo({
    required this.controller,
    required this.focusNode,
  });

  String get text => controller.text;

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
