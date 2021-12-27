// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Weather App`
  String get appName {
    return Intl.message(
      'Weather App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Oops, something went wrong`
  String get defaultErrorTitle {
    return Intl.message(
      'Oops, something went wrong',
      name: 'defaultErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occured while fetching data.`
  String get defaultErrorMessage {
    return Intl.message(
      'An error occured while fetching data.',
      name: 'defaultErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Current temperature`
  String get comparisonCurrentTemperature {
    return Intl.message(
      'Current temperature',
      name: 'comparisonCurrentTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Day temperature`
  String get comparisonDayTemperature {
    return Intl.message(
      'Day temperature',
      name: 'comparisonDayTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Night temperature`
  String get comparisonNightTemperature {
    return Intl.message(
      'Night temperature',
      name: 'comparisonNightTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise`
  String get comparisonSunrise {
    return Intl.message(
      'Sunrise',
      name: 'comparisonSunrise',
      desc: '',
      args: [],
    );
  }

  /// `Sunset`
  String get comparisonSunset {
    return Intl.message(
      'Sunset',
      name: 'comparisonSunset',
      desc: '',
      args: [],
    );
  }

  /// `Day length`
  String get comparisonDayLength {
    return Intl.message(
      'Day length',
      name: 'comparisonDayLength',
      desc: '',
      args: [],
    );
  }

  /// `cooler`
  String get temperatureComparisonKeywordNegative {
    return Intl.message(
      'cooler',
      name: 'temperatureComparisonKeywordNegative',
      desc: '',
      args: [],
    );
  }

  /// `warmer`
  String get temperatureComparisonKeywordPositive {
    return Intl.message(
      'warmer',
      name: 'temperatureComparisonKeywordPositive',
      desc: '',
      args: [],
    );
  }

  /// `shorter`
  String get timeComparisonKeywordForDurationNegative {
    return Intl.message(
      'shorter',
      name: 'timeComparisonKeywordForDurationNegative',
      desc: '',
      args: [],
    );
  }

  /// `longer`
  String get timeComparisonKeywordForDurationPositive {
    return Intl.message(
      'longer',
      name: 'timeComparisonKeywordForDurationPositive',
      desc: '',
      args: [],
    );
  }

  /// `sooner`
  String get timeComparisonKeywordForTimestampNegative {
    return Intl.message(
      'sooner',
      name: 'timeComparisonKeywordForTimestampNegative',
      desc: '',
      args: [],
    );
  }

  /// `later`
  String get timeComparisonKeywordForTimestampPositive {
    return Intl.message(
      'later',
      name: 'timeComparisonKeywordForTimestampPositive',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
