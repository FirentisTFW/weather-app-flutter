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

  /// `Mon`
  String get mondayShort {
    return Intl.message(
      'Mon',
      name: 'mondayShort',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get tuesdayShort {
    return Intl.message(
      'Tue',
      name: 'tuesdayShort',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get wednesdayShort {
    return Intl.message(
      'Wed',
      name: 'wednesdayShort',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get thursdayShort {
    return Intl.message(
      'Thu',
      name: 'thursdayShort',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get fridayShort {
    return Intl.message(
      'Fri',
      name: 'fridayShort',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get saturdayShort {
    return Intl.message(
      'Sat',
      name: 'saturdayShort',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get sundayShort {
    return Intl.message(
      'Sun',
      name: 'sundayShort',
      desc: '',
      args: [],
    );
  }

  /// `Manage locations`
  String get homeManageLocationsButton {
    return Intl.message(
      'Manage locations',
      name: 'homeManageLocationsButton',
      desc: '',
      args: [],
    );
  }

  /// `Manage locations`
  String get locationsListAppBarTitle {
    return Intl.message(
      'Manage locations',
      name: 'locationsListAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lat: {latitude}`
  String latitudeShortDisplay(Object latitude) {
    return Intl.message(
      'Lat: $latitude',
      name: 'latitudeShortDisplay',
      desc: '',
      args: [latitude],
    );
  }

  /// `Lon: {longitude}`
  String longitudeShortDisplay(Object longitude) {
    return Intl.message(
      'Lon: $longitude',
      name: 'longitudeShortDisplay',
      desc: '',
      args: [longitude],
    );
  }

  /// `Show on\nhome screen`
  String get locationCellCheckbox {
    return Intl.message(
      'Show on\nhome screen',
      name: 'locationCellCheckbox',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get addLocationSearchButton {
    return Intl.message(
      'Search',
      name: 'addLocationSearchButton',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any locations yet.\nYou can add some by clicking the plus button in the top right corner.`
  String get locationsListEmpty {
    return Intl.message(
      'You haven\'t added any locations yet.\nYou can add some by clicking the plus button in the top right corner.',
      name: 'locationsListEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Search for locations`
  String get addLocationInitial {
    return Intl.message(
      'Search for locations',
      name: 'addLocationInitial',
      desc: '',
      args: [],
    );
  }

  /// `No locations found for "{query}".`
  String addLocationsNoLocationsFoundForQuery(Object query) {
    return Intl.message(
      'No locations found for "$query".',
      name: 'addLocationsNoLocationsFoundForQuery',
      desc: '',
      args: [query],
    );
  }

  /// `Location name`
  String get addLocationInputLabel {
    return Intl.message(
      'Location name',
      name: 'addLocationInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Feature unavailable`
  String get unavailableDialogTitle {
    return Intl.message(
      'Feature unavailable',
      name: 'unavailableDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `This feature is currently unavailable, it's under development.`
  String get unavailableDialogMessage {
    return Intl.message(
      'This feature is currently unavailable, it\'s under development.',
      name: 'unavailableDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Location added`
  String get addLocationSuccessDialogTitle {
    return Intl.message(
      'Location added',
      name: 'addLocationSuccessDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `New location has been added to your list - {locationName}.`
  String addLocationSuccessDialogMessage(Object locationName) {
    return Intl.message(
      'New location has been added to your list - $locationName.',
      name: 'addLocationSuccessDialogMessage',
      desc: '',
      args: [locationName],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete location`
  String get deleteLocationDialogTitle {
    return Intl.message(
      'Delete location',
      name: 'deleteLocationDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete {locationName} from locations list?`
  String deleteLocationDialogMessage(Object locationName) {
    return Intl.message(
      'Are you sure you want to delete $locationName from locations list?',
      name: 'deleteLocationDialogMessage',
      desc: '',
      args: [locationName],
    );
  }

  /// `You need to select two locations to compare.`
  String get homeMissingLocations {
    return Intl.message(
      'You need to select two locations to compare.',
      name: 'homeMissingLocations',
      desc: '',
      args: [],
    );
  }

  /// `Temperature unit`
  String get settingsTemperatureUnitLabel {
    return Intl.message(
      'Temperature unit',
      name: 'settingsTemperatureUnitLabel',
      desc: '',
      args: [],
    );
  }

  /// `Time format`
  String get settingsTimeFormatLabel {
    return Intl.message(
      'Time format',
      name: 'settingsTimeFormatLabel',
      desc: '',
      args: [],
    );
  }

  /// `in`
  String get comparisonInKeyword {
    return Intl.message(
      'in',
      name: 'comparisonInKeyword',
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
