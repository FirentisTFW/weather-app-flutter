import 'package:app/networking/api_constants.dart';
import 'package:app/storage/hive_type_ids.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'temperature_unit.g.dart';

@HiveType(typeId: HiveTypeIds.temperatureUnit)
enum TemperatureUnit {
  @HiveField(
    0,
    defaultValue: true,
  )
  celsius,
  @HiveField(1)
  fahrenheit,
}

extension TemperatureUnitExtension on TemperatureUnit {
  String get apiParameterValue {
    switch (this) {
      case TemperatureUnit.celsius:
        return ApiConstants.parameterValues.unitsMetric;
      case TemperatureUnit.fahrenheit:
        return ApiConstants.parameterValues.unitsImperial;
    }
  }

  String getUnitDisplay(BuildContext context) {
    switch (this) {
      case TemperatureUnit.celsius:
        return 'C';
      case TemperatureUnit.fahrenheit:
        return 'F';
    }
  }
}
