import 'package:app/data/models/difference.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

abstract class TimeUtils {
  const TimeUtils._();

  static String provideTimeDifferenceDisplay({
    required int secondsDifference,
  }) {
    const secondsInMinute = 60;
    const minutesInHour = 60;
    const secondsInHour = 3600;

    final int hours = (secondsDifference / secondsInHour).floor();
    final int minutes = (secondsDifference / secondsInMinute).floor() % minutesInHour;

    final String hoursKeyword = hours == 1 ? 'hour' : 'hours';
    final String minutesKeyword = minutes == 1 ? 'minute' : 'minutes';

    if (hours > 0) {
      return '$hours $hoursKeyword $minutes $minutesKeyword';
    }
    return '$minutes $minutesKeyword';
  }

  static String provideComparisonKeywordForDuration(BuildContext context, SecondsDifference difference) {
    if (difference.data.isNegative) {
      return S.of(context).timeComparisonKeywordForDurationNegative;
    }
    return S.of(context).timeComparisonKeywordForDurationPositive;
  }

  static String provideComparisonKeywordForTimestamp(BuildContext context, SecondsDifference difference) {
    if (difference.data.isNegative) {
      return S.of(context).timeComparisonKeywordForTimestampNegative;
    }
    return S.of(context).timeComparisonKeywordForTimestampPositive;
  }
}
