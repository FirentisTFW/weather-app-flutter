import 'package:app/networking/models/forecast_temperature.dart';
import 'package:app/networking/models/weather_condition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_forecast.g.dart';

@JsonSerializable(
  createToJson: false,
)
class DailyForecast {
  @JsonKey(name: 'weather')
  final List<WeatherCondition>? conditions;
  final int? date;
  final int? humidity;
  final int? pressure;
  final int? sunrise;
  final int? sunset;
  @JsonKey(name: 'temp')
  final ForecastTemperature? temperature;
  @JsonKey(name: 'uvi')
  final double? uvIndex;
  @JsonKey(name: 'wind_deg')
  final double? windDegree;
  final double? windSpeed;

  const DailyForecast({
    this.conditions,
    this.date,
    this.humidity,
    this.pressure,
    this.sunrise,
    this.sunset,
    this.temperature,
    this.uvIndex,
    this.windDegree,
    this.windSpeed,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);
}
