import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/storage/common_storage.dart';
import 'package:app/views/settings/settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(
    storage: ref.read(storageProvider),
  ),
);

class SettingsNotifier extends StateNotifier<SettingsState> {
  final CommonStorage storage;

  SettingsNotifier({
    required this.storage,
  }) : super(
          const SettingsInitial(),
        );

  Future<void> getSettings() async {
    late final TemperatureUnit temperatureUnit;
    late final TimeFormat timeFormat;

    await Future.wait([
      storage.getTemperatureUnit().then((value) => temperatureUnit = value),
      storage.getTimeFormat().then((value) => timeFormat = value),
    ]);

    state = SettingsFetchSuccess(
      temperatureUnit: temperatureUnit,
      timeFormat: timeFormat,
    );
  }

  Future<void> changeTemperatureUnit(TemperatureUnit newValue) async {
    final SettingsState entryState = state;
    if (entryState is! SettingsFetchSuccess) return Future.value();

    await storage.setTemperatureUnit(newValue);

    state = SettingsFetchSuccess(
      temperatureUnit: newValue,
      timeFormat: entryState.timeFormat,
    );
  }

  Future<void> changeTimeFormat(TimeFormat newValue) async {
    final SettingsState entryState = state;
    if (entryState is! SettingsFetchSuccess) return Future.value();

    await storage.setTimeFormat(newValue);

    state = SettingsFetchSuccess(
      temperatureUnit: entryState.temperatureUnit,
      timeFormat: newValue,
    );
  }
}
