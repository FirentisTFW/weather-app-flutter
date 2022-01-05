import 'package:app/commons/collections.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/providers/network_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = FutureProvider<CollectionOf2<LocationWeatherData>>(
  (ref) async {
    final weatherRepository = ref.read(weatherRepositoryProvider);
    late final LocationWeatherData firstLocationData;
    late final LocationWeatherData secondLocationData;

    // TODO Remove mocks, get location data from storage
    await Future.wait([
      weatherRepository
          .getCurrentWeatherAndForecast(
            location: const NamedLocation(
              latitude: 52.4095,
              longitude: 16.9319,
              name: 'Poznań',
            ),
          )
          .then((value) => firstLocationData = value),
      weatherRepository
          .getCurrentWeatherAndForecast(
            location: const NamedLocation(
              latitude: 36.7202,
              longitude: 4.4203,
              name: 'Malaga',
            ),
          )
          .then((value) => secondLocationData = value),
    ]);

    return CollectionOf2<LocationWeatherData>(
      firstLocationData,
      secondLocationData,
    );
  },
);
