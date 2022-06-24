import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/providers/network_providers.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';
import 'package:app/views/add_location/geocoding_fetch_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geocodingProvider = StateNotifierProvider<GeocodingNotifier, GeocodingFetchState>(
  (ref) => GeocodingNotifier(
    geocodingRepository: ref.watch(geocodingRepositoryProvider),
  ),
);

class GeocodingNotifier extends StateNotifier<GeocodingFetchState> {
  final GeocodingRepository geocodingRepository;

  GeocodingNotifier({
    required this.geocodingRepository,
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
}
