import 'package:app/commons/app_locales.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/views/home/home_view.dart';
import 'package:flutter/cupertino.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.blue,
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
