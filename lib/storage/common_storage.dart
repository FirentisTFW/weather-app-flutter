import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/storage/storage.dart';
import 'package:app/storage/storage_constants.dart';
import 'package:app/storage/storage_keys.dart';
import 'package:hive/hive.dart';

class CommonStorage {
  final Storage storage = Storage();

  Future<Box> get locationsBox async => storage.getBox(
        storageKey: StorageKeys.locationsBoxKey,
      );

  Future<Box> get settingsBox async => storage.getBox(
        storageKey: StorageKeys.settingsBoxKey,
      );

  Future<void> addLocation(NamedLocation location) async {
    final List<NamedLocation> existingLocations = await getLocations();
    await (await locationsBox).put(
      StorageKeys.locationsListKey,
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
      StorageKeys.locationsListKey,
      updatedLocations,
    );
  }

  Future<List<NamedLocation>> getSelectedLocations() async {
    final List<NamedLocation> allLocations = await getLocations();
    final List<NamedLocation> homeLocations = allLocations.where((location) => location.showOnHomeScreen).toList();
    if (homeLocations.length < 2) {
      return homeLocations;
    }
    return homeLocations.sublist(0, 2);
  }

  Future<List<NamedLocation>> getLocations() async {
    final list = (await locationsBox).get(StorageKeys.locationsListKey) ?? [];
    return (list as List).cast<NamedLocation>();
  }

  Future<TemperatureUnit> getTemperatureUnit() async {
    final temperatureUnit =
        (await settingsBox).get(StorageKeys.temperatureUnitKey) ?? StorageConstants.defaultTemperatureUnit;
    return temperatureUnit as TemperatureUnit;
  }

  Future<TimeFormat> getTimeFormat() async {
    final timeFormat = (await settingsBox).get(StorageKeys.timeFormatKey) ?? StorageConstants.defaultTimeFormat;
    return timeFormat as TimeFormat;
  }

  Future<void> selectLocation(String locationId) async {
    _updateLocationShowOnHomeScreenProperty(
      locationId: locationId,
      showOnHomeScreen: true,
    );
  }

  Future<void> setTemperatureUnit(TemperatureUnit unit) async {
    await (await settingsBox).put(StorageKeys.temperatureUnitKey, unit);
  }

  Future<void> setTimeFormat(TimeFormat format) async {
    await (await settingsBox).put(StorageKeys.timeFormatKey, format);
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
      StorageKeys.locationsListKey,
      updatedLocations,
    );
  }
}
