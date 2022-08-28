import 'package:app/views/geocoding/geocoding_arguments.dart';
import 'package:app/views/geocoding/geocoding_view.dart';
import 'package:app/views/locations_list/locations_list_view.dart';
import 'package:app/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Routing {
  const Routing._();

  static const String geocoding = 'geocoding';
  static const String locationsList = 'locations_list';
  static const String settings = 'settings';

  static Route? provideRoute(RouteSettings routeSettings) {
    final Widget child;
    final String? routeName = routeSettings.name;
    final dynamic arguments = routeSettings.arguments;

    switch (routeName) {
      case geocoding:
        child = GeocodingView(
          arguments: arguments as GeocodingArguments,
        );
        break;
      case locationsList:
        child = const LocationsListView();
        break;
      case settings:
        child = const SettingsView();
        break;
      default:
        return null;
    }

    return MaterialPageRoute(
      builder: (_) => child,
      settings: routeSettings,
    );
  }
}
