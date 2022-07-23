import 'package:app/commons/collections.dart';
import 'package:app/data/models/location_weather_data.dart';
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

class HomeFetchSucces extends HomeState {
  final CollectionOf2<LocationWeatherData> weatherData;

  const HomeFetchSucces({
    required this.weatherData,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        weatherData,
      ];
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
