import 'package:app/commons/text_field_info.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/networking/models/location_proposition.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/universal_widgets/action_button.dart';
import 'package:app/universal_widgets/app_text_field.dart';
import 'package:app/views/add_location/widgets/location_proposition_cell.dart';
import 'package:flutter/material.dart';

class AddLocationView extends StatefulWidget {
  const AddLocationView();

  @override
  State<AddLocationView> createState() => _AddLocationViewState();
}

class _AddLocationViewState extends State<AddLocationView> {
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
              _buildSearchButton(),
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
    return AppTextField(
      textFieldInfo: _locationNameTextFieldInfo,
    );
  }

  Widget _buildSearchButton() {
    return ActionButton(
      onPressed: () {
        // TODO Search locations
      },
      title: 'Search',
    );
  }

  Widget _buildLocationsList() {
    return ListView.separated(
      // TOOD Remove mocks
      shrinkWrap: true,
      itemBuilder: (_, index) => const LocationPropositionCell(
        locationProposition: LocationProposition(
          country: 'PL',
          latitude: 51.9739233,
          longitude: 17.5011254,
          name: 'Jarocin',
          state: 'Greater Poland Voivodeship',
        ),
      ),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(
        height: 4.0,
      ),
    );
  }
}
