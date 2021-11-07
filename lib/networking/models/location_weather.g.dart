// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeather _$LocationWeatherFromJson(Map<String, dynamic> json) =>
    LocationWeather(
      currentWeather: json['current'] == null
          ? null
          : CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lon'] as num?)?.toDouble(),
    );
