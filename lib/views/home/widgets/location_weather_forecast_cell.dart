import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/networking/endpoints.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:app/universal_widgets/app_cached_network_image.dart';
import 'package:app/views/home/widgets/simple_daily_forecast_cell.dart';
import 'package:flutter/material.dart';

class LocationWeatherForecastCell extends StatelessWidget {
  final CurrentWeather currentWeather;
  final List<DailyForecast> forecast;
  final String locationName;
  final TemperatureUnit temperatureUnit;

  const LocationWeatherForecastCell({
    required this.currentWeather,
    required this.forecast,
    required this.locationName,
    required this.temperatureUnit,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      height: AppDimensions.locationWeatherForecastCellHeight,
      decoration: AppDecorations.defaultCell(),
      onPressed: () {
        // TODO Implement - show data for this location
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 16.0,
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationName(),
            _buildWeatherIconAndDescription(),
            Expanded(
              child: _buildForecast(),
            ),
          ].separatedBy(
            const SizedBox(
              height: 8.0,
            ),
          ),
        ),
        Positioned(
          right: 12.0,
          top: 2.0,
          child: _buildCurrentTemperature(),
        ),
      ],
    );
  }

  Widget _buildLocationName() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Text(
        locationName,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildWeatherIconAndDescription() {
    return Row(
      children: [
        _buildCurrentWeatherIcon(),
        const SizedBox(
          width: 4.0,
        ),
        Flexible(
          child: Text(
            currentWeather.conditions?.first.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: AppTextStyles.text(),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentWeatherIcon() {
    const iconSize = 60.0;
    final String? iconId = currentWeather.conditions?.first.icon;
    return AppCachedNetworkImage(
      height: iconSize,
      width: iconSize,
      imageUrl: Endpoints.prepareIconUrl(iconId),
    );
  }

  Widget _buildCurrentTemperature() {
    return Text(
      currentWeather.temperature?.round().toString() ?? '',
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildForecast() {
    return ListView.separated(
      itemBuilder: (_, index) => SimpleDailyForecastCell(
        forecast: forecast[index],
        temperatureUnit: temperatureUnit,
      ),
      itemCount: forecast.length, // TODO Consider showing only 3 days by default
      padding: EdgeInsets.zero,
      separatorBuilder: (_, __) => const SizedBox(
        height: 4.0,
      ),
    );
  }
}
