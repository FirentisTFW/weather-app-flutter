import 'package:app/errors/app_error_factory.dart';
import 'package:app/networking/models/location_weather_data.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/universal_widgets/error_view.dart';
import 'package:app/views/home/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
      ),
    );
  }

  Widget _buildLoadedBody(LocationWeatherData weatherData) {
    return Container();
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
}
