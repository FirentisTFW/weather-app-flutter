import 'package:json_annotation/json_annotation.dart';

part 'forecast_temperature.g.dart';

@JsonSerializable()
class ForecastTemperature {
  final double? day;
  final double? max;
  final double? min;
  final double? night;

  const ForecastTemperature({
    this.day,
    this.max,
    this.min,
    this.night,
  });

  factory ForecastTemperature.fromJson(Map<String, dynamic> json) => _$ForecastTemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastTemperatureToJson(this);
}
