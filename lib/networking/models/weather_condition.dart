import 'package:json_annotation/json_annotation.dart';

part 'weather_condition.g.dart';

@JsonSerializable()
class WeatherCondition {
  final String? description;
  final String? icon;
  @JsonKey(name: 'main')
  final String? title;

  const WeatherCondition({
    this.description,
    this.icon,
    this.title,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) => _$WeatherConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}
