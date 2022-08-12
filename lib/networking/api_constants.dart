// NOTEL this file is not in version control
import 'package:app/networking/api_key.dart';

abstract class ApiConstants {
  ApiConstants._();

  static const String apiKey = ApiKey.key;
  static const String baseUrl = 'https://api.openweathermap.org/';
  static const Duration timeoutDuration = Duration(
    seconds: 30,
  );

  static final _Parameters parameters = _Parameters();
  static final _ParameterValues parameterValues = _ParameterValues();
}

class _Parameters {
  final String latitude = 'lat';
  final String limit = 'limit';
  final String longitude = 'lon';
  final String query = 'q';
  final String units = 'units';
}

class _ParameterValues {
  final String unitsMetric = 'metric';
}
