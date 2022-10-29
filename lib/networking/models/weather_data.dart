import 'package:app/networking/from_json_factory.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/hourly_forecast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  static const FromJsonFactory<WeatherData> fromJsonFactory = _$WeatherDataFromJson;

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

  const WeatherData({
    this.currentWeather,
    this.dailyForecast,
    this.hourlyForecast,
    this.latitude,
    this.longitude,
    this.timezoneOffset,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
