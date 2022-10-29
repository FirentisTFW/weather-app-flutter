// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeatherData _$LocationWeatherDataFromJson(Map<String, dynamic> json) =>
    LocationWeatherData(
      currentWeather: json['current_weather'] == null
          ? null
          : CurrentWeather.fromJson(
              json['current_weather'] as Map<String, dynamic>),
      dailyForecast: (json['daily_forecast'] as List<dynamic>?)
          ?.map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourlyForecast: (json['hourly_forecast'] as List<dynamic>?)
          ?.map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      locationName: json['location_name'] as String,
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezoneOffset: json['timezone_offset'] as int?,
    );

Map<String, dynamic> _$LocationWeatherDataToJson(
        LocationWeatherData instance) =>
    <String, dynamic>{
      'current_weather': instance.currentWeather,
      'daily_forecast': instance.dailyForecast,
      'hourly_forecast': instance.hourlyForecast,
      'latitude': instance.latitude,
      'location_name': instance.locationName,
      'longitude': instance.longitude,
      'timezone_offset': instance.timezoneOffset,
    };
