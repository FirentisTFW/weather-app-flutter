import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/networking/endpoints.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/forecast_temperature.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/universal_widgets/app_cached_network_image.dart';
import 'package:app/universal_widgets/space.dart';
import 'package:app/utils/date_utils.dart' as du;
import 'package:app/utils/temperature_utiils.dart';
import 'package:flutter/material.dart';

class SimpleDailyForecastCell extends StatelessWidget {
  final DailyForecast forecast;
  final TemperatureUnit temperatureUnit;

  const SimpleDailyForecastCell({
    required this.forecast,
    required this.temperatureUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _builWeatherIcon(),
        const Space.horizontal(4.0),
        _buildDayOfTheWeek(context),
        const Spacer(),
        _buildTemperature(context),
        const Space.horizontal(6.0),
      ],
    );
  }

  Widget _builWeatherIcon() {
    const double iconSize = 40.0;
    final String? iconId = forecast.conditions?.first.icon;
    return AppCachedNetworkImage(
      height: iconSize,
      width: iconSize,
      imageUrl: Endpoints.prepareIconUrl(iconId),
    );
  }

  Widget _buildDayOfTheWeek(BuildContext context) {
    return Text(
      du.DateUtils.provideWeekdayBasedOnTime(
        context,
        timeInSeconds: forecast.date,
      ),
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTemperature(BuildContext context) {
    final ForecastTemperature? temperature = forecast.temperature;
    final String temperatureDisplay = TemperatureUtils.provideDayAndNightTemperature(
      context,
      day: temperature?.day,
      night: temperature?.night,
      unit: temperatureUnit,
    );
    return Text(
      temperatureDisplay,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
