import 'package:app/networking/models/location_weather_data.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  // TODO add return type when models are ready
  Future<LocationWeatherData> getCurrentWeatherAndForecast();
}
