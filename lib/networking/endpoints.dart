abstract class Endpoints {
  const Endpoints._();

  static const String _baseIconUrl = 'https://openweathermap.org/img/wn';
  static const String _defaultIconSize = '2x';

  static final _Geocoding geocoding = _Geocoding();

  static String? prepareIconUrl(String? iconId) =>
      iconId != null ? '$_baseIconUrl/$iconId@$_defaultIconSize.png' : null;
}

class _Geocoding {
  static const String _prefix = 'geo/$_version';
  static const String _version = '1.0';

  final String geocodingPropositions = '$_prefix/direct';
}
