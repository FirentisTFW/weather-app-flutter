import 'package:app/networking/models/weather_condition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable(
  createToJson: false,
)
class CurrentWeather {
  @JsonKey(name: 'weather')
  final List<WeatherCondition>? conditions;
  final int? humidity;
  final double? feelsLike;
  final int? pressure;
  final int? sunrise;
  final int? sunset;
  @JsonKey(name: 'temp')
  final double? temperature;
  @JsonKey(name: 'uvi')
  final double? uvIndex;
  @JsonKey(name: 'wind_deg')
  final double? windDegree;
  final double? windSpeed;

  const CurrentWeather({
    this.conditions,
    this.humidity,
    this.feelsLike,
    this.pressure,
    this.sunrise,
    this.sunset,
    this.temperature,
    this.uvIndex,
    this.windDegree,
    this.windSpeed,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);
}
