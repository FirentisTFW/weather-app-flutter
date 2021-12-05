import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final BoxDecoration? decoration;
  final double height;
  final VoidCallback onPressed;
  final String title;

  const ActionButton({
    this.decoration,
    this.height = AppDimensions.actionButtonHeight,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: decoration ?? AppDecorations.actionButton(),
      child: AdaptiveButton(
        onPressed: onPressed,
        child: _buildButtonChild(),
      ),
    );
  }

  Widget _buildButtonChild() {
    return Text(
      title.toUpperCase(),
      style: AppTextStyles.actionButton(),
    );
  }
}
