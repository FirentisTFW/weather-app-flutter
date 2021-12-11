import 'package:app/networking/models/location_weather_data.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  // TODO Add location parameter - where to get data from?
  Future<LocationWeatherData> getCurrentWeatherAndForecast();
}
