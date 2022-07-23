import 'package:app/networking/endpoints.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';
import 'package:dio/dio.dart';

class NetworkGeocodingRepository implements GeocodingRepository {
  final Dio dio;

  const NetworkGeocodingRepository({
    required this.dio,
  });

  @override
  Future<List<GeocodingProposition>> getGeocodingPropositionsBasedOnQuery({
    required String query,
  }) async {
    final Response<List<Map<String, dynamic>>> response = await dio.get(
      Endpoints.geocoding.geocodingPropositions,
      // TODO Consider moving these to constants
      queryParameters: {
        'q': query,
        'limit': 5,
      },
    );

    // TODO Parse and return data
    return [];
  }
}
