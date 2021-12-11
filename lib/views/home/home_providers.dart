import 'package:app/commons/collections.dart';
import 'package:app/networking/models/location_weather_data.dart';
import 'package:app/providers/network_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = FutureProvider<CollectionOf2<LocationWeatherData>>(
  // TODO Get data for two locations, not one
  (ref) async {
    final usersRepository = ref.read(weatherRepositoryProvider);
    late final LocationWeatherData firstLocationData;
    late final LocationWeatherData secondLocationData;

    await Future.wait([
      usersRepository.getCurrentWeatherAndForecast().then((value) => firstLocationData = value),
      usersRepository.getCurrentWeatherAndForecast().then((value) => secondLocationData = value),
    ]);

    return CollectionOf2<LocationWeatherData>(
      firstLocationData,
      secondLocationData,
    );
  },
);
