import 'package:app/data/models/named_location.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/modals/dialog_factory.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/routing.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/views/add_location/add_location_arguments.dart';
import 'package:app/views/locations_list/location_list_providers.dart';
import 'package:app/views/locations_list/locations_list_state.dart';
import 'package:app/views/locations_list/widgets/location_cell.dart';
import 'package:app/views/locations_list/widgets/locations_list_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationsListView extends ConsumerStatefulWidget {
  const LocationsListView();

  @override
  ConsumerState<LocationsListView> createState() => _LocationsListViewState();
}

class _LocationsListViewState extends ConsumerState<LocationsListView> {
  @override
  void initState() {
    super.initState();
    _getLocations();
  }

  void _getLocations() {
    ref.read(locationsListProvider.notifier).getLocations();
  }

  @override
  Widget build(BuildContext context) {
    // TODO handle error cases, remove mocks
    return Scaffold(
      appBar: LocationsListAppBar(
        onAddIconPressed: () => Navigator.pushNamed(
          context,
          Routing.addLocation,
          arguments: AddLocationArguments(
            onLocationAdded: _getLocations,
          ),
        ),
      ),
      backgroundColor: AppColors.lightYellow,
      body: _buildLocationsSection(),
    );
  }

  Widget _buildLocationsSection() {
    final LocationsListState state = ref.watch(locationsListProvider);

    final Widget child;
    if (state is LocationsListFetchSuccess) {
      child = _buildLocationsList(context, state);
    } else {
      child = const AppProgressIndicator();
    }
    return AnimatedSwitcher(
      duration: AppAnimations.animatedSwitcherDuration,
      child: child,
    );
  }

  Widget _buildLocationsList(BuildContext context, LocationsListFetchSuccess state) {
    if (state.locations.isEmpty) {
      return _buildEmptyView(context);
    }
    return ListView.separated(
      itemBuilder: (_, index) {
        final NamedLocation location = state.locations[index];
        return LocationCell(
          location: location,
          onDeletePressed: () => _onDeleteLocationPressed(location),
          onEditPressed: () {
            // TODO Implement
          },
          onSelectPressed: (isSelected) {
            // TODO Implement
          },
        );
      },
      itemCount: state.locations.length,
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

  void _onDeleteLocationPressed(NamedLocation location) {
    DialogFactory.showSimpleDialog(
      context,
      message: S.of(context).deleteLocationDialogMessage(location.name),
      title: S.of(context).deleteLocationDialogTitle,
      actions: [
        DialogFactory.buildAction(
          onPressed: () => Navigator.pop(context),
          text: S.of(context).cancel,
        ),
        DialogFactory.buildAction(
          onPressed: () async {
            await ref.read(storageProvider).deleteLocation(location.id);
            ref.read(locationsListProvider.notifier).getLocations();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          text: S.of(context).yes,
        ),
      ],
    );
  }
}
