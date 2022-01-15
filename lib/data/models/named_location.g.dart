// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_location.dart';

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
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      name: fields[2] as String,
      showOnHomeScreen: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NamedLocation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
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
