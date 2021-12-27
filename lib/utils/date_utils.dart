import 'package:app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

abstract class DateUtils {
  const DateUtils._();

  static const int _milisecondsInSecond = 1000;

  static String provideWeekdayBasedOnTime(
    BuildContext context, {
    required int? timeInSeconds,
  }) {
    if (timeInSeconds == null) {
      return '';
    }
    final date = DateTime.fromMillisecondsSinceEpoch(timeInSeconds * _milisecondsInSecond);

    switch (date.weekday) {
      case 1:
        return S.of(context).mondayShort;
      case 2:
        return S.of(context).tuesdayShort;
      case 3:
        return S.of(context).wednesdayShort;
      case 4:
        return S.of(context).thursdayShort;
      case 5:
        return S.of(context).fridayShort;
      case 6:
        return S.of(context).saturdayShort;
      case 7:
        return S.of(context).sundayShort;
      default:
        return '';
    }
  }
}
