import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/networking/models/weather_data.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  Future<WeatherData> getCurrentWeatherAndForecast({
    required NamedLocation location,
    required TemperatureUnit temperatureUnit,
  });
}
