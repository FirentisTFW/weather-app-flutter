import 'package:app/networking/models/current_weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_weather.g.dart';

@JsonSerializable(
  createToJson: false,
)
class LocationWeather {
  @JsonKey(name: 'current')
  final CurrentWeather? currentWeather;
  @JsonKey(name: 'lat')
  final double? latitude;
  @JsonKey(name: 'lon')
  final double? longitude;

  const LocationWeather({
    this.currentWeather,
    this.latitude,
    this.longitude,
  });

  factory LocationWeather.fromJson(Map<String, dynamic> json) => _$LocationWeatherFromJson(json);
}
