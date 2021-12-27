import 'package:app/commons/mocks.dart';
import 'package:app/data/models/location_weather_data.dart';
import 'package:app/repositories/weather/weather_repository.dart';

class FakeWeatherRepository implements WeatherRepository {
  const FakeWeatherRepository();

  @override
  Future<LocationWeatherData> getCurrentWeatherAndForecast() async {
    await _simulateDelay();

    return Mocks.locationWeatherData;
  }

  Future<void> _simulateDelay() async => Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
}
