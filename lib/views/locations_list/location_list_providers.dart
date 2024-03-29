import 'package:app/data/models/named_location.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/storage/common_storage.dart';
import 'package:app/views/locations_list/locations_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationsListProvider = StateNotifierProvider<LocationsListNotifier, LocationsListState>(
  (ref) => LocationsListNotifier(
    storage: ref.read(storageProvider),
  ),
);

class LocationsListNotifier extends StateNotifier<LocationsListState> {
  final CommonStorage storage;

  LocationsListNotifier({
    required this.storage,
  }) : super(
          const LocationsListInitial(),
        );

  Future<void> getLocations() async {
    // TOOD Consider try-catch
    final List<NamedLocation> locations = await storage.getLocations();
    state = LocationsListFetchSuccess(
      locations: locations,
    );
  }

  Future<void> getLocationsIfNotAvailable() async {
    if (state is! LocationsListFetchSuccess) getLocations();
  }

  Future<void> deleteLocation(String locationId) async {
    await storage.deleteLocation(locationId);
    getLocations();
  }

  Future<void> selectLocation(String locationId) async {
    final List<NamedLocation> selectedLocations = await storage.getSelectedLocations();
    if (selectedLocations.length < 2) {
      await storage.selectLocation(locationId);
      getLocations();
    } else {
      final LocationsListState entryState = state;
      if (entryState is! LocationsListFetchSuccess) return;
      state = LocationsListSelectLocationFailure(
        state: entryState,
        newlySelectedLocationId: locationId,
        selectedLocations: selectedLocations,
      );
    }
  }

  Future<void> unselectLocation(String locationId) async {
    await storage.unselectLocation(locationId);
    getLocations();
  }
}
