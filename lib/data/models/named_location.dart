import 'package:app/storage/hive_type_ids.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'named_location.g.dart';

@CopyWith()
@HiveType(typeId: HiveTypeIds.namedLocation)
class NamedLocation extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final double latitude;
  @HiveField(2)
  final double longitude;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final bool showOnHomeScreen;

  const NamedLocation({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.showOnHomeScreen,
  });

  String get latitudeDisplay => latitude.toStringAsFixed(4);

  String get longitudeDisplay => longitude.toStringAsFixed(4);

  @override
  List<Object?> get props => [
        id,
        latitude,
        longitude,
        name,
        showOnHomeScreen,
      ];
}
