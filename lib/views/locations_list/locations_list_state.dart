import 'package:app/data/models/named_location.dart';
import 'package:equatable/equatable.dart';

abstract class LocationsListState extends Equatable {
  const LocationsListState();

  @override
  List<Object?> get props => [];
}

class LocationsListInitial extends LocationsListState {
  const LocationsListInitial();
}

class LocationsListFetchSuccess extends LocationsListState {
  final List<NamedLocation> locations;

  int get selectedLocationsCount => locations.where((location) => location.showOnHomeScreen).length;

  const LocationsListFetchSuccess({
    required this.locations,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        locations,
      ];
}

class LocationsListSelectLocationFailure extends LocationsListFetchSuccess {
  final String newlySelectedLocationId;
  final List<NamedLocation> selectedLocations;

  LocationsListSelectLocationFailure({
    required LocationsListFetchSuccess state,
    required this.newlySelectedLocationId,
    required this.selectedLocations,
  }) : super(
          locations: state.locations,
        );

  @override
  List<Object?> get props => [
        ...super.props,
        newlySelectedLocationId,
        selectedLocations,
      ];
}
