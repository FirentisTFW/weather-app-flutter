import 'package:app/data/models/named_location.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/modals/bottom_sheets/basic_bottom_sheet.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/views/locations_list/widgets/location_cell.dart';
import 'package:flutter/material.dart';

class SelectedLocationsBottomSheet {
  final BuildContext context;
  final List<NamedLocation> locations;
  final void Function(String locationId) onLocationPressed;

  const SelectedLocationsBottomSheet(
    this.context, {
    required this.locations,
    required this.onLocationPressed,
  });

  Future<void> show() {
    return BasicBottomSheet(
      context,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildDescription(),
            _buildListItems(),
          ].separatedBy(
            const SizedBox(
              height: 20.0,
            ),
          ),
        ),
      ),
    ).show();
  }

  Widget _buildDescription() {
    return Text(
      'You have already selected two locations. Which one do you want to unselect?',
      style: AppTextStyles.header(),
    );
  }

  Widget _buildListItems() {
    return ListView.separated(
      itemBuilder: (_, index) => LocationCell(
        location: locations[index],
        onPressed: () {
          // TODO Consider dialog for confirmation
          onLocationPressed(locations[index].id);
          Navigator.of(context).pop();
        },
      ),
      itemCount: locations.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: 10.0,
      ),
    );
  }
}
