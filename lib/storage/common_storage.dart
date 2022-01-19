import 'package:app/data/models/named_location.dart';
import 'package:app/storage/storage.dart';
import 'package:app/storage/storage_keys.dart';
import 'package:hive/hive.dart';

class CommonStorage {
  final Storage storage = Storage();

  Future<Box> get locationsBox async => storage.getBox(
        storageKey: StorageKeys.locationsBoxKey,
      );

  Future<List<NamedLocation>> getLocations() async {
    // TODO Consider try-catch and supplying custom local storage error messages that could be shown to the user
    final list = (await locationsBox).get(StorageKeys.locationsListKey) ?? [];
    return (list as List).cast<NamedLocation>();
  }

  Future<void> addLocation(NamedLocation location) async {
    // TODO Consider try-catch and supplying custom local storage error messages that could be shown to the user
    final List<NamedLocation> existingLocations = await getLocations();
    (await locationsBox).put(
      StorageKeys.locationsListKey,
      [
        ...existingLocations,
        location,
      ],
    );
  }
}
