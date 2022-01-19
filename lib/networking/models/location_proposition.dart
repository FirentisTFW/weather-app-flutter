import 'package:json_annotation/json_annotation.dart';

part 'location_proposition.g.dart';

@JsonSerializable(
  createToJson: false,
)
class LocationProposition {
  final String? country;
  @JsonKey(name: 'lat')
  final double? latitude;
  @JsonKey(name: 'lon')
  final double? longitude;
  final String? name;
  final String? state;

  const LocationProposition({
    this.country,
    this.latitude,
    this.longitude,
    this.name,
    this.state,
  });

  factory LocationProposition.fromJson(Map<String, dynamic> json) => _$LocationPropositionFromJson(json);

  String get latitudeDisplay => latitude?.toStringAsFixed(4) ?? '';

  String get longitudeDisplay => longitude?.toStringAsFixed(4) ?? '';
}
