import 'package:app/build_config/environment.dart';
import 'package:app/providers/config_providers.dart';
import 'package:app/views/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  environmentProvider = Provider((ref) => environment);

  runApp(
    ProviderScope(
      child: WeatherApp(),
    ),
  );
}
