import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/hourly_forecast.dart';
import 'package:app/networking/models/weather_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_weather_data.g.dart';

@JsonSerializable()
class LocationWeatherData {
  final CurrentWeather? currentWeather;
  final List<DailyForecast>? dailyForecast;
  final List<HourlyForecast>? hourlyForecast;
  final double? latitude;
  final String locationName;
  final double? longitude;
  final int? timezoneOffset;

  const LocationWeatherData({
    this.currentWeather,
    this.dailyForecast,
    this.hourlyForecast,
    this.latitude,
    required this.locationName,
    this.longitude,
    this.timezoneOffset,
  });

  LocationWeatherData.fromWeatherData({
    required this.locationName,
    required WeatherData? weatherData,
  })  : currentWeather = weatherData?.currentWeather,
        dailyForecast = weatherData?.dailyForecast,
        hourlyForecast = weatherData?.hourlyForecast,
        latitude = weatherData?.latitude,
        longitude = weatherData?.longitude,
        timezoneOffset = weatherData?.timezoneOffset;

  factory LocationWeatherData.fromJson(Map<String, dynamic> json) => _$LocationWeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationWeatherDataToJson(this);
}
