import 'package:app/commons/collections.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/data/models/user_settings.dart';
import 'package:app/managers/settings_manager.dart';
import 'package:app/networking/models/weather_data.dart';
import 'package:app/providers/network_providers.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/repositories/weather/weather_repository.dart';
import 'package:app/storage/common_storage.dart';
import 'package:app/views/home/home_state.dart';
import 'package:app/views/locations_list/location_list_providers.dart';
import 'package:app/views/locations_list/locations_list_state.dart';
import 'package:app/views/settings/settings_providers.dart';
import 'package:app/views/settings/settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) {
    final HomeNotifier homeNotifier = HomeNotifier(
      settingsManager: SettingsManager(ref.watch(storageProvider)),
      storage: ref.watch(storageProvider),
      weatherRepository: ref.watch(weatherRepositoryProvider),
    );
    ref.listen(
      locationsListProvider,
      (previous, current) {
        if (previous is! LocationsListInitial && current is LocationsListFetchSuccess) {
          homeNotifier.fetchLocationsWeatherData();
        }
      },
    );
    ref.listen(
      settingsProvider,
      (previous, current) {
        if (previous is SettingsFetchSuccess && current is SettingsFetchSuccess && previous != current) {
          // TODO Consider fetching again only if temperature format has changed, otherwise just rebuild widget tree
          homeNotifier.fetchLocationsWeatherData();
        }
      },
    );
    return homeNotifier;
  },
);

class HomeNotifier extends StateNotifier<HomeState> {
  final SettingsManager settingsManager;
  final CommonStorage storage;
  final WeatherRepository weatherRepository;

  HomeNotifier({
    required this.settingsManager,
    required this.storage,
    required this.weatherRepository,
  }) : super(
          const HomeInitial(),
        );

  Future<void> fetchLocationsWeatherData() async {
    state = const HomeFetchInProgress();

    try {
      final List<NamedLocation> homeLocations = await storage.getSelectedLocations();
      final UserSettings userSettings = await settingsManager.provideUserSettings();

      if (homeLocations.length < 2) {
        state = const HomeMissingLocations();
        return Future.value();
      }

      late final WeatherData firstLocationData;
      late final WeatherData secondLocationData;

      await Future.wait([
        weatherRepository
            .getCurrentWeatherAndForecast(
              location: homeLocations.first,
              temperatureUnit: userSettings.temperatureUnit,
            )
            .then((value) => firstLocationData = value),
        weatherRepository
            .getCurrentWeatherAndForecast(
              location: homeLocations[1],
              temperatureUnit: userSettings.temperatureUnit,
            )
            .then((value) => secondLocationData = value),
      ]);

      state = HomeFetchSucces(
        userSettings: userSettings,
        weatherData: CollectionOf2(
          LocationWeatherData(
            locationName: homeLocations.first.name,
            weatherData: firstLocationData,
          ),
          LocationWeatherData(
            locationName: homeLocations[1].name,
            weatherData: secondLocationData,
          ),
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
