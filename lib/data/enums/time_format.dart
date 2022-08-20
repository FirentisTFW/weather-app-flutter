import 'package:app/storage/hive_type_ids.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'time_format.g.dart';

@HiveType(typeId: HiveTypeIds.timeFormat)
enum TimeFormat {
  @HiveField(0)
  twelveHour,
  @HiveField(
    1,
    defaultValue: true,
  )
  twentyFourHour,
}

extension TimeFormatExtension on TimeFormat {
  String getFormatDisplay(BuildContext context) {
    switch (this) {
      // TODO intl
      case TimeFormat.twelveHour:
        return '12h';
      case TimeFormat.twentyFourHour:
        return '24h';
    }
  }
}
