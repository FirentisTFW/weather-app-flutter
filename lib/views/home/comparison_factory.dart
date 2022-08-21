import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/location_single_data.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/utils/temperature_utiils.dart';
import 'package:app/utils/time_utils.dart';
import 'package:intl/intl.dart';

abstract class ComparisonFactory {
  const ComparisonFactory._();

  static CollectionOf2<LocationSingleData>? prepareWeatherDataForComparison({
    required ComparisonObject comparisonObject,
    required CollectionOf2<LocationWeatherData> weatherData,
  }) {
    try {
      switch (comparisonObject) {
        case ComparisonObject.currentTemperature:
          return _prepareDataForCurrentTemperature(weatherData);
        case ComparisonObject.dayLength:
          return _prepareDataForDayLength(weatherData);
        case ComparisonObject.dayTemperature:
          return _prepareDataForDayTemperature(weatherData);
        case ComparisonObject.nightTemperature:
          return _prepareDataForNightTemperature(weatherData);
        case ComparisonObject.sunrise:
          return _prepareDataForSunrise(weatherData);
        case ComparisonObject.sunset:
          return _prepareDataForSunset(weatherData);
      }
    } catch (_) {
      return null;
    }
  }

  static CollectionOf2<LocationSingleData> _prepareDataForCurrentTemperature(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final double firstTemperature = weatherData.item1.currentWeather!.temperature!;
    final double secondTemperature = weatherData.item2.currentWeather!.temperature!;

    return CollectionOf2(
      LocationSingleData(
        data: firstTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(firstTemperature.round()),
        locationName: weatherData.item1.locationName,
      ),
      LocationSingleData(
        data: secondTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(secondTemperature.round()),
        locationName: weatherData.item2.locationName,
      ),
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
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final double firstTemperature = weatherData.item1.dailyForecast!.first.temperature!.day!;
    final double secondTemperature = weatherData.item2.dailyForecast!.first.temperature!.day!;

    return CollectionOf2(
      LocationSingleData(
        data: firstTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(firstTemperature.round()),
        locationName: weatherData.item1.locationName,
      ),
      LocationSingleData(
        data: secondTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(secondTemperature.round()),
        locationName: weatherData.item2.locationName,
      ),
    );
  }

  static CollectionOf2<LocationSingleData>? _prepareDataForNightTemperature(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final double firstTemperature = weatherData.item1.dailyForecast!.first.temperature!.night!;
    final double secondTemperature = weatherData.item2.dailyForecast!.first.temperature!.night!;

    return CollectionOf2(
      LocationSingleData(
        data: firstTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(firstTemperature.round()),
        locationName: weatherData.item1.locationName,
      ),
      LocationSingleData(
        data: secondTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(secondTemperature.round()),
        locationName: weatherData.item2.locationName,
      ),
    );
  }

  static CollectionOf2<LocationSingleData> _prepareDataForSunrise(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    const int millisecondsInSecond = 1000;

    final int firstSunrise = weatherData.item1.currentWeather!.sunrise!;
    final int secondSunrise = weatherData.item2.currentWeather!.sunrise!;

    return CollectionOf2(
      LocationSingleData(
        data: firstSunrise,
        dataDisplay:
            DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(firstSunrise * millisecondsInSecond)),
        locationName: weatherData.item1.locationName,
      ),
      LocationSingleData(
        data: secondSunrise,
        dataDisplay:
            DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(secondSunrise * millisecondsInSecond)),
        locationName: weatherData.item2.locationName,
      ),
    );
  }

  static CollectionOf2<LocationSingleData> _prepareDataForSunset(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    const int milisecondsInSecond = 1000;

    final int firstSunset = weatherData.item1.currentWeather!.sunset!;
    final int secondSunset = weatherData.item2.currentWeather!.sunset!;

    return CollectionOf2(
      LocationSingleData(
        data: firstSunset,
        dataDisplay: DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(firstSunset * milisecondsInSecond)),
        locationName: weatherData.item1.locationName,
      ),
      LocationSingleData(
        data: secondSunset,
        dataDisplay:
            DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(secondSunset * milisecondsInSecond)),
        locationName: weatherData.item2.locationName,
      ),
    );
  }
}
