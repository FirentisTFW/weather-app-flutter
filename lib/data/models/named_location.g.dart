// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_location.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NamedLocationCWProxy {
  NamedLocation id(String id);

  NamedLocation latitude(double latitude);

  NamedLocation longitude(double longitude);

  NamedLocation name(String name);

  NamedLocation showOnHomeScreen(bool showOnHomeScreen);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedLocation call({
    String? id,
    double? latitude,
    double? longitude,
    String? name,
    bool? showOnHomeScreen,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNamedLocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNamedLocation.copyWith.fieldName(...)`
class _$NamedLocationCWProxyImpl implements _$NamedLocationCWProxy {
  final NamedLocation _value;

  const _$NamedLocationCWProxyImpl(this._value);

  @override
  NamedLocation id(String id) => this(id: id);

  @override
  NamedLocation latitude(double latitude) => this(latitude: latitude);

  @override
  NamedLocation longitude(double longitude) => this(longitude: longitude);

  @override
  NamedLocation name(String name) => this(name: name);

  @override
  NamedLocation showOnHomeScreen(bool showOnHomeScreen) =>
      this(showOnHomeScreen: showOnHomeScreen);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedLocation call({
    Object? id = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showOnHomeScreen = const $CopyWithPlaceholder(),
  }) {
    return NamedLocation(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      latitude: latitude == const $CopyWithPlaceholder() || latitude == null
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double,
      longitude: longitude == const $CopyWithPlaceholder() || longitude == null
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      showOnHomeScreen: showOnHomeScreen == const $CopyWithPlaceholder() ||
              showOnHomeScreen == null
          ? _value.showOnHomeScreen
          // ignore: cast_nullable_to_non_nullable
          : showOnHomeScreen as bool,
    );
  }
}

extension $NamedLocationCopyWith on NamedLocation {
  /// Returns a callable class that can be used as follows: `instanceOfNamedLocation.copyWith(...)` or like so:`instanceOfNamedLocation.copyWith.fieldName(...)`.
  _$NamedLocationCWProxy get copyWith => _$NamedLocationCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NamedLocationAdapter extends TypeAdapter<NamedLocation> {
  @override
  final int typeId = 0;

  @override
  NamedLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NamedLocation(
      id: fields[0] as String,
      latitude: fields[1] as double,
      longitude: fields[2] as double,
      name: fields[3] as String,
      showOnHomeScreen: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NamedLocation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.showOnHomeScreen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NamedLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
