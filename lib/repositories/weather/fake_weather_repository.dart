import 'package:app/repositories/weather/weather_repository.dart';

class FakeWeatherRepository implements WeatherRepository {
  const FakeWeatherRepository();

  @override
  Future getCurrentWeatherAndForecast() {
    // TODO implement getCurrentWeather
    throw UnimplementedError();
  }
}
