class NamedLocation {
  final double latitude;
  final double longitude;
  final String name;
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
