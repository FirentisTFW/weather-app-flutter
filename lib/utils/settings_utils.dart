import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';

class SettingsUtils {
  const SettingsUtils._();

  static List<TemperatureUnit> provideAvailableTemperatureUnits() => const [
        TemperatureUnit.celsius,
        TemperatureUnit.fahrenheit,
      ];

  static List<TimeFormat> provideAvailableTimeFormats() => const [
        TimeFormat.twelveHour,
        TimeFormat.twentyFourHour,
      ];
}
