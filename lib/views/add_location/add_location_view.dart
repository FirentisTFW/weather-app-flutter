import 'package:app/commons/text_field_info.dart';
import 'package:app/data/mappers/location_proposition_mappers.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/networking/models/location_proposition.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:app/universal_widgets/app_text_field.dart';
import 'package:app/views/add_location/widgets/location_proposition_cell.dart';
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
      // TODO move string to intl
      labelText: 'Location name',
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
          padding: AppDimensions.defaultPaddingAll,
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
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            textFieldInfo: _locationNameTextFieldInfo,
          ),
        ),
        _buildSearchButton(),
      ].separatedBy(
        const SizedBox(
          width: 10.0,
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
      onPressed: () {
        // TODO Send request to get locations based on query
        // ref.read(storageProvider).addLocation(location);
      },
      child: Text(
        S.of(context).addLocationSearchButton,
        style: AppTextStyles.actionButton().copyWith(
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildLocationsList() {
    return ListView.separated(
      // TOOD Remove mocks
      shrinkWrap: true,
      itemBuilder: (_, index) => LocationPropositionCell(
        locationProposition: const LocationProposition(
          country: 'PL',
          latitude: 51.9739233,
          longitude: 17.5011254,
          name: 'Jarocin',
          state: 'Greater Poland Voivodeship',
        ),
        onPressed: _addLocation,
      ),
      itemCount: 4,
      padding: AppDimensions.defaultPaddingVertical,
      separatorBuilder: (_, __) => const SizedBox(
        height: 8.0,
      ),
    );
  }

  Future<void> _addLocation(LocationProposition locationProposition) async {
    await ref.read(storageProvider).addLocation(locationProposition.mapToNamedLocation());

    // TODO Show success dialog
  }
}
