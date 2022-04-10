import 'package:app/commons/text_field_info.dart';
import 'package:app/data/mappers/geocoding_proposition_mappers.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/modals/dialog_factory.dart';
import 'package:app/networking/models/geocoding_proposition.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:app/universal_widgets/app_text_field.dart';
import 'package:app/views/add_location/add_location_providers.dart';
import 'package:app/views/add_location/widgets/geocoding_proposition_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddLocationView extends ConsumerStatefulWidget {
  const AddLocationView();

  @override
  ConsumerState<AddLocationView> createState() => _AddLocationViewState();
}

class _AddLocationViewState extends ConsumerState<AddLocationView> {
  late final TextFieldInfo _locationNameTextFieldInfo;

  @override
  void initState() {
    super.initState();
    _locationNameTextFieldInfo = TextFieldInfo(
      controller: TextEditingController(),
      focusNode: FocusNode(),
    );
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
                child: _buildLocationsList(),
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

  Widget _buildLocationsList() {
    final List<GeocodingProposition> propositions = ref.watch(geocodingProvider);

    if (propositions.isEmpty) {
      return _buildEmptyView();
    }

    return ListView.separated(
      itemBuilder: (_, index) => GeocodingPropositionCell(
        geocodingProposition: GeocodingProposition(
          country: propositions[index].country,
          latitude: propositions[index].latitude,
          longitude: propositions[index].longitude,
          name: propositions[index].name,
          state: propositions[index].state,
        ),
        onPressed: _addLocation,
      ),
      itemCount: propositions.length,
      padding: AppDimensions.defaultPaddingAll,
      separatorBuilder: (_, __) => const SizedBox(
        height: 8.0,
      ),
      shrinkWrap: true,
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

  void _addLocation(GeocodingProposition geocodingProposition) {
    ref.read(storageProvider).addLocation(geocodingProposition.mapToNamedLocation()).then(
          (_) => DialogFactory.showSimpleDialog(
            context,
            message: S.of(context).addLocationSuccessDialogMessage(geocodingProposition.name ?? ''),
            title: S.of(context).addLocationSuccessDialogTitle,
          ),
        );
  }
}
