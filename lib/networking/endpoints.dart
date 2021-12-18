abstract class Endpoints {
  const Endpoints._();

  static const _baseIconUrl = 'https://openweathermap.org/img/wn';

  static const _defaultIconSize = '2x';

  static String? prepareIconUrl(String? iconId) =>
      iconId != null ? '$_baseIconUrl/$iconId@$_defaultIconSize.png' : null;
}
