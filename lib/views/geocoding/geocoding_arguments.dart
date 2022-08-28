import 'package:dio/dio.dart';

class GeocodingArguments {
  final VoidCallback onLocationAdded;

  const GeocodingArguments({
    required this.onLocationAdded,
  });
}
