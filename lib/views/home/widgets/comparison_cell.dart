import 'package:app/commons/collections.dart';
import 'package:app/data/enums/comparison_object.dart';
import 'package:app/data/models/single_location_data.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
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
          _buildTitle(),
          _buildLocationsData(),
          _buildSeparator(),
          _buildComparisonText(),
        ].separatedBy(
          const SizedBox(
            height: 6.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      // TODO Remove mocks - get data based on comparisonObject
      'Current temperature',
      style: TextStyle(
        color: AppColors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildLocationsData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLocationData(data.item1),
        _buildLocationData(data.item2),
      ],
    );
  }

  Widget _buildLocationData(SingleLocationData data) {
    return Row(
      children: <Widget>[
        // TODO Add styles
        Text(data.locationName),
        Text(data.data),
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

  Widget _buildComparisonText() {
    return const Text(
      // TODO Remove mocks - get data based on comparisonObject
      '11 degrees cooler in Poznań',
      style: TextStyle(
        color: AppColors.black,
        fontSize: 14.0,
      ),
    );
  }
}
