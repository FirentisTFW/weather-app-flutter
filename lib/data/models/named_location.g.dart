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
