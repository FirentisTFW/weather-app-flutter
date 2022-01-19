// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_proposition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationProposition _$LocationPropositionFromJson(Map<String, dynamic> json) =>
    LocationProposition(
      country: json['country'] as String?,
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lon'] as num?)?.toDouble(),
      name: json['name'] as String?,
      state: json['state'] as String?,
    );
