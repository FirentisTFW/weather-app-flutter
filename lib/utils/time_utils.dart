import 'package:app/data/models/difference.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

abstract class TimeUtils {
  const TimeUtils._();

  static String provideTimeDifferenceDisplay({
    required int minutesDifference,
  }) {
    return '';
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
