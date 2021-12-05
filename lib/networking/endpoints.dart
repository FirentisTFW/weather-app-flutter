abstract class Endpoints {
  const Endpoints._();

  static const _baseIconUrl = 'https://openweathermap.org/img/wn';

  static String? prepareIconUrl(String? iconId) => iconId != null ? '$_baseIconUrl/$iconId@2x.png' : null;
}
