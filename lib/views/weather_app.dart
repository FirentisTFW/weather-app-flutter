import 'package:app/build_config/environment.dart';
import 'package:app/commons/app_locales.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/providers/config_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: S.of(context).appName,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        S.delegate,
      ],
      supportedLocales: const [
        AppLocales.english,
      ],
      home: const Scaffold(
        body: SizedBox(),
      ),
    );
  }
}
