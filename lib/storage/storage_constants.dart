import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';

abstract class StorageConstants {
  const StorageConstants._();

  static const TemperatureUnit defaultTemperatureUnit = TemperatureUnit.celsius;
  static const TimeFormat defaultTimeFormat = TimeFormat.twentyFourHour;
}
