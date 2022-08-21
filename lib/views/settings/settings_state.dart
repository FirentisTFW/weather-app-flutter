import 'package:app/data/models/user_settings.dart';
import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsFetchSuccess extends SettingsState {
  final UserSettings userSettings;

  const SettingsFetchSuccess({
    required this.userSettings,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        userSettings,
      ];
}
