// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeatherData _$LocationWeatherDataFromJson(Map<String, dynamic> json) =>
    LocationWeatherData(
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
