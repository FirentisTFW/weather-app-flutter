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

  const LocationsListFetchSuccess({
    required this.locations,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        locations,
      ];
}
