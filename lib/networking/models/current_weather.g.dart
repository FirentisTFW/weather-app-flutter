// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      conditions: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      humidity: json['humidity'] as int?,
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      temperature: (json['temp'] as num?)?.toDouble(),
      uvIndex: (json['uvi'] as num?)?.toDouble(),
      windDegree: (json['wind_deg'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
    );
