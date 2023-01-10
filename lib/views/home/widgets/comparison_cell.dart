import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/models/location_single_data.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/space.dart';
import 'package:app/utils/comparison_utils.dart';
import 'package:flutter/material.dart';

class ComparisonCell extends StatelessWidget {
  final ComparisonObject comparisonObject;
  final CollectionOf2<LocationSingleData> data;
  final TemperatureUnit temperatureUnit;

  const ComparisonCell({
    required this.comparisonObject,
    required this.data,
    required this.temperatureUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.defaultCell(),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        children: [
          _buildTitle(context),
          _buildLocationsData(),
          _buildSeparator(),
          _buildComparisonText(context),
        ].separatedBy(
          const Space.vertical(6.0),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      ComparisonUtils.provideComparisonTitle(context, comparisonObject),
      style: AppTextStyles.header(),
    );
  }

  Widget _buildLocationsData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLocationData(data.item1),
        _buildLocationData(
          data.item2,
          isFirstItem: false,
        ),
      ],
    );
  }

  Widget _buildLocationData(
    LocationSingleData data, {
    bool isFirstItem = true,
  }) {
    return Row(
      textDirection: isFirstItem ? TextDirection.ltr : TextDirection.rtl,
      children: <Widget>[
        Text(
          data.locationName,
          style: AppTextStyles.text(),
        ),
        Text(
          data.dataDisplay,
          style: AppTextStyles.header(),
        ),
      ].separatedBy(
        const Space.horizontal(4.0),
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: AppColors.lightGrey,
    );
  }

  Widget _buildComparisonText(BuildContext context) {
    return Text(
      ComparisonUtils.provideComparisonDescription(
        context,
        comparisonObject: comparisonObject,
        data: data,
        temperatureUnit: temperatureUnit,
      ),
      style: AppTextStyles.text(),
    );
  }
}
