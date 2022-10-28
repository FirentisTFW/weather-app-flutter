import 'dart:convert';

import 'package:app/commons/collections.dart';
import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/storage/storage.dart';
import 'package:app/storage/storage_constants.dart';
import 'package:app/storage/storage_keys.dart';
import 'package:hive/hive.dart';

class CommonStorage {
  final Storage storage = const Storage();

  Future<Box> get locationsBox async => storage.getBox(
        storageKey: StorageKeys.locationsBox,
      );

  Future<Box> get settingsBox async => storage.getBox(
        storageKey: StorageKeys.settingsBox,
      );

  Future<void> addLocation(NamedLocation location) async {
    final List<NamedLocation> existingLocations = await getLocations();
    await (await locationsBox).put(
      StorageKeys.locationsList,
      [
        ...existingLocations,
        location,
      ],
    );
  }

  Future<void> deleteLocation(String locationId) async {
    final List<NamedLocation> existingLocations = await getLocations();
    final List<NamedLocation> updatedLocations =
        existingLocations.where((location) => location.id != locationId).toList();
    await (await locationsBox).put(
      StorageKeys.locationsList,
      updatedLocations,
    );
  }

  Future<List<LocationWeatherData>?> getCachedWeatherAndForecastForSelectedLocations() async {
    final String? firstLocationJson = await storage.getString(StorageKeys.cachedWeatherAndForecast1);
    final String? secondLocationJson = await storage.getString(StorageKeys.cachedWeatherAndForecast2);
    if (firstLocationJson == null || secondLocationJson == null) return null;
    return [
      LocationWeatherData.fromJson(jsonDecode(firstLocationJson) as Map<String, dynamic>),
      LocationWeatherData.fromJson(jsonDecode(secondLocationJson) as Map<String, dynamic>),
    ];
  }

  Future<List<NamedLocation>> getLocations() async {
    final list = (await locationsBox).get(StorageKeys.locationsList) ?? [];
    return (list as List).cast<NamedLocation>();
  }

  Future<List<NamedLocation>> getSelectedLocations() async {
    final List<NamedLocation> allLocations = await getLocations();
    final List<NamedLocation> homeLocations = allLocations.where((location) => location.showOnHomeScreen).toList();
    if (homeLocations.length < 2) {
      return homeLocations;
    }
    return homeLocations.sublist(0, 2);
  }

  Future<TemperatureUnit> getTemperatureUnit() async {
    final temperatureUnit =
        (await settingsBox).get(StorageKeys.temperatureUnit) ?? StorageConstants.defaultTemperatureUnit;
    return temperatureUnit as TemperatureUnit;
  }

  Future<TimeFormat> getTimeFormat() async {
    final timeFormat = (await settingsBox).get(StorageKeys.timeFormat) ?? StorageConstants.defaultTimeFormat;
    return timeFormat as TimeFormat;
  }

  Future<void> selectLocation(String locationId) async {
    _updateLocationShowOnHomeScreenProperty(
      locationId: locationId,
      showOnHomeScreen: true,
    );
  }

  Future<void> setCachedWeatherAndForecastForSelectedLocations(CollectionOf2<LocationWeatherData> data) async {
    final String firstLoationJson = jsonEncode(data.item1);
    final String secondLocationJson = jsonEncode(data.item2);
    await Future.wait([
      storage.putString(
        key: StorageKeys.cachedWeatherAndForecast1,
        value: firstLoationJson,
      ),
      storage.putString(
        key: StorageKeys.cachedWeatherAndForecast2,
        value: secondLocationJson,
      ),
    ]);
  }

  Future<void> setTemperatureUnit(TemperatureUnit unit) async {
    await (await settingsBox).put(StorageKeys.temperatureUnit, unit);
  }

  Future<void> setTimeFormat(TimeFormat format) async {
    await (await settingsBox).put(StorageKeys.timeFormat, format);
  }

  Future<void> unselectLocation(String locationId) async {
    _updateLocationShowOnHomeScreenProperty(
      locationId: locationId,
      showOnHomeScreen: false,
    );
  }

  Future<void> _updateLocationShowOnHomeScreenProperty({
    required String locationId,
    required bool showOnHomeScreen,
  }) async {
    final List<NamedLocation> existingLocations = await getLocations();
    final NamedLocation locationToSelect = existingLocations.firstWhere((location) => location.id == locationId);
    final int locationToSelectIndex = existingLocations.indexOf(locationToSelect);
    final List<NamedLocation> updatedLocations = existingLocations
      ..replaceRange(
        locationToSelectIndex,
        locationToSelectIndex + 1,
        [
          locationToSelect.copyWith(
            showOnHomeScreen: showOnHomeScreen,
          ),
        ],
      );
    await (await locationsBox).put(
      StorageKeys.locationsList,
      updatedLocations,
    );
  }
}
