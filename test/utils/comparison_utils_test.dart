import 'package:app/commons/app_locales.dart';
import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/location_single_data.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/utils/comparison_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/widget_test_helpers.dart';

void main() {
  const Widget materialApp = MaterialApp(
    localizationsDelegates: [
      ...GlobalMaterialLocalizations.delegates,
      S.delegate,
    ],
    supportedLocales: [
      AppLocales.english,
    ],
    home: TestPlaceholder(),
  );
  group('ComparisonUtilsTest -', () {
    // NOTE These tests are widget tests although they don't test widgets behavior.
    // Pumping widget is only necessary for localizations tests.
    group('provideComparisonDescription -', () {
      group('Provided temperature as comparison object -', () {
        testWidgets('Negative difference', (WidgetTester tester) async {
          await tester.pumpWidget(materialApp);
          await tester.pumpAndSettle(); // Wait for localization delegates to complete
          final String result = ComparisonUtils.provideComparisonDescription(
            tester.context,
            comparisonObject: ComparisonObject.currentTemperature,
            data: const CollectionOf2(
              LocationSingleData(
                data: 10.0,
                dataDisplay: '',
                locationName: 'Poznań',
              ),
              LocationSingleData(
                data: 20.0,
                dataDisplay: '',
                locationName: 'Malaga',
              ),
            ),
          );
          expect(result, '10°C cooler in Poznań');
        });
        testWidgets('Positive difference', (WidgetTester tester) async {
          await tester.pumpWidget(materialApp);
          await tester.pumpAndSettle(); // Wait for localization delegates to complete
          final String result = ComparisonUtils.provideComparisonDescription(
            tester.context,
            comparisonObject: ComparisonObject.currentTemperature,
            data: const CollectionOf2(
              LocationSingleData(
                data: 32.1,
                dataDisplay: '',
                locationName: 'Poznań',
              ),
              LocationSingleData(
                data: 30.7,
                dataDisplay: '',
                locationName: 'Malaga',
              ),
            ),
          );
          expect(result, '1°C warmer in Poznań');
        });
      });

      group('Provided time as comparison object -', () {
        group('Timestamp difference -', () {
          testWidgets('Negative timestamp difference', (WidgetTester tester) async {
            await tester.pumpWidget(materialApp);
            await tester.pumpAndSettle(); // Wait for localization delegates to complete
            final String result = ComparisonUtils.provideComparisonDescription(
              tester.context,
              comparisonObject: ComparisonObject.sunrise,
              data: const CollectionOf2(
                LocationSingleData(
                  data: 1639897153, // 06:59:13
                  dataDisplay: '',
                  locationName: 'Poznań',
                ),
                LocationSingleData(
                  data: 1639898730, // 07:25:30
                  dataDisplay: '',
                  locationName: 'Malaga',
                ),
              ),
            );
            expect(result, '26 minutes sooner in Poznań');
          });
          testWidgets('Positive timestamp difference', (WidgetTester tester) async {
            await tester.pumpWidget(materialApp);
            await tester.pumpAndSettle(); // Wait for localization delegates to complete
            final String result = ComparisonUtils.provideComparisonDescription(
              tester.context,
              comparisonObject: ComparisonObject.sunrise,
              data: const CollectionOf2(
                LocationSingleData(
                  data: 1639898730, // 07:25:30
                  dataDisplay: '',
                  locationName: 'Poznań',
                ),
                LocationSingleData(
                  data: 1639897153, // 06:59:13
                  dataDisplay: '',
                  locationName: 'Malaga',
                ),
              ),
            );
            expect(result, '26 minutes later in Poznań');
          });
        });

        group('Duration difference -', () {
          testWidgets('Negative duration difference', (WidgetTester tester) async {
            await tester.pumpWidget(materialApp);
            await tester.pumpAndSettle(); // Wait for localization delegates to complete
            final String result = ComparisonUtils.provideComparisonDescription(
              tester.context,
              comparisonObject: ComparisonObject.dayLength,
              data: const CollectionOf2(
                LocationSingleData(
                  data: 27622, // 7h 40m 22s
                  dataDisplay: '',
                  locationName: 'Poznań',
                ),
                LocationSingleData(
                  data: 34724, // 9h 38m 44s
                  dataDisplay: '',
                  locationName: 'Malaga',
                ),
              ),
            );
            expect(result, '1 hour 58 minutes shorter in Poznań');
          });
          testWidgets('Positive duration difference', (WidgetTester tester) async {
            await tester.pumpWidget(materialApp);
            await tester.pumpAndSettle(); // Wait for localization delegates to complete
            final String result = ComparisonUtils.provideComparisonDescription(
              tester.context,
              comparisonObject: ComparisonObject.dayLength,
              data: const CollectionOf2(
                LocationSingleData(
                  data: 34724, // 9h 38m 44s
                  dataDisplay: '',
                  locationName: 'Poznań',
                ),
                LocationSingleData(
                  data: 27622, // 7h 40m 22s
                  dataDisplay: '',
                  locationName: 'Malaga',
                ),
              ),
            );
            expect(result, '1 hour 58 minutes longer in Poznań');
          });
        });
      });
    });
  });
}
