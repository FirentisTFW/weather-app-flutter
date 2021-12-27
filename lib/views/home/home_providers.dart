import 'package:app/commons/collections.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/providers/network_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = FutureProvider<CollectionOf2<LocationWeatherData>>(
  (ref) async {
    final weatherRepository = ref.read(weatherRepositoryProvider);
    late final LocationWeatherData firstLocationData;
    late final LocationWeatherData secondLocationData;

    await Future.wait([
      weatherRepository.getCurrentWeatherAndForecast().then((value) => firstLocationData = value),
      weatherRepository.getCurrentWeatherAndForecast().then((value) => secondLocationData = value),
    ]);

    return CollectionOf2<LocationWeatherData>(
      firstLocationData,
      secondLocationData,
    );
  },
);
