import 'package:app/networking/api_constants.dart';
import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  static const String _apiKeyParameter = 'appid';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters.putIfAbsent(_apiKeyParameter, () => ApiConstants.apiKey);
    return super.onRequest(options, handler);
  }
}
