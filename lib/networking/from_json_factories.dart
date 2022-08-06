import 'package:app/networking/from_json_factory.dart';
import 'package:app/networking/models/geocoding_proposition.dart';

const Map<Type, FromJsonFactory> fromJsonFactories = {
  GeocodingProposition: GeocodingProposition.fromJsonFactory,
};
