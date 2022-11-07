import 'package:app/commons/collections.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/data/models/user_settings.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeFetchInProgress extends HomeState {
  const HomeFetchInProgress();
}

abstract class HomeFetchSucces extends HomeState {
  final UserSettings userSettings;
  final CollectionOf2<LocationWeatherData> weatherData;

  const HomeFetchSucces({
    required this.userSettings,
    required this.weatherData,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        userSettings,
        weatherData,
      ];
}

class HomeFetchNetworkSucces extends HomeFetchSucces {
  const HomeFetchNetworkSucces({
    required UserSettings userSettings,
    required CollectionOf2<LocationWeatherData> weatherData,
  }) : super(
          userSettings: userSettings,
          weatherData: weatherData,
        );
}

// TODO Reconsider naming (fetched for cached?)
class HomeFetchCachedSucces extends HomeFetchSucces {
  const HomeFetchCachedSucces({
    required UserSettings userSettings,
    required CollectionOf2<LocationWeatherData> weatherData,
  }) : super(
          userSettings: userSettings,
          weatherData: weatherData,
        );
}

class HomeFetchFailure extends HomeState {
  final dynamic error;

  const HomeFetchFailure({
    required this.error,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        error,
      ];
}

class HomeMissingLocations extends HomeState {
  const HomeMissingLocations();
}
