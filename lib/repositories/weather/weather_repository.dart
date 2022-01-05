import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/named_location.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  Future<LocationWeatherData> getCurrentWeatherAndForecast({
    required NamedLocation location,
  });
}
