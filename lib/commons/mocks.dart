import 'dart:math';

import 'package:app/data/models/location_weather_data.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/forecast_temperature.dart';
import 'package:app/networking/models/hourly_forecast.dart';
import 'package:app/networking/models/weather_condition.dart';
import 'package:app/networking/models/weather_data.dart';
import 'package:app/utils/random_data_utils.dart';

abstract class Mocks {
  const Mocks._();

  static const currentWeather = CurrentWeather(
    conditions: [
      WeatherCondition(
        description: 'scattered clouds',
        icon: '03n',
        title: 'Clouds',
      ),
    ],
    humidity: 55,
    feelsLike: 16.7,
    pressure: 1010,
    sunrise: 1637823965,
    sunset: 1637859823,
    temperature: 17.2,
    uvIndex: 4.0,
    windDegree: 248.0,
    windSpeed: 3.13,
  );

  static final List<DailyForecast> dailyForecast = _prepareDailyForecast(
    howManyDays: 5,
  );

  static final List<HourlyForecast> hourlyForecast = _prepareHourlyForecast(
    howManyHours: 24,
  );

  static final locationWeatherData = LocationWeatherData(
    locationName: 'Poznań',
    weatherData: WeatherData(
      currentWeather: currentWeather,
      dailyForecast: dailyForecast,
      hourlyForecast: hourlyForecast,
      latitude: 36.7202,
      longitude: -4.4203,
      timezoneOffset: 3600,
    ),
  );

  static List<HourlyForecast> _prepareHourlyForecast({
    required int howManyHours,
  }) {
    final List<HourlyForecast> forecast = [];
    for (int i = 0; i < howManyHours; i++) {
      final bool sunny = Random().nextBool();
      forecast.add(
        HourlyForecast(
          conditions: [
            WeatherCondition(
              description: sunny ? 'clear sky' : 'scattered clouds',
              icon: sunny ? '01d' : '03n',
              title: sunny ? 'Clear' : 'Clouds',
            ),
          ],
          feelsLike: 16.6,
          temperature: RandomDataUtils.randomDoubleFromRange(14, 18),
          time: DateTime.now().millisecondsSinceEpoch + _MocksConstants.milisecondsInHour * (i + 1),
        ),
      );
    }

    return forecast;
  }

  static List<DailyForecast> _prepareDailyForecast({
    required int howManyDays,
  }) {
    final List<DailyForecast> forecast = [];
    for (int i = 0; i < howManyDays; i++) {
      final bool sunny = Random().nextBool();
      forecast.add(
        DailyForecast(
          conditions: [
            WeatherCondition(
              description: sunny ? 'clear sky' : 'scattered clouds',
              icon: sunny ? '01d' : '03n',
              title: sunny ? 'Clear' : 'Clouds',
            ),
          ],
          date: DateTime(2021, 11, 27).millisecondsSinceEpoch,
          humidity: 48,
          pressure: 1010,
          sunrise: 1637996883,
          sunset: 1638032582,
          temperature: ForecastTemperature(
            day: RandomDataUtils.randomDoubleFromRange(14, 18),
            max: RandomDataUtils.randomDoubleFromRange(17, 18),
            min: RandomDataUtils.randomDoubleFromRange(10, 13),
            night: RandomDataUtils.randomDoubleFromRange(10, 14),
          ),
          uvIndex: RandomDataUtils.randomDoubleFromRange(2, 4),
          windDegree: 315,
          windSpeed: RandomDataUtils.randomDoubleFromRange(5, 35),
        ),
      );
    }

    return forecast;
  }
}

abstract class _MocksConstants {
  const _MocksConstants._();

  static const int milisecondsInHour = 3600000;
}
