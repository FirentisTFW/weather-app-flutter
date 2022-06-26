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
}
