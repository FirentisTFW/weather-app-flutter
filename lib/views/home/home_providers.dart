import 'package:app/networking/models/location_weather_data.dart';
import 'package:app/providers/network_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = FutureProvider<LocationWeatherData>(
  // TODO Get data for two locations, not one
  (ref) async {
    final usersRepository = ref.read(weatherRepositoryProvider);
    return usersRepository.getCurrentWeatherAndForecast();
  },
);
