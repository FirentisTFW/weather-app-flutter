import 'package:app/styles/app_dimensions.dart';
import 'package:flutter/material.dart';

class BasicBottomSheet {
  final BuildContext context;
  final Widget child;

  const BasicBottomSheet(
    this.context, {
    required this.child,
  });

  Future<void> show() {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: AppDimensions.defaultPaddingAll,
            child: child,
          ),
        );
      },
    );
  }
}
