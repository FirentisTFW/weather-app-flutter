import 'package:app/commons/app_locales.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/routing.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/views/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        S.delegate,
      ],
      onGenerateRoute: (settings) => Routing.provideRoute(settings),
      onGenerateTitle: (context) => S.of(context).appName,
      supportedLocales: const [
        AppLocales.english,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.lightBrown,
          secondary: AppColors.lightBrown,
        ),
        cupertinoOverrideTheme: CupertinoTheme.of(context).copyWith(
          primaryColor: AppColors.black,
          textTheme: const CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
            ),
          ),
        ),
        fontFamily: AppTextStyles.fontFamily,
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: const Scaffold(
        body: HomeView(),
      ),
    );
  }
}
