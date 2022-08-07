import 'package:app/networking/from_json_factory.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/networking/models/weather_data.dart';

const Map<Type, FromJsonFactory> fromJsonFactories = {
  GeocodingProposition: GeocodingProposition.fromJsonFactory,
  WeatherData: WeatherData.fromJsonFactory,
};
