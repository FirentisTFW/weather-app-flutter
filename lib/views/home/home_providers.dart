import 'dart:async';

import 'package:app/commons/collections.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/data/models/user_settings.dart';
import 'package:app/managers/settings_manager.dart';
import 'package:app/networking/models/weather_data.dart';
import 'package:app/providers/network_repository_providers.dart';
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
      weatherRepository: ref.watch(networkWeatherRepositoryProvider),
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

  FutureOr<void> fetchLocationsWeatherData() async {
    state = const HomeFetchInProgress();
    final List<NamedLocation> homeLocations = await storage.getSelectedLocations();
    final UserSettings userSettings = await settingsManager.getUserSettings();

    if (homeLocations.length < 2) {
      state = const HomeMissingLocations();
      return;
    }
    try {
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

      final CollectionOf2<LocationWeatherData> locationsWeatherData = CollectionOf2(
        LocationWeatherData.fromWeatherData(
          locationName: homeLocations.first.name,
          weatherData: firstLocationData,
        ),
        LocationWeatherData.fromWeatherData(
          locationName: homeLocations[1].name,
          weatherData: secondLocationData,
        ),
      );

      state = HomeFetchNetworkSucces(
        userSettings: userSettings,
        weatherData: locationsWeatherData,
      );
      _cacheFetchedLocations(locationsWeatherData);
    } catch (_) {
      _loadCachedLocationsWeatherData(
        userSettings: userSettings,
      );
    }
  }

  Future<void> _cacheFetchedLocations(CollectionOf2<LocationWeatherData> locationsWeatherData) =>
      storage.setCachedWeatherAndForecastForSelectedLocations(locationsWeatherData);

  Future<void> _loadCachedLocationsWeatherData({
    required UserSettings userSettings,
  }) async {
    try {
      final List<LocationWeatherData>? data = await storage.getCachedWeatherAndForecastForSelectedLocations();
      if (data == null || data.length < 2) throw Exception();
      state = HomeFetchCachedSucces(
        userSettings: userSettings,
        weatherData: CollectionOf2(
          data.first,
          data[1],
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
