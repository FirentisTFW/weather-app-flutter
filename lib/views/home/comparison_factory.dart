import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/single_location_data.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/location_weather_data.dart';
import 'package:app/utils/temperature_utiils.dart';
import 'package:app/utils/time_utils.dart';
import 'package:intl/intl.dart';

abstract class ComparisonFactory {
  const ComparisonFactory._();

  static CollectionOf2<SingleLocationData>? prepareWeatherDataForComparison({
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
    } catch (error) {
      return null;
    }
  }

  static CollectionOf2<SingleLocationData> _prepareDataForCurrentTemperature(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final double firstTemperature = weatherData.item1.currentWeather!.temperature!;
    final double secondTemperature = weatherData.item2.currentWeather!.temperature!;

    // TODO  remove mocks in location name
    return CollectionOf2(
      SingleLocationData(
        data: firstTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(firstTemperature.round()),
        locationName: 'Poznań',
      ),
      SingleLocationData(
        data: secondTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(secondTemperature.round()),
        locationName: 'Malaga',
      ),
    );
  }

  static CollectionOf2<SingleLocationData> _prepareDataForDayLength(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final CurrentWeather firstWeather = weatherData.item1.currentWeather!;
    final CurrentWeather secondWeather = weatherData.item2.currentWeather!;

    final int firstDayLength = firstWeather.sunset! - firstWeather.sunrise!;
    final int secondDayLength = secondWeather.sunset! - secondWeather.sunrise!;

    // TODO  remove mocks in location name
    return CollectionOf2(
      SingleLocationData(
        data: firstDayLength,
        dataDisplay: TimeUtils.provideTimeDisplayFromSeconds(
          secondsDifference: firstDayLength,
        ),
        locationName: 'Poznań',
      ),
      SingleLocationData(
        data: secondDayLength,
        dataDisplay: TimeUtils.provideTimeDisplayFromSeconds(
          secondsDifference: secondDayLength,
        ),
        locationName: 'Malaga',
      ),
    );
  }

  static CollectionOf2<SingleLocationData>? _prepareDataForDayTemperature(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final double firstTemperature = weatherData.item1.dailyForecast!.first.temperature!.day!;
    final double secondTemperature = weatherData.item2.dailyForecast!.first.temperature!.day!;

    // TODO  remove mocks in location name
    return CollectionOf2(
      SingleLocationData(
        data: firstTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(firstTemperature.round()),
        locationName: 'Poznań',
      ),
      SingleLocationData(
        data: secondTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(secondTemperature.round()),
        locationName: 'Malaga',
      ),
    );
  }

  static CollectionOf2<SingleLocationData>? _prepareDataForNightTemperature(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    final double firstTemperature = weatherData.item1.dailyForecast!.first.temperature!.night!;
    final double secondTemperature = weatherData.item2.dailyForecast!.first.temperature!.night!;

    // TODO  remove mocks in location name
    return CollectionOf2(
      SingleLocationData(
        data: firstTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(firstTemperature.round()),
        locationName: 'Poznań',
      ),
      SingleLocationData(
        data: secondTemperature,
        dataDisplay: TemperatureUtils.formatTemperature(secondTemperature.round()),
        locationName: 'Malaga',
      ),
    );
  }

  static CollectionOf2<SingleLocationData> _prepareDataForSunrise(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    const int milisecondsInSecond = 1000;

    final int firstSunrise = weatherData.item1.currentWeather!.sunrise!;
    final int secondSunrise = weatherData.item2.currentWeather!.sunrise!;

    // TODO  remove mocks in location name

    return CollectionOf2(
      SingleLocationData(
        data: firstSunrise,
        dataDisplay:
            DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(firstSunrise * milisecondsInSecond)),
        locationName: 'Poznań',
      ),
      SingleLocationData(
        data: secondSunrise,
        dataDisplay:
            DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(secondSunrise * milisecondsInSecond)),
        locationName: 'Malaga',
      ),
    );
  }

  static CollectionOf2<SingleLocationData> _prepareDataForSunset(
    CollectionOf2<LocationWeatherData> weatherData,
  ) {
    const int milisecondsInSecond = 1000;

    final int firstSunset = weatherData.item1.currentWeather!.sunset!;
    final int secondSunset = weatherData.item2.currentWeather!.sunset!;

    // TODO  remove mocks in location name

    return CollectionOf2(
      SingleLocationData(
        data: firstSunset,
        dataDisplay: DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(firstSunset * milisecondsInSecond)),
        locationName: 'Poznań',
      ),
      SingleLocationData(
        data: secondSunset,
        dataDisplay:
            DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(secondSunset * milisecondsInSecond)),
        locationName: 'Malaga',
      ),
    );
  }
}
