import 'package:app/data/models/named_location.dart';
import 'package:app/networking/models/location_proposition.dart';

extension LocationPropositionMappers on LocationProposition {
  NamedLocation mapToNamedLocation() {
    return NamedLocation(
      latitude: latitude ?? 0.0,
      longitude: longitude ?? 0.0,
      name: name ?? '',
      showOnHomeScreen: false,
    );
  }
}
