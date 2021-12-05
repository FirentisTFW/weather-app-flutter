import 'package:app/errors/app_error_factory.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/networking/models/location_weather_data.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/universal_widgets/error_view.dart';
import 'package:app/views/home/home_providers.dart';
import 'package:app/views/home/widgets/location_weather_forecast_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEEE),
      body: Center(
        child: Consumer(
          builder: (context, ref, __) {
            final AsyncValue<LocationWeatherData> response = ref.watch(homeProvider);
            return response.when(
              data: (weatherData) => _buildLoadedBody(weatherData),
              error: (error, __) => _buildErrorBody(context, error),
              loading: () => const AppProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorBody(BuildContext context, dynamic error) {
    return ErrorView(
      message: AppErrorFactory.provideMessage(context, error),
      onButtonPressed: () {
        // TODO Implement - refresh page
      },
      title: AppErrorFactory.provideTitle(context, error),
    );
  }

  Widget _buildLoadedBody(LocationWeatherData weatherData) {
    return Padding(
      padding: AppDimensions.defaultPaddingAll,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildLocationtWeatherForecastCells(weatherData),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationtWeatherForecastCells(LocationWeatherData weatherData) {
    final CurrentWeather? currentWeather = weatherData.currentWeather;
    final List<DailyForecast>? forecast = weatherData.dailyForecast;
    return Row(
      children: [
        if (currentWeather != null && forecast != null) ...[
          Expanded(
            child: LocationWeatherForecastCell(
              currentWeather: currentWeather,
              forecast: forecast,
              // TODO Remove mocks
              locationName: 'Poznań',
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: LocationWeatherForecastCell(
              currentWeather: currentWeather,
              forecast: forecast,
              // TODO Remove mocks
              locationName: 'Malaga',
            ),
          ),
        ]
      ],
    );
  }
}
