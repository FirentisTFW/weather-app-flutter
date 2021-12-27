import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/location_single_data.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/errors/app_error_factory.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/universal_widgets/error_view.dart';
import 'package:app/utils/comparison_utils.dart';
import 'package:app/views/home/comparison_factory.dart';
import 'package:app/views/home/home_providers.dart';
import 'package:app/views/home/widgets/comparison_cell.dart';
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
            final AsyncValue<CollectionOf2<LocationWeatherData>> response = ref.watch(homeProvider);
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

  Widget _buildLoadedBody(CollectionOf2<LocationWeatherData> weatherData) {
    return Padding(
      padding: AppDimensions.defaultPaddingAll,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildButtons(),
            _buildLocationtWeatherForecastCells(weatherData),
            _buildComparisonCells(weatherData),
          ].separatedBy(
            const SizedBox(
              height: 24.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    // TODO Implement
    return const SizedBox(
      height: 20.0,
    );
  }

  Widget _buildLocationtWeatherForecastCells(CollectionOf2<LocationWeatherData> weatherData) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildLocationWeatherForecastCell(weatherData.item1),
        ),
        Expanded(
          child: _buildLocationWeatherForecastCell(weatherData.item2),
        ),
      ].separatedBy(
        const SizedBox(
          width: 10.0,
        ),
      ),
    );
  }

  Widget _buildLocationWeatherForecastCell(LocationWeatherData weatherData) {
    final CurrentWeather? currentWeather = weatherData.currentWeather;
    final List<DailyForecast>? forecast = weatherData.dailyForecast;

    if (currentWeather == null || forecast == null) {
      return const SizedBox.shrink();
    }
    return LocationWeatherForecastCell(
      currentWeather: currentWeather,
      forecast: forecast,
      locationName: weatherData.locationName,
    );
  }

  Widget _buildComparisonCells(CollectionOf2<LocationWeatherData> weatherData) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final ComparisonObject comparisonObject = ComparisonUtils.provideComparisonObjectForIndex(index);
        final CollectionOf2<LocationSingleData>? comparisonData = ComparisonFactory.prepareWeatherDataForComparison(
          comparisonObject: comparisonObject,
          weatherData: weatherData,
        );
        if (comparisonData == null) {
          return const SizedBox.shrink();
        }
        return ComparisonCell(
          comparisonObject: comparisonObject,
          data: comparisonData,
        );
      },
      itemCount: ComparisonUtils.comparisonObjectCount,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(
        height: 8.0,
      ),
      shrinkWrap: true,
    );
  }
}
