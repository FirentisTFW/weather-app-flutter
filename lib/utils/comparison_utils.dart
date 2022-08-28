import 'package:app/commons/collections.dart';
import 'package:app/constants.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/data/models/difference.dart';
import 'package:app/data/models/location_single_data.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/utils/temperature_utiils.dart';
import 'package:app/utils/time_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

abstract class ComparisonUtils {
  const ComparisonUtils._();

  static const _comparisonObjects = [
    ComparisonObject.currentTemperature,
    ComparisonObject.dayTemperature,
    ComparisonObject.nightTemperature,
    ComparisonObject.dayLength,
    ComparisonObject.sunrise,
    ComparisonObject.sunset,
  ];

  static int get comparisonObjectCount => _comparisonObjects.length;

  static String provideComparisonDescription(
    BuildContext context, {
    required ComparisonObject comparisonObject,
    required CollectionOf2<LocationSingleData> data,
    required TemperatureUnit temperatureUnit,
  }) {
    final Difference? difference = _calculateDataDifference(comparisonObject, data);
    if (difference == null) return '';

    final String differenceDisplay = _provideDifferenceDisplay(
      context,
      difference: difference,
      temperatureUnit: temperatureUnit,
    );

    final String comparisonKeyword;
    if (difference is SecondsDifference) {
      if (comparisonObject == ComparisonObject.dayLength) {
        comparisonKeyword = TimeUtils.provideComparisonKeywordForDuration(context, difference);
      } else {
        comparisonKeyword = TimeUtils.provideComparisonKeywordForTimestamp(context, difference);
      }
    } else if (difference is TemperatureDifference) {
      comparisonKeyword = TemperatureUtils.provideComparisonKeyword(context, difference);
    } else {
      comparisonKeyword = '';
    }

    return [
      differenceDisplay,
      comparisonKeyword,
      S.of(context).comparisonInKeyword,
      data.item1.locationName,
    ].join(' ');
  }

  static ComparisonObject provideComparisonObjectForIndex(int index) {
    if (index < _comparisonObjects.length) {
      return _comparisonObjects[index];
    }
    return ComparisonObject.currentTemperature;
  }

  static String provideComparisonTitle(
    BuildContext context,
    ComparisonObject comparisonObject,
  ) {
    switch (comparisonObject) {
      case ComparisonObject.currentTemperature:
        return S.of(context).comparisonCurrentTemperature;
      case ComparisonObject.dayLength:
        return S.of(context).comparisonDayLength;
      case ComparisonObject.dayTemperature:
        return S.of(context).comparisonDayTemperature;
      case ComparisonObject.nightTemperature:
        return S.of(context).comparisonNightTemperature;
      case ComparisonObject.sunrise:
        return S.of(context).comparisonSunrise;
      case ComparisonObject.sunset:
        return S.of(context).comparisonSunset;
    }
  }

  static DateFormat provideDateFormat(
    TimeFormat timeFormat,
  ) {
    switch (timeFormat) {
      case TimeFormat.twelveHour:
        return Constants.dateFormat12h;
      case TimeFormat.twentyFourHour:
        return Constants.dateFormat24h;
    }
  }

  static Difference? _calculateDataDifference(
    ComparisonObject comparisonObject,
    CollectionOf2<LocationSingleData> data,
  ) {
    try {
      switch (comparisonObject) {
        case ComparisonObject.currentTemperature:
        case ComparisonObject.dayTemperature:
        case ComparisonObject.nightTemperature:
          final double difference = (data.item1.data as double) - (data.item2.data as double);
          return TemperatureDifference(difference);
        case ComparisonObject.dayLength:
        case ComparisonObject.sunrise:
        case ComparisonObject.sunset:
          final int difference = (data.item1.data as int) - (data.item2.data as int);
          return SecondsDifference(difference);
      }
    } catch (_) {
      return null;
    }
  }

  static String _provideDifferenceDisplay(
    BuildContext context, {
    required Difference difference,
    required TemperatureUnit temperatureUnit,
  }) {
    if (difference is SecondsDifference) {
      return TimeUtils.provideTimeDisplayFromSeconds(
        secondsDifference: difference.data.abs(),
        useFullDescription: true,
      );
    } else if (difference is TemperatureDifference) {
      return TemperatureUtils.formatTemperature(
        context,
        temperature: difference.data.abs().round(),
        unit: temperatureUnit,
      );
    }
    return '';
  }
}
