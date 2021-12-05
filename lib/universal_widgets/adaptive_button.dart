import 'dart:io';

import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final double height;
  final VoidCallback onPressed;

  const AdaptiveButton({
    required this.child,
    this.decoration,
    this.height = AppDimensions.actionButtonHeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (Platform.isIOS) {
      child = _buildCupertinoButton();
    } else {
      child = _buildMaterialButton();
    }

    return _buildButtonContainer(
      child: child,
    );
  }

  Widget _buildCupertinoButton() {
    return Container(
      height: height == double.infinity ? null : height,
      decoration: decoration,
      padding: EdgeInsets.zero,
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: child,
      ),
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
      child: child,
    );
  }

  Widget _buildButtonContainer({
    required Widget child,
  }) {
    return Container(
      height: height == double.infinity ? null : height,
      decoration: decoration,
      padding: EdgeInsets.zero,
      child: child,
    );
  }
}
