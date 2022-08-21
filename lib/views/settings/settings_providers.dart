import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/data/models/user_settings.dart';
import 'package:app/managers/settings_manager.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/views/settings/settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(
    settingsManager: SettingsManager(ref.watch(storageProvider)),
  ),
);

class SettingsNotifier extends StateNotifier<SettingsState> {
  final SettingsManager settingsManager;

  SettingsNotifier({
    required this.settingsManager,
  }) : super(
          const SettingsInitial(),
        );

  Future<void> getSettings() async {
    final UserSettings userSettings = await settingsManager.provideUserSettings();

    state = SettingsFetchSuccess(
      userSettings: userSettings,
    );
  }

  Future<void> changeTemperatureUnit(TemperatureUnit newValue) async {
    final SettingsState entryState = state;
    if (entryState is! SettingsFetchSuccess) return Future.value();

    await settingsManager.setTemperatureUnit(newValue);

    state = SettingsFetchSuccess(
      userSettings: entryState.userSettings.copyWith(
        temperatureUnit: newValue,
      ),
    );
  }

  Future<void> changeTimeFormat(TimeFormat newValue) async {
    final SettingsState entryState = state;
    if (entryState is! SettingsFetchSuccess) return Future.value();

    await settingsManager.setTimeFormat(newValue);

    state = SettingsFetchSuccess(
      userSettings: entryState.userSettings.copyWith(
        timeFormat: newValue,
      ),
    );
  }
}
