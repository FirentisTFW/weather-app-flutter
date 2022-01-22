// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(latitude) => "Lat: ${latitude}";

  static String m1(longitude) => "Lon: ${longitude}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addLocationSearchButton":
            MessageLookupByLibrary.simpleMessage("Search"),
        "appName": MessageLookupByLibrary.simpleMessage("Weather App"),
        "comparisonCurrentTemperature":
            MessageLookupByLibrary.simpleMessage("Current temperature"),
        "comparisonDayLength":
            MessageLookupByLibrary.simpleMessage("Day length"),
        "comparisonDayTemperature":
            MessageLookupByLibrary.simpleMessage("Day temperature"),
        "comparisonNightTemperature":
            MessageLookupByLibrary.simpleMessage("Night temperature"),
        "comparisonSunrise": MessageLookupByLibrary.simpleMessage("Sunrise"),
        "comparisonSunset": MessageLookupByLibrary.simpleMessage("Sunset"),
        "defaultErrorMessage": MessageLookupByLibrary.simpleMessage(
            "An error occured while fetching data."),
        "defaultErrorTitle":
            MessageLookupByLibrary.simpleMessage("Oops, something went wrong"),
        "fridayShort": MessageLookupByLibrary.simpleMessage("Fri"),
        "homeManageLocationsButton":
            MessageLookupByLibrary.simpleMessage("Manage locations"),
        "latitudeShortDisplay": m0,
        "locationCellCheckbox":
            MessageLookupByLibrary.simpleMessage("Show on\nhome screen"),
        "locationsListAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Manage locations"),
        "longitudeShortDisplay": m1,
        "mondayShort": MessageLookupByLibrary.simpleMessage("Mon"),
        "saturdayShort": MessageLookupByLibrary.simpleMessage("Sat"),
        "sundayShort": MessageLookupByLibrary.simpleMessage("Sun"),
        "temperatureComparisonKeywordNegative":
            MessageLookupByLibrary.simpleMessage("cooler"),
        "temperatureComparisonKeywordPositive":
            MessageLookupByLibrary.simpleMessage("warmer"),
        "thursdayShort": MessageLookupByLibrary.simpleMessage("Thu"),
        "timeComparisonKeywordForDurationNegative":
            MessageLookupByLibrary.simpleMessage("shorter"),
        "timeComparisonKeywordForDurationPositive":
            MessageLookupByLibrary.simpleMessage("longer"),
        "timeComparisonKeywordForTimestampNegative":
            MessageLookupByLibrary.simpleMessage("sooner"),
        "timeComparisonKeywordForTimestampPositive":
            MessageLookupByLibrary.simpleMessage("later"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "tuesdayShort": MessageLookupByLibrary.simpleMessage("Tue"),
        "wednesdayShort": MessageLookupByLibrary.simpleMessage("Wed")
      };
}
