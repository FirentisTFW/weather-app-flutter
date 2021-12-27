import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/hourly_forecast.dart';
import 'package:app/networking/models/weather_data.dart';

class LocationWeatherData {
  late final CurrentWeather? currentWeather;
  late final List<DailyForecast>? dailyForecast;
  late final List<HourlyForecast>? hourlyForecast;
  late final double? latitude;
  late final String locationName;
  late final double? longitude;
  late final int? timezoneOffset;

  LocationWeatherData({
    required this.locationName,
    required WeatherData? weatherData,
  }) {
    currentWeather = weatherData?.currentWeather;
    dailyForecast = weatherData?.dailyForecast;
    hourlyForecast = weatherData?.hourlyForecast;
    latitude = weatherData?.latitude;
    longitude = weatherData?.longitude;
    timezoneOffset = weatherData?.timezoneOffset;
  }
}
