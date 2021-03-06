import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/location_single_data.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/errors/app_error_factory.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/networking/models/current_weather.dart';
import 'package:app/networking/models/daily_forecast.dart';
import 'package:app/routing.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/universal_widgets/error_view.dart';
import 'package:app/utils/comparison_utils.dart';
import 'package:app/views/home/comparison_factory.dart';
import 'package:app/views/home/home_providers.dart';
import 'package:app/views/home/home_state.dart';
import 'package:app/views/home/widgets/comparison_cell.dart';
import 'package:app/views/home/widgets/location_weather_forecast_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).fetchLocationsWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightYellow,
      body: SafeArea(
        child: Center(
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    final HomeState state = ref.watch(homeProvider);
    final Widget child;

    if (state is HomeFetchFailure) {
      child = _buildErrorBody(context, state.error);
    } else if (state is HomeFetchSucces) {
      child = _buildLoadedBody(context, state.weatherData);
    } else {
      child = const AppProgressIndicator();
    }

    return AnimatedSwitcher(
      duration: AppAnimations.animatedSwitcherDuration,
      child: child,
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

  Widget _buildLoadedBody(BuildContext context, CollectionOf2<LocationWeatherData> weatherData) {
    return SingleChildScrollView(
      padding: AppDimensions.defaultPaddingAll,
      child: Column(
        children: [
          _buildButtons(context),
          _buildLocationtWeatherForecastCells(weatherData),
          _buildComparisonCells(weatherData),
        ].separatedBy(
          const SizedBox(
            height: 24.0,
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    // TODO Add layout buttons (horizontal/vertical alignment)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSettingsIcon(context),
        _buildLocationsButton(context),
      ],
    );
  }

  Widget _buildSettingsIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routing.settings),
      child: const Icon(
        Icons.settings,
        size: 32.0,
      ),
    );
  }

  Widget _buildLocationsButton(BuildContext context) {
    return AdaptiveButton(
      height: 40.0,
      onPressed: () => Navigator.pushNamed(context, Routing.locationsList),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        child: Text(
          S.of(context).homeManageLocationsButton,
          style: AppTextStyles.header(),
        ),
      ),
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
