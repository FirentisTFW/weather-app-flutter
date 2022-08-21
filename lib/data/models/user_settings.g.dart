// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserSettingsCWProxy {
  UserSettings temperatureUnit(TemperatureUnit temperatureUnit);

  UserSettings timeFormat(TimeFormat timeFormat);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  UserSettings call({
    TemperatureUnit? temperatureUnit,
    TimeFormat? timeFormat,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserSettings.copyWith.fieldName(...)`
class _$UserSettingsCWProxyImpl implements _$UserSettingsCWProxy {
  final UserSettings _value;

  const _$UserSettingsCWProxyImpl(this._value);

  @override
  UserSettings temperatureUnit(TemperatureUnit temperatureUnit) =>
      this(temperatureUnit: temperatureUnit);

  @override
  UserSettings timeFormat(TimeFormat timeFormat) =>
      this(timeFormat: timeFormat);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  UserSettings call({
    Object? temperatureUnit = const $CopyWithPlaceholder(),
    Object? timeFormat = const $CopyWithPlaceholder(),
  }) {
    return UserSettings(
      temperatureUnit: temperatureUnit == const $CopyWithPlaceholder() ||
              temperatureUnit == null
          ? _value.temperatureUnit
          // ignore: cast_nullable_to_non_nullable
          : temperatureUnit as TemperatureUnit,
      timeFormat:
          timeFormat == const $CopyWithPlaceholder() || timeFormat == null
              ? _value.timeFormat
              // ignore: cast_nullable_to_non_nullable
              : timeFormat as TimeFormat,
    );
  }
}

extension $UserSettingsCopyWith on UserSettings {
  /// Returns a callable class that can be used as follows: `instanceOfUserSettings.copyWith(...)` or like so:`instanceOfUserSettings.copyWith.fieldName(...)`.
  _$UserSettingsCWProxy get copyWith => _$UserSettingsCWProxyImpl(this);
}
