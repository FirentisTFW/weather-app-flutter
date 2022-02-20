import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/providers/network_providers.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geocodingProvider = StateNotifierProvider<GeocodingNotifier, List<GeocodingProposition>>(
  (ref) => GeocodingNotifier(
    geocodingRepository: ref.watch(geocodingRepositoryProvider),
  ),
);

class GeocodingNotifier extends StateNotifier<List<GeocodingProposition>> {
  final GeocodingRepository geocodingRepository;

  GeocodingNotifier({
    required this.geocodingRepository,
  }) : super(
          [],
        );

  Future<void> getGeocodingPropositions({
    required String query,
  }) async {
    state = await geocodingRepository.getGeocodingPropositionsBasedOnQuery(
      query: query,
    );
  }
}
