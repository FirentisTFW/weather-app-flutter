import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/models/difference.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

abstract class TemperatureUtils {
  const TemperatureUtils._();

  static const String _degreeSymbol = '°';
  static const String _separator = '/';

  static String formatTemperature(
    BuildContext context, {
    required int temperature,
    required TemperatureUnit unit,
  }) {
    return [
      temperature,
      _degreeSymbol,
      unit.getUnitDisplay(context),
    ].join();
  }

  static String provideComparisonKeyword(BuildContext context, TemperatureDifference difference) {
    if (difference.data.isNegative) {
      return S.of(context).temperatureComparisonKeywordNegative;
    }
    return S.of(context).temperatureComparisonKeywordPositive;
  }

  static String provideDayAndNightTemperature(
    BuildContext context, {
    required double? day,
    required double? night,
    required TemperatureUnit unit,
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
      unit.getUnitDisplay(context),
    ].join();
  }
}
