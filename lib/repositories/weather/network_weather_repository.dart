import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/repositories/weather/weather_repository.dart';
import 'package:dio/dio.dart';

class NetworkWeatherRepository implements WeatherRepository {
  final Dio dio;

  const NetworkWeatherRepository({
    required this.dio,
  });

  @override
  Future<LocationWeatherData> getCurrentWeatherAndForecast({
    required NamedLocation location,
  }) {
    // TODO implement getCurrentWeatherAndForecast
    throw UnimplementedError();
  }
}
