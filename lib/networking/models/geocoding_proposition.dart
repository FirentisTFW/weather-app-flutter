import 'package:json_annotation/json_annotation.dart';

part 'geocoding_proposition.g.dart';

@JsonSerializable(
  createToJson: false,
)
class GeocodingProposition {
  final String? country;
  @JsonKey(name: 'lat')
  final double? latitude;
  @JsonKey(name: 'lon')
  final double? longitude;
  final String? name;
  final String? state;

  const GeocodingProposition({
    this.country,
    this.latitude,
    this.longitude,
    this.name,
    this.state,
  });

  factory GeocodingProposition.fromJson(Map<String, dynamic> json) => _$GeocodingPropositionFromJson(json);

  String get latitudeDisplay => latitude?.toStringAsFixed(4) ?? '';

  String get longitudeDisplay => longitude?.toStringAsFixed(4) ?? '';

  String get stateAndCountyDisplay => [
        state,
        country,
      ].where((element) => element != null).join(', ');
}
