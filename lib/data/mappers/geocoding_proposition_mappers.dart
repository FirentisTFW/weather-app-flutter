import 'package:app/data/models/named_location.dart';
import 'package:app/networking/models/geocoding_proposition.dart';

extension GeocodingPropositionMappers on GeocodingProposition {
  NamedLocation mapToNamedLocation() {
    return NamedLocation(
      latitude: latitude ?? 0.0,
      longitude: longitude ?? 0.0,
      name: name ?? '',
      showOnHomeScreen: false,
    );
  }
}
