import 'package:app/networking/models/location_proposition.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';
import 'package:dio/dio.dart';

class NetworkGeocodingRepository implements GeocodingRepository {
  final Dio dio;

  const NetworkGeocodingRepository({
    required this.dio,
  });

  @override
  Future<List<LocationProposition>> getLocationPropositionsBasedOnQuery({
    required String query,
  }) {
    // TODO: implement getLocationPropositionsBasedOnQuery
    throw UnimplementedError();
  }
}
