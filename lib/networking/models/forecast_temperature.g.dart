// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastTemperature _$ForecastTemperatureFromJson(Map<String, dynamic> json) =>
    ForecastTemperature(
      day: (json['day'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      night: (json['night'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ForecastTemperatureToJson(
        ForecastTemperature instance) =>
    <String, dynamic>{
      'day': instance.day,
      'max': instance.max,
      'min': instance.min,
      'night': instance.night,
    };
