import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/data/models/location_single_data.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/utils/comparison_utils.dart';
import 'package:app/utils/temperature_utiils.dart';
import 'package:app/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class ComparisonFactory {
  const ComparisonFactory._();

  static CollectionOf2<LocationSingleData>? prepareWeatherDataForComparison(
    BuildContext context, {
    required ComparisonObject comparisonObject,
    required TemperatureUnit temperatureUnit,
    required TimeFormat timeFormat,
    required CollectionOf2<LocationWeatherData> weatherData,
  }) {
    try {
      switch (comparisonObject) {
        case ComparisonObject.currentTemperature:
          return _prepareDataForCurrentTemperature(
            context,
            weatherData: weatherData,
            unit: temperatureUnit,
          );
        case ComparisonObject.dayLength:
          return _prepareDataForDayLength(weatherData);
        case ComparisonObject.dayTemperature:
          return _prepareDataForDayTemperature(
            context,
            weatherData: weatherData,
            unit: temperatureUnit,
          );
        case ComparisonObject.nightTemperature:
          return _prepareDataForNightTemperature(
            context,
            weatherData: weatherData,
            unit: temperatureUnit,
          );
        case ComparisonObject.sunrise:
          return _prepareDataForSunrise(
            format: timeFormat,
            weatherData: weatherData,
          );
        case ComparisonObject.sunset:
          return _prepareDataForSunset(
            format: timeFormat,
            weatherData: weatherData,
          );
      }
    } catch (_) {
      return null;
    }
  }

  static CollectionOf2<LocationSingleData> _prepareDataForCurrentTemperature(
    BuildContext context, {
    required CollectionOf2<LocationWeatherData> weatherData,
    required TemperatureUnit unit,
  }) {
    final double firstTemperature = weatherData.item1.currentWeather!.temperature!;
    final double secondTemperature = weatherData.item2.currentWeather!.temperature!;

    return _prepareDataForTemperature(
      context,
      locationNames: CollectionOf2(weatherData.item1.locationName, weatherData.item2.locationName),
      temperatures: CollectionOf2(firstTemperature, secondTemperature),
      unit: unit,
    );
  }

  static CollectionOf2<LocationSingleData> _prepareDataForDayLength(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final CurrentWeather firstWeather = weatherData.item1.currentWeather!;
    final CurrentWeather secondWeather = weatherData.item2.currentWeather!;

    final int firstDayLength = firstWeather.sunset! - firstWeather.sunrise!;
    final int secondDayLength = secondWeather.sunset! - secondWeather.sunrise!;

    return CollectionOf2(
      LocationSingleData(
        data: firstDayLength,
        dataDisplay: TimeUtils.provideTimeDisplayFromSeconds(
          secondsDifference: firstDayLength,
        ),
        locationName: weatherData.item1.locationName,
      ),
      LocationSingleData(
        data: secondDayLength,
        dataDisplay: TimeUtils.provideTimeDisplayFromSeconds(
          secondsDifference: secondDayLength,
        ),
        locationName: weatherData.item2.locationName,
      ),
    );
  }

  static CollectionOf2<LocationSingleData>? _prepareDataForDayTemperature(
    BuildContext context, {
    required CollectionOf2<LocationWeatherData> weatherData,
    required TemperatureUnit unit,
  }) {
    final double firstTemperature = weatherData.item1.dailyForecast!.first.temperature!.day!;
    final double secondTemperature = weatherData.item2.dailyForecast!.first.temperature!.day!;

    return _prepareDataForTemperature(
      context,
      locationNames: CollectionOf2(weatherData.item1.locationName, weatherData.item2.locationName),
      temperatures: CollectionOf2(firstTemperature, secondTemperature),
      unit: unit,
    );
  }

  static CollectionOf2<LocationSingleData>? _prepareDataForNightTemperature(
    BuildContext context, {
    required CollectionOf2<LocationWeatherData> weatherData,
    required TemperatureUnit unit,
  }) {
    final double firstTemperature = weatherData.item1.dailyForecast!.first.temperature!.night!;
    final double secondTemperature = weatherData.item2.dailyForecast!.first.temperature!.night!;

    return _prepareDataForTemperature(
      context,
      locationNames: CollectionOf2(weatherData.item1.locationName, weatherData.item2.locationName),
      temperatures: CollectionOf2(firstTemperature, secondTemperature),
      unit: unit,
    );
  }

  static CollectionOf2<LocationSingleData> _prepareDataForSunrise({
    required TimeFormat format,
    required CollectionOf2<LocationWeatherData> weatherData,
  }) {
    final int firstSunrise = weatherData.item1.currentWeather!.sunrise!;
    final int secondSunrise = weatherData.item2.currentWeather!.sunrise!;

    return _prepareDataForTimeStamp(
      format: format,
      locationNames: CollectionOf2(weatherData.item1.locationName, weatherData.item2.locationName),
      timeStampsInSeconds: CollectionOf2(firstSunrise, secondSunrise),
    );
  }

  static CollectionOf2<LocationSingleData> _prepareDataForSunset({
    required TimeFormat format,
    required CollectionOf2<LocationWeatherData> weatherData,
  }) {
    final int firstSunset = weatherData.item1.currentWeather!.sunset!;
    final int secondSunset = weatherData.item2.currentWeather!.sunset!;

    return _prepareDataForTimeStamp(
      format: format,
      locationNames: CollectionOf2(weatherData.item1.locationName, weatherData.item2.locationName),
      timeStampsInSeconds: CollectionOf2(firstSunset, secondSunset),
    );
  }

  static CollectionOf2<LocationSingleData> _prepareDataForTemperature(
    BuildContext context, {
    required CollectionOf2<String> locationNames,
    required CollectionOf2<double> temperatures,
    required TemperatureUnit unit,
  }) {
    return CollectionOf2(
      LocationSingleData(
        data: temperatures.item1,
        dataDisplay: TemperatureUtils.formatTemperature(
          context,
          temperature: temperatures.item1.round(),
          unit: unit,
        ),
        locationName: locationNames.item1,
      ),
      LocationSingleData(
        data: temperatures.item2,
        dataDisplay: TemperatureUtils.formatTemperature(
          context,
          temperature: temperatures.item2.round(),
          unit: unit,
        ),
        locationName: locationNames.item2,
      ),
    );
  }

  static CollectionOf2<LocationSingleData> _prepareDataForTimeStamp({
    required TimeFormat format,
    required CollectionOf2<String> locationNames,
    required CollectionOf2<int> timeStampsInSeconds,
  }) {
    const int millisecondsInSecond = 1000;

    final DateFormat timeFormat = ComparisonUtils.provideDateFormat(format);

    return CollectionOf2(
      LocationSingleData(
        data: timeStampsInSeconds.item1,
        dataDisplay:
            timeFormat.format(DateTime.fromMillisecondsSinceEpoch(timeStampsInSeconds.item1 * millisecondsInSecond)),
        locationName: locationNames.item1,
      ),
      LocationSingleData(
        data: timeStampsInSeconds.item2,
        dataDisplay:
            timeFormat.format(DateTime.fromMillisecondsSinceEpoch(timeStampsInSeconds.item2 * millisecondsInSecond)),
        locationName: locationNames.item2,
      ),
    );
  }
}
