import 'package:app/repositories/weather/weather_repository.dart';
import 'package:dio/dio.dart';

class NetworkWeatherRepository implements WeatherRepository {
  final Dio dio;

  const NetworkWeatherRepository({
    required this.dio,
  });

  @override
  Future getCurrentWeatherAndForecast() {
    // TODO implement getCurrentWeather
    throw UnimplementedError();
  }
}
