import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  // TODO Add functionality, finish styles
  const AppCheckbox();

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.square(26.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: const Icon(
          Icons.check,
        ),
      ),
    );
  }
}
