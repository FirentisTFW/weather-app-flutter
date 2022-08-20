// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_format.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeFormatAdapter extends TypeAdapter<TimeFormat> {
  @override
  final int typeId = 2;

  @override
  TimeFormat read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TimeFormat.twelveHour;
      case 1:
        return TimeFormat.twentyFourHour;
      default:
        return TimeFormat.twentyFourHour;
    }
  }

  @override
  void write(BinaryWriter writer, TimeFormat obj) {
    switch (obj) {
      case TimeFormat.twelveHour:
        writer.writeByte(0);
        break;
      case TimeFormat.twentyFourHour:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeFormatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
