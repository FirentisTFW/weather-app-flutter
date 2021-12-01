import 'package:flutter/cupertino.dart';

abstract class AppLocales {
  const AppLocales._();

  static const Locale english = Locale.fromSubtags(
    countryCode: 'EN',
    languageCode: 'en',
  );
  static const Locale polish = Locale.fromSubtags(
    countryCode: 'PL',
    languageCode: 'pl',
  );
}
