import 'package:app/commons/app_locales.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: [
        AppLocales.english,
        AppLocales.polish,
      ],
      home: Scaffold(
        body: Test(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).appName,
      ),
    );
  }
}
