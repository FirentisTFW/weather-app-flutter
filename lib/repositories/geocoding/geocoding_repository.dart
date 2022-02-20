import 'package:app/networking/models/geocoding_proposition.dart';

abstract class GeocodingRepository {
  const GeocodingRepository();

  Future<List<GeocodingProposition>> getGeocodingPropositionsBasedOnQuery({
    required String query,
  });
}
