import 'package:app/commons/collections.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/storage/storage.dart';
import 'package:app/storage/storage_keys.dart';
import 'package:hive/hive.dart';

class CommonStorage {
  final Storage storage = Storage();

  Future<Box> get locationsBox async => storage.getBox(
        storageKey: StorageKeys.locationsBoxKey,
      );

  Future<void> addLocation(NamedLocation location) async {
    // TODO Consider try-catch and supplying custom local storage error messages that could be shown to the user
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

  Future<CollectionOf2<NamedLocation>> getHomeLocations() async {
    final List<NamedLocation> allLocations = await getLocations();
    final List<NamedLocation> homeLocations = allLocations.where((location) => location.showOnHomeScreen).toList();
    // TODO Handle edge cases (one location)
    return CollectionOf2<NamedLocation>(homeLocations.first, homeLocations[1]);
  }

  Future<List<NamedLocation>> getLocations() async {
    // TODO Consider try-catch and supplying custom local storage error messages that could be shown to the user
    final list = (await locationsBox).get(StorageKeys.locationsListKey) ?? [];
    return (list as List).cast<NamedLocation>();
  }

  Future<void> selectLocation(String locationId) async {
    _updateLocationShowOnHomeScreenProperty(
      locationId: locationId,
      showOnHomeScreen: true,
    );
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
