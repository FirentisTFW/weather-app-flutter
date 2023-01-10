import 'package:app/data/models/named_location.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/providers/network_repository_providers.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';
import 'package:app/storage/common_storage.dart';
import 'package:app/views/geocoding/geocoding_fetch_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geocodingProvider = StateNotifierProvider<GeocodingNotifier, GeocodingFetchState>(
  (ref) => GeocodingNotifier(
    geocodingRepository: ref.watch(networkGeocodingRepositoryProvider),
    storage: ref.watch(storageProvider),
  ),
);

class GeocodingNotifier extends StateNotifier<GeocodingFetchState> {
  final GeocodingRepository geocodingRepository;
  final CommonStorage storage;

  GeocodingNotifier({
    required this.geocodingRepository,
    required this.storage,
  }) : super(
          const GeocodingFetchInitial(),
        );

  Future<void> getGeocodingPropositions({
    required String query,
  }) async {
    try {
      state = const GeocodingFetchInProgress();
      final List<GeocodingProposition> locationPropositions =
          await geocodingRepository.getGeocodingPropositionsBasedOnQuery(
        query: query,
      );
      state = GeocodingFetchSuccess(
        locationPropositions: locationPropositions,
      );
    } catch (error) {
      state = GeocodingFetchFailure(
        // TODO Prepare custom error
        error: error,
      );
    }
  }

  Future<void> addLocation(NamedLocation location) => storage.addLocation(location);
}
