import 'package:app/data/models/difference.dart';

abstract class TimeUtils {
  const TimeUtils._();

  static String provideTimeDifferenceDisplay({
    required int minutesDifference,
  }) {
    // TODO Implement
    return '';
  }

  static String provideComparisonKeywordForDuration(SecondsDifference difference) {
    // TODO Remove hardcoded strings
    if (difference.data.isNegative) {
      return 'shorter';
    }
    return 'longer';
  }

  static String provideComparisonKeywordForTimestamp(SecondsDifference difference) {
    // TODO Remove hardcoded strings
    if (difference.data.isNegative) {
      return 'sooner';
    }
    return 'later';
  }
}
