// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      currentWeather: json['current'] == null
          ? null
          : CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
      dailyForecast: (json['daily'] as List<dynamic>?)
          ?.map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourlyForecast: (json['hourly'] as List<dynamic>?)
          ?.map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lon'] as num?)?.toDouble(),
      timezoneOffset: json['timezone_offset'] as int?,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'current': instance.currentWeather,
      'daily': instance.dailyForecast,
      'hourly': instance.hourlyForecast,
      'lat': instance.latitude,
      'lon': instance.longitude,
      'timezone_offset': instance.timezoneOffset,
    };
