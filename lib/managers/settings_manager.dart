import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/data/models/user_settings.dart';
import 'package:app/storage/common_storage.dart';

class SettingsManager {
  final CommonStorage storage;

  const SettingsManager(this.storage);

  Future<UserSettings> getUserSettings() async {
    late final TemperatureUnit temperatureUnit;
    late final TimeFormat timeFormat;

    await Future.wait([
      storage.getTemperatureUnit().then((value) => temperatureUnit = value),
      storage.getTimeFormat().then((value) => timeFormat = value),
    ]);

    return UserSettings(
      temperatureUnit: temperatureUnit,
      timeFormat: timeFormat,
    );
  }

  Future<void> setTemperatureUnit(TemperatureUnit unit) => storage.setTemperatureUnit(unit);

  Future<void> setTimeFormat(TimeFormat unit) => storage.setTimeFormat(unit);
}
