// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_proposition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingProposition _$GeocodingPropositionFromJson(
        Map<String, dynamic> json) =>
    GeocodingProposition(
      country: json['country'] as String?,
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lon'] as num?)?.toDouble(),
      name: json['name'] as String?,
      state: json['state'] as String?,
    );
