import 'dart:io';

import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
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
    final Widget child;
    if (Platform.isIOS) {
      child = _buildCupertinoButton();
    } else {
      child = _buildMaterialButton();
    }
    return Container(
      height: height,
      width: double.infinity,
      decoration: decoration ?? AppDecorations.actionButton(),
      child: child,
    );
  }

  Widget _buildCupertinoButton() {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: _buildButtonChild(),
    );
  }

  Widget _buildMaterialButton() {
    final BorderRadiusGeometry? borderRadius = decoration?.borderRadius ?? AppDecorations.actionButton().borderRadius;
    return MaterialButton(
      height: height,
      elevation: 0.0,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: borderRadius,
            )
          : null,
      child: _buildButtonChild(),
    );
  }

  Widget _buildButtonChild() {
    return Text(
      title.toUpperCase(),
      style: AppTextStyles.actionButton(),
    );
  }
}
