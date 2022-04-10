import 'package:app/data/models/named_location.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:uuid/uuid.dart';

extension GeocodingPropositionMappers on GeocodingProposition {
  NamedLocation mapToNamedLocation() {
    return NamedLocation(
      id: const Uuid().v1(),
      latitude: latitude ?? 0.0,
      longitude: longitude ?? 0.0,
      name: name ?? '',
      showOnHomeScreen: false,
    );
  }
}
