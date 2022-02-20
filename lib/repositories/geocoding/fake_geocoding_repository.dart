import 'package:app/commons/mocks.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';

class FakeGeocodingRepository implements GeocodingRepository {
  const FakeGeocodingRepository();

  @override
  Future<List<GeocodingProposition>> getGeocodingPropositionsBasedOnQuery({
    required String query,
  }) async {
    await _simulateDelay();

    if (query.contains('Jaro')) {
      return Mocks.geocodingPropositions;
    }

    return [];
  }

  Future<void> _simulateDelay() async => Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
}
