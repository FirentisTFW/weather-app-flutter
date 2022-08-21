import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/networking/api_helpers_mixin.dart';
import 'package:app/networking/endpoints.dart';
import 'package:app/networking/json_parser.dart';
import 'package:app/networking/models/weather_data.dart';
import 'package:app/repositories/weather/weather_repository.dart';
import 'package:dio/dio.dart';

class NetworkWeatherRepository with ApiHelpers implements WeatherRepository {
  final Dio dio;

  const NetworkWeatherRepository({
    required this.dio,
  });

  @override
  Future<WeatherData> getCurrentWeatherAndForecast({
    required NamedLocation location,
    required TemperatureUnit temperatureUnit,
  }) async {
    final Response response = await dio.get(
      Endpoints.weather.weatherAndForecast,
      queryParameters: {
        ApiHelpers.parameters.latitude: location.latitude,
        ApiHelpers.parameters.longitude: location.longitude,
        ApiHelpers.parameters.units: temperatureUnit.apiParameterValue,
      },
    );
    return JsonParser.parseSingleObjectResponse<WeatherData>(response.data);
  }
}
