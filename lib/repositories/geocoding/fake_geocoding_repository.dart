import 'package:app/networking/models/location_proposition.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';

class FakeGeocodingRepository implements GeocodingRepository {
  const FakeGeocodingRepository();

  @override
  Future<List<LocationProposition>> getLocationPropositionsBasedOnQuery({
    required String query,
  }) async {
    await _simulateDelay();

    if (query.contains('Jaro')) {
      return const [
        LocationProposition(
          country: 'PL',
          latitude: 51.9739233,
          longitude: 17.5011254,
          name: 'Jarocin',
          state: 'Greater Poland Voivodeship',
        ),
        LocationProposition(
          country: 'PL',
          latitude: 52.887332,
          longitude: 18.633242,
          name: 'Jarocin',
          state: 'Greater Poland Voivodeship',
        ),
      ];
    }

    return [];
  }

  Future<void> _simulateDelay() async => Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
}
