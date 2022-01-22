import 'package:flutter/material.dart';

abstract class AppDimensions {
  const AppDimensions._();

  static const actionButtonHeight = 48.0;
  static const defaultPaddingAll = EdgeInsets.all(16.0);
  static const defaultPaddingHorizontal = EdgeInsets.symmetric(
    horizontal: 16.0,
  );
  static const defaultPaddingVertical = EdgeInsets.symmetric(
    vertical: 16.0,
  );
  static const locationWeatherForecastCellHeight = 300.0;
}
