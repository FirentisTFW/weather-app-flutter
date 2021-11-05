import 'package:app/commons/app_locales.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        S.delegate,
      ],
      onGenerateTitle: (context) => S.of(context).appName,
      supportedLocales: const [
        AppLocales.english,
      ],
      home: const Scaffold(
        body: SizedBox(),
      ),
    );
  }
}
