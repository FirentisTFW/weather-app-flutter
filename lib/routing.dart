import 'package:app/views/add_location/add_location_view.dart';
import 'package:app/views/locations_list/locations_list_view.dart';
import 'package:app/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Routing {
  const Routing._();

  static const addLocation = 'add_location';
  static const locationsList = 'locations_list';
  static const settings = 'settings';

  static Route? provideRoute(RouteSettings routeSettings) {
    final Widget child;
    final String? routeName = routeSettings.name;

    switch (routeName) {
      case addLocation:
        child = const AddLocationView();
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
