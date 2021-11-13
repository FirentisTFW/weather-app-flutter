import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/hourly_forecast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_weather_data.g.dart';

@JsonSerializable(
  createToJson: false,
)
class LocationWeatherData {
  @JsonKey(name: 'current')
  final CurrentWeather? currentWeather;
  @JsonKey(name: 'daily')
  final List<DailyForecast>? dailyForecast;
  @JsonKey(name: 'hourly')
  final List<HourlyForecast>? hourlyForecast;
  @JsonKey(name: 'lat')
  final double? latitude;
  @JsonKey(name: 'lon')
  final double? longitude;
  final int? timezoneOffset;

  const LocationWeatherData({
    this.currentWeather,
    this.dailyForecast,
    this.hourlyForecast,
    this.latitude,
    this.longitude,
    this.timezoneOffset,
  });

  factory LocationWeatherData.fromJson(Map<String, dynamic> json) => _$LocationWeatherDataFromJson(json);
}
