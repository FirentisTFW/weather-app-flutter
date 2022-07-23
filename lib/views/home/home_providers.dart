import 'package:app/commons/collections.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/providers/network_providers.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/repositories/weather/weather_repository.dart';
import 'package:app/storage/common_storage.dart';
import 'package:app/views/home/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(
    storage: ref.watch(storageProvider),
    weatherRepository: ref.read(weatherRepositoryProvider),
  ),
);

class HomeNotifier extends StateNotifier<HomeState> {
  final CommonStorage storage;
  final WeatherRepository weatherRepository;

  HomeNotifier({
    required this.storage,
    required this.weatherRepository,
  }) : super(
          const HomeInitial(),
        );

  Future<void> fetchLocationsWeatherData() async {
    state = const HomeFetchInProgress();

    try {
      final List<NamedLocation> homeLocations = await storage.getSelectedLocations();
      // TODO Check if there are two selected locations. If not, emit state to show dialog

      late final LocationWeatherData firstLocationData;
      late final LocationWeatherData secondLocationData;

      await Future.wait([
        weatherRepository
            .getCurrentWeatherAndForecast(
              location: homeLocations.first,
            )
            .then((value) => firstLocationData = value),
        weatherRepository
            .getCurrentWeatherAndForecast(
              location: homeLocations[1],
            )
            .then((value) => secondLocationData = value),
      ]);

      state = HomeFetchSucces(
        weatherData: CollectionOf2(
          firstLocationData,
          secondLocationData,
        ),
      );
    } catch (error) {
      state = HomeFetchFailure(
        // TODO Prepare custom error
        error: error,
      );
    }
  }
}
