import 'package:app/data/models/difference.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

abstract class TemperatureUtils {
  const TemperatureUtils._();

  static const _degreeSymbol = '°';
  static const _separator = '/';
  // TODO Let user decide which unit he/she wants to use - get it from Storage
  static const _unit = 'C';

  static String formatTemperature(int temperature) {
    return [
      temperature,
      _degreeSymbol,
      _unit,
    ].join();
  }

  static String provideComparisonKeyword(BuildContext context, TemperatureDifference difference) {
    if (difference.data.isNegative) {
      return S.of(context).temperatureComparisonKeywordNegative;
    }
    return S.of(context).temperatureComparisonKeywordPositive;
  }

  static String provideDayAndNightTemperature({
    required double? day,
    required double? night,
  }) {
    if (day == null || night == null) {
      return '';
    }
    final int dayTemperature = day.toInt();
    final int nightTemperature = night.toInt();

    return [
      dayTemperature,
      _separator,
      nightTemperature,
      _degreeSymbol,
      _unit,
    ].join();
  }
}
