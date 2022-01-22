import 'package:app/networking/models/location_proposition.dart';

abstract class GeocodingRepository {
  const GeocodingRepository();

  Future<List<LocationProposition>> getLocationPropositionsBasedOnQuery({
    required String query,
  });
}
