import 'package:app/commons/mocks.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/networking/models/weather_data.dart';
import 'package:app/repositories/weather/weather_repository.dart';

class FakeWeatherRepository implements WeatherRepository {
  const FakeWeatherRepository();

  @override
  Future<WeatherData> getCurrentWeatherAndForecast({
    required NamedLocation location,
  }) async {
    await _simulateDelay();

    if (location.name == 'Poznań') {
      return Mocks.weatherData1;
    } else {
      return Mocks.weatherData2;
    }
  }

  Future<void> _simulateDelay() async => Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
}
