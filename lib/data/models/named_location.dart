import 'package:hive/hive.dart';

part 'named_location.g.dart';

@HiveType(typeId: 0)
class NamedLocation {
  @HiveField(0)
  final double latitude;
  @HiveField(1)
  final double longitude;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final bool showOnHomeScreen;

  const NamedLocation({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.showOnHomeScreen,
  });

  String get latitudeDisplay => latitude.toStringAsFixed(4);

  String get longitudeDisplay => longitude.toStringAsFixed(4);
}
