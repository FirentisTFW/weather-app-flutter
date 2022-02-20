import 'package:app/data/models/named_location.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/routing.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/views/locations_list/location_list_providers.dart';
import 'package:app/views/locations_list/widgets/location_cell.dart';
import 'package:app/views/locations_list/widgets/locations_list_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationsListView extends StatelessWidget {
  const LocationsListView();

  @override
  Widget build(BuildContext context) {
    // TODO handle error cases, remove mocks
    return Scaffold(
      appBar: LocationsListAppBar(
        onAddIconPressed: () => Navigator.pushNamed(context, Routing.addLocation),
      ),
      backgroundColor: AppColors.lightYellow,
      body: Consumer(
        builder: (context, ref, __) {
          final AsyncValue<List<NamedLocation>> response = ref.watch(locationsListProvider);
          return response.when(
            data: (locations) => _buildLocationsList(context, locations),
            error: (error, __) {
              // TODO Build error container
              return const SizedBox.shrink();
            },
            loading: () => const AppProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildLocationsList(BuildContext context, List<NamedLocation> locations) {
    if (locations.isEmpty) {
      return _buildEmptyView(context);
    }
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) => LocationCell(
        location: locations[index],
      ),
      itemCount: locations.length,
      padding: AppDimensions.defaultPaddingAll,
      separatorBuilder: (_, __) => const SizedBox(
        height: 10.0,
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppDimensions.defaultPaddingHorizontal,
        child: Text(
          S.of(context).locationsListEmpty,
          style: AppTextStyles.information(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
