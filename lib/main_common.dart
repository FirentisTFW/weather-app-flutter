import 'dart:io';

import 'package:app/build_config/environment.dart';
import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/data/models/named_location.dart';
import 'package:app/providers/config_providers.dart';
import 'package:app/views/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO Move these calls somewhere else
  final Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(NamedLocationAdapter());
  Hive.registerAdapter(TemperatureUnitAdapter());
  Hive.registerAdapter(TimeFormatAdapter());

  environmentProvider = Provider((ref) => environment);

  runApp(
    ProviderScope(
      child: WeatherApp(),
    ),
  );
}
