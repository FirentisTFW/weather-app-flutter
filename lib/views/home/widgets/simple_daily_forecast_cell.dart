import 'dart:math';

import 'package:app/networking/endpoints.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/forecast_temperature.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/universal_widgets/app_cached_network_image.dart';
import 'package:app/utils/temperature_utiils.dart';
import 'package:flutter/material.dart';

class SimpleDailyForecastCell extends StatelessWidget {
  final DailyForecast forecast;

  const SimpleDailyForecastCell({
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _builWeatherIcon(),
        const SizedBox(
          width: 4.0,
        ),
        _buildDayOfTheWeek(),
        const Spacer(),
        _buildTemperature(),
        const SizedBox(
          width: 6.0,
        ),
      ],
    );
  }

  Widget _builWeatherIcon() {
    const iconSize = 40.0;
    final String? iconId = forecast.conditions?.first.icon;
    return AppCachedNetworkImage(
      height: iconSize,
      width: iconSize,
      imageUrl: Endpoints.prepareIconUrl(iconId),
    );
  }

  Widget _buildDayOfTheWeek() {
    // TODO Remove mocks
    return Text(
      Random().nextBool() ? 'Mon' : 'Tue',
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTemperature() {
    final ForecastTemperature? temperature = forecast.temperature;
    final String temperatureDisplay = TemperatureUtils.provideDayAndNightTemperature(
      day: temperature?.day,
      night: temperature?.night,
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
