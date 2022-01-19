import 'package:flutter/material.dart';

class TextFieldInfo {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;

  const TextFieldInfo({
    required this.controller,
    required this.focusNode,
    required this.labelText,
  });

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
