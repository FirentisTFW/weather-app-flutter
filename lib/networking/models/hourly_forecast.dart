import 'package:app/networking/models/weather_condition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hourly_forecast.g.dart';

@JsonSerializable()
class HourlyForecast {
  @JsonKey(name: 'weather')
  final List<WeatherCondition>? conditions;
  final double? feelsLike;
  @JsonKey(name: 'temp')
  final double? temperature;
  @JsonKey(name: 'dt')
  final int? time;

  const HourlyForecast({
    this.conditions,
    this.feelsLike,
    this.temperature,
    this.time,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) => _$HourlyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastToJson(this);
}
