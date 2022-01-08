import 'package:app/extensions/list_extensions.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/app_checkbox.dart';
import 'package:flutter/material.dart';

class LocationCell extends StatelessWidget {
  const LocationCell({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.defaultCell(),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      child: Column(
        children: [
          _buildLocationNameAndIcons(),
          _buildSeparator(),
          _buildCoordinatesAndCheckbox(),
        ].separatedBy(
          const SizedBox(
            height: 8.0,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationNameAndIcons() {
    return Row(
      children: [
        // TODO Remove mocks
        const Text(
          'Poznań',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        ..._provideDeleteAndEditIcons(),
      ],
    );
  }

  List<Widget> _provideDeleteAndEditIcons() {
    return [
      GestureDetector(
        onTap: () {
          // TODO Implement - delete location
        },
        child: const Icon(
          Icons.delete,
          size: 26.0,
        ),
      ),
      const SizedBox(
        width: 16.0,
      ),
      GestureDetector(
        onTap: () {
          // TODO Implement - edit location
        },
        child: const Icon(
          Icons.edit,
          size: 26.0,
        ),
      ),
    ];
  }

  Widget _buildSeparator() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: AppColors.lightGrey,
      ),
      height: 1.0,
      width: double.infinity,
    );
  }

  Widget _buildCoordinatesAndCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCoordinates(),
        _buildCheckbox(),
      ],
    );
  }

  Widget _buildCoordinates() {
    // TODO Remove mocks
    return Column(
      children: <Widget>[
        Text(
          'Lat: 52.1234',
          style: AppTextStyles.text(),
        ),
        Text(
          'Lon: 16.3355',
          style: AppTextStyles.text(),
        ),
      ].separatedBy(
        const SizedBox(
          height: 6.0,
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    // TODO Add checkbox logic, remove mocks
    return Column(
      children: <Widget>[
        const AppCheckbox(),
        const Text(
          'Show on\nhome screen',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ].separatedBy(
        const SizedBox(
          height: 4.0,
        ),
      ),
    );
  }
}
