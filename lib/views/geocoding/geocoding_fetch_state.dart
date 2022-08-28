import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:equatable/equatable.dart';

abstract class GeocodingFetchState extends Equatable {
  const GeocodingFetchState();

  @override
  List<Object?> get props => [];
}

class GeocodingFetchInitial extends GeocodingFetchState {
  const GeocodingFetchInitial();
}

class GeocodingFetchInProgress extends GeocodingFetchState {
  const GeocodingFetchInProgress();
}

class GeocodingFetchSuccess extends GeocodingFetchState {
  final List<GeocodingProposition> locationPropositions;

  const GeocodingFetchSuccess({
    required this.locationPropositions,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        locationPropositions,
      ];
}

class GeocodingFetchFailure extends GeocodingFetchState {
  final dynamic error;

  const GeocodingFetchFailure({
    required this.error,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        error,
      ];
}
