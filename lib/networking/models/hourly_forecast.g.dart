// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) =>
    HourlyForecast(
      conditions: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      temperature: (json['temp'] as num?)?.toDouble(),
      time: json['dt'] as int?,
    );

Map<String, dynamic> _$HourlyForecastToJson(HourlyForecast instance) =>
    <String, dynamic>{
      'weather': instance.conditions,
      'feels_like': instance.feelsLike,
      'temp': instance.temperature,
      'dt': instance.time,
    };
