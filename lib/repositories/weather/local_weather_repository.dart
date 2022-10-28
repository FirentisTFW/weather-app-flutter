import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/networking/json_parser.dart';
import 'package:app/networking/models/weather_data.dart';
import 'package:app/repositories/weather/weather_repository.dart';
import 'package:app/storage/storage.dart';
import 'package:app/storage/storage_keys.dart';

class LocalWeatherRepository implements WeatherRepository {
  final Storage storage;

  const LocalWeatherRepository({
    required this.storage,
  });

  @override
  Future<WeatherData> getCurrentWeatherAndForecast({
    required NamedLocation location,
    required TemperatureUnit temperatureUnit,
  }) async {
    final String? cachedResponse = await storage.getString(StorageKeys.cachedWeatherAndForecast1);
    if (cachedResponse.isNullOrBlank) throw Exception();
    return JsonParser.parseSingleObjectResponse<WeatherData>(cachedResponse);
  }
}
