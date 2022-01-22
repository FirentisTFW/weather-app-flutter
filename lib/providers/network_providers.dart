import 'package:app/build_config/environment.dart';
import 'package:app/providers/config_providers.dart';
import 'package:app/repositories/geocoding/fake_geocoding_repository.dart';
import 'package:app/repositories/geocoding/geocoding_repository.dart';
import 'package:app/repositories/geocoding/network_geocoding_repository.dart';
import 'package:app/repositories/weather/fake_weather_repository.dart';
import 'package:app/repositories/weather/network_weather_repository.dart';
import 'package:app/repositories/weather/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO set up dio parameters
final dioProvider = Provider<Dio>((ref) => Dio());

final geocodingRepositoryProvider = Provider<GeocodingRepository>(
  (ref) {
    final Environment environment = ref.watch(environmentProvider);

    switch (environment) {
      case Environment.dev:
        return const FakeGeocodingRepository();
      case Environment.prod:
        return NetworkGeocodingRepository(
          dio: ref.watch(dioProvider),
        );
    }
  },
);

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) {
    final Environment environment = ref.watch(environmentProvider);

    switch (environment) {
      case Environment.dev:
        return const FakeWeatherRepository();
      case Environment.prod:
        return NetworkWeatherRepository(
          dio: ref.watch(dioProvider),
        );
    }
  },
);
