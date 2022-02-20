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
  }) {
    // TODO: implement getGeocodingPropositionsBasedOnQuery
    throw UnimplementedError();
  }
}
