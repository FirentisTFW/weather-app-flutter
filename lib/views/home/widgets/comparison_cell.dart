import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/single_location_data.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/views/home/comparison_factory.dart';
import 'package:flutter/material.dart';

class ComparisonCell extends StatelessWidget {
  final ComparisonObject comparisonObject;
  final CollectionOf2<SingleLocationData> data;

  const ComparisonCell({
    required this.comparisonObject,
    required this.data,
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
          const SizedBox(
            height: 6.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      ComparisonFactory.provideComparisonTitle(context, comparisonObject),
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
          dataFirst: true,
        ),
      ],
    );
  }

  Widget _buildLocationData(
    SingleLocationData data, {
    bool dataFirst = false,
  }) {
    return Row(
      textDirection: dataFirst ? TextDirection.rtl : TextDirection.ltr,
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
        const SizedBox(
          width: 4.0,
        ),
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
      ComparisonFactory.provideComparisonDescription(
        context,
        comparisonObject: comparisonObject,
        data: data,
      ),
      style: AppTextStyles.text(),
    );
  }
}
