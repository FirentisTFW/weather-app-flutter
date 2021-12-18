import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/difference.dart';
import 'package:app/data/models/single_location_data.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

abstract class ComparisonFactory {
  const ComparisonFactory._();

  static String provideComparisonDescription(
    BuildContext context, {
    required ComparisonObject comparisonObject,
    required CollectionOf2<SingleLocationData> data,
  }) {
    // 1 Calculate the difference between locations
    final Difference? difference = _calculateDataDifference(comparisonObject, data);
    if (difference == null) {
      return '';
    }

    // 2 Get difference display (i.e. 83 -> '1 hour 23 minutes', 11 -> '11 degrees')

    // 3 Get comparison keyword (1st warmer/cooler than 2nd)
    if (difference is SecondsDifference) {
      if (comparisonObject == ComparisonObject.dayLength) {
        // get comparison keyword based on time (longer/shorter)
      } else {
        // get comparison keyword based on time (sooner/later)
      }
    } else if (difference is TemperatureDifference) {
      // get comparison keyword based on temperature (cooler/warmer)
    }

    // 4 Combine location names, difference display and keyword into one string

    return '';
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
}
