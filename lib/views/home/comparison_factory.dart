import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/difference.dart';
import 'package:app/data/models/single_location_data.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/utils/temperature_utiils.dart';
import 'package:app/utils/time_utils.dart';
import 'package:flutter/widgets.dart';

abstract class ComparisonFactory {
  const ComparisonFactory._();

  static String provideComparisonDescription(
    BuildContext context, {
    required ComparisonObject comparisonObject,
    required CollectionOf2<SingleLocationData> data,
  }) {
    final Difference? difference = _calculateDataDifference(comparisonObject, data);
    if (difference == null) return '';

    final String differenceDisplay = _provideDifferenceDisplay(difference);

    final String comparisonKeyword;
    if (difference is SecondsDifference) {
      if (comparisonObject == ComparisonObject.dayLength) {
        comparisonKeyword = TimeUtils.provideComparisonKeywordForDuration(difference);
      } else {
        comparisonKeyword = TimeUtils.provideComparisonKeywordForTimestamp(difference);
      }
    } else if (difference is TemperatureDifference) {
      comparisonKeyword = TemperatureUtils.provideComparisonKeyword(difference);
    } else {
      comparisonKeyword = '';
    }

    return [
      differenceDisplay,
      comparisonKeyword,
      'in',
      data.item1.locationName,
    ].join(' ');
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

  static Difference? _calculateDataDifference(
    ComparisonObject comparisonObject,
    CollectionOf2<SingleLocationData> data,
  ) {
    try {
      switch (comparisonObject) {
        case ComparisonObject.currentTemperature:
        case ComparisonObject.dayTemperature:
        case ComparisonObject.nightTemperature:
          // TODO
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

  static String _provideDifferenceDisplay(Difference difference) {
    if (difference is SecondsDifference) {
      return TimeUtils.provideTimeDifferenceDisplay(
        minutesDifference: difference.data,
      );
    } else if (difference is TemperatureDifference) {
      return TemperatureUtils.formatTemperature(difference.data.abs().round());
    }
    return '';
  }
}
