import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsFetchInProgress extends SettingsState {
  const SettingsFetchInProgress();
}

class SettingsFetchSuccess extends SettingsState {
  final TemperatureUnit temperatureUnit;
  final TimeFormat timeFormat;

  const SettingsFetchSuccess({
    required this.temperatureUnit,
    required this.timeFormat,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        temperatureUnit,
        timeFormat,
      ];
}
