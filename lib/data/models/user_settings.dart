import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user_settings.g.dart';

@CopyWith()
class UserSettings {
  final TemperatureUnit temperatureUnit;
  final TimeFormat timeFormat;

  const UserSettings({
    required this.temperatureUnit,
    required this.timeFormat,
  });
}
