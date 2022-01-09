import 'package:app/commons/mocks.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/views/locations_list/widgets/location_cell.dart';
import 'package:app/views/locations_list/widgets/locations_list_app_bar.dart';
import 'package:flutter/material.dart';

class LocationsListView extends StatelessWidget {
  const LocationsListView();

  @override
  Widget build(BuildContext context) {
    // TODO Implement logic - get data from storage, handle error cases, remove mocks
    return Scaffold(
      appBar: LocationsListAppBar(
        onAddIconPressed: () {
          // TODO Implement
        },
      ),
      backgroundColor: AppColors.lightYellow,
      body: _buildLocationsList(),
    );
  }

  Widget _buildLocationsList() {
    // TODO Remove mocks
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) => LocationCell(
        location: Mocks.locations[index],
      ),
      itemCount: Mocks.locations.length,
      padding: AppDimensions.defaultPaddingAll,
      separatorBuilder: (_, __) => const SizedBox(
        height: 10.0,
      ),
    );
  }
}
