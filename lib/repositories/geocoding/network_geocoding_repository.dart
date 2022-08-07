import 'package:app/networking/api_helpers_mixin.dart';
import 'package:app/networking/endpoints.dart';
import 'package:app/networking/json_parser.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';
import 'package:dio/dio.dart';

class NetworkGeocodingRepository with ApiHelpers implements GeocodingRepository {
  final Dio dio;

  const NetworkGeocodingRepository({
    required this.dio,
  });

  @override
  Future<List<GeocodingProposition>> getGeocodingPropositionsBasedOnQuery({
    required String query,
  }) async {
    final Response<List<dynamic>> response = await dio.get(
      Endpoints.geocoding.geocodingPropositions,
      queryParameters: {
        ApiHelpers.parameters.limit: 5,
        ApiHelpers.parameters.query: query,
      },
    );
    return JsonParser.parseListResponse<GeocodingProposition>(response.data);
  }
}
