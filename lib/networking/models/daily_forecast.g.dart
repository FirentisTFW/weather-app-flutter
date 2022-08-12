// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    DailyForecast(
      conditions: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['dt'] as int?,
      humidity: json['humidity'] as int?,
      pressure: json['pressure'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      temperature: json['temp'] == null
          ? null
          : ForecastTemperature.fromJson(json['temp'] as Map<String, dynamic>),
      uvIndex: (json['uvi'] as num?)?.toDouble(),
      windDegree: (json['wind_deg'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
    );
