import 'package:app/commons/text_field_info.dart';
import 'package:app/data/mappers/geocoding_proposition_mappers.dart';
import 'package:app/errors/app_error_factory.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/modals/dialog_factory.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/universal_widgets/app_text_field.dart';
import 'package:app/universal_widgets/error_view.dart';
import 'package:app/views/add_location/add_location_arguments.dart';
import 'package:app/views/add_location/add_location_providers.dart';
import 'package:app/views/add_location/geocoding_fetch_state.dart';
import 'package:app/views/add_location/widgets/geocoding_proposition_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddLocationView extends ConsumerStatefulWidget {
  final AddLocationArguments arguments;

  const AddLocationView({
    required this.arguments,
  });

  @override
  ConsumerState<AddLocationView> createState() => _AddLocationViewState();
}

class _AddLocationViewState extends ConsumerState<AddLocationView> {
  late final TextFieldInfo _locationNameTextFieldInfo;

  @override
  void initState() {
    super.initState();
    _locationNameTextFieldInfo = TextFieldInfo();
  }

  @override
  void dispose() {
    _locationNameTextFieldInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightYellow,
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.defaultPaddingVertical,
          child: Column(
            children: [
              _buildTextField(),
              Expanded(
                child: _buildLocationsSection(),
              ),
            ].separatedBy(
              const SizedBox(
                height: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: AppDimensions.defaultPaddingHorizontal,
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              textFieldInfo: _locationNameTextFieldInfo,
              labelText: S.of(context).addLocationInputLabel,
            ),
          ),
          _buildSearchButton(),
        ].separatedBy(
          const SizedBox(
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return AdaptiveButton(
      height: 58.0,
      decoration: AppDecorations.defaultCell().copyWith(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: () => ref.read(geocodingProvider.notifier).getGeocodingPropositions(
            query: _locationNameTextFieldInfo.text,
          ),
      child: Text(
        S.of(context).addLocationSearchButton,
        style: AppTextStyles.actionButton().copyWith(
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildLocationsSection() {
    final GeocodingFetchState state = ref.watch(geocodingProvider);
    final Widget child;

    if (state is GeocodingFetchInProgress) {
      child = const AppProgressIndicator();
    } else if (state is GeocodingFetchFailure) {
      child = _buildErrorBody(context, state.error);
    } else if (state is GeocodingFetchSuccess) {
      if (state.locationPropositions.isEmpty) {
        child = _buildEmptyView();
      } else {
        child = _buildLocationsList(state);
      }
    } else {
      child = _buildEmptyView();
    }
    return AnimatedSwitcher(
      duration: AppAnimations.animatedSwitcherDuration,
      child: child,
    );
  }

  Widget _buildErrorBody(BuildContext context, dynamic error) {
    return ErrorView(
      message: AppErrorFactory.provideMessage(context, error),
      onButtonPressed: () {
        // TODO Implement - refresh page
      },
      title: AppErrorFactory.provideTitle(context, error),
    );
  }

  Widget _buildEmptyView() {
    final String query = _locationNameTextFieldInfo.text;
    final String text;
    if (query.isEmpty) {
      text = S.of(context).addLocationInitial;
    } else {
      text = S.of(context).addLocationsNoLocationsFoundForQuery(query);
    }
    return Center(
      child: Text(
        text,
        style: AppTextStyles.information(),
      ),
    );
  }

  Widget _buildLocationsList(GeocodingFetchSuccess state) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final GeocodingProposition locationProposition = state.locationPropositions[index];
        return GeocodingPropositionCell(
          geocodingProposition: GeocodingProposition(
            country: locationProposition.country,
            latitude: locationProposition.latitude,
            longitude: locationProposition.longitude,
            name: locationProposition.name,
            state: locationProposition.state,
          ),
          onPressed: _addLocation,
        );
      },
      itemCount: state.locationPropositions.length,
      padding: AppDimensions.defaultPaddingAll,
      separatorBuilder: (_, __) => const SizedBox(
        height: 8.0,
      ),
    );
  }

  void _addLocation(GeocodingProposition geocodingProposition) {
    ref.read(storageProvider).addLocation(geocodingProposition.mapToNamedLocation()).then(
      (_) {
        widget.arguments.onLocationAdded();
        DialogFactory.showSimpleDialog(
          context,
          message: S.of(context).addLocationSuccessDialogMessage(geocodingProposition.name ?? ''),
          title: S.of(context).addLocationSuccessDialogTitle,
        );
      },
    );
  }
}
