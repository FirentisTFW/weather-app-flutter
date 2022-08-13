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
    state = const SettingsFetchInProgress();

    // TODO Get real values from storage and remove mocks

    state = const SettingsFetchSuccess(
      temperatureUnit: TemperatureUnit.celsius,
      timeFormat: TimeFormat.twentyFourHour,
    );
  }

  Future<void> changeTemperatureUnit(TemperatureUnit newValue) async {
    final SettingsState entryState = state;
    if (entryState is! SettingsFetchSuccess) return Future.value();

    // TODO Save changes to storage

    state = SettingsFetchSuccess(
      temperatureUnit: newValue,
      timeFormat: entryState.timeFormat,
    );
  }

  Future<void> changeTimeFormat(TimeFormat newValue) async {
    final SettingsState entryState = state;
    if (entryState is! SettingsFetchSuccess) return Future.value();

    // TODO Save changes to storage

    state = SettingsFetchSuccess(
      temperatureUnit: entryState.temperatureUnit,
      timeFormat: newValue,
    );
  }
}
