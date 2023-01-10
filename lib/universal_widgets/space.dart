import 'package:flutter/widgets.dart';

class Space extends SizedBox {
  // ignore: unused_element
  const Space._();

  const Space.horizontal(double width)
      : super(
          width: width,
        );

  const Space.vertical(double height)
      : super(
          height: height,
        );
}
