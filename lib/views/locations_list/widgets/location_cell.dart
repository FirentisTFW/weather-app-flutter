import 'package:app/data/models/named_location.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:app/universal_widgets/app_checkbox.dart';
import 'package:app/universal_widgets/space.dart';
import 'package:flutter/material.dart';

class LocationCell extends StatefulWidget {
  final NamedLocation location;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onPressed;
  final void Function(bool)? onSelectPressed;

  const LocationCell({
    required this.location,
    this.onDeletePressed,
    this.onEditPressed,
    this.onPressed,
    this.onSelectPressed,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<LocationCell> createState() => _LocationCellState();
}

class _LocationCellState extends State<LocationCell> {
  late final ValueNotifier<bool> _checkboxNotifier;

  @override
  void initState() {
    super.initState();
    _checkboxNotifier = ValueNotifier<bool>(widget.location.showOnHomeScreen);
  }

  @override
  void dispose() {
    _checkboxNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.onPressed;
    if (onPressed != null) {
      return AdaptiveButton(
        decoration: AppDecorations.defaultCell(),
        height: double.infinity,
        onPressed: onPressed,
        child: _buildBody(),
      );
    }
    return DecoratedBox(
      decoration: AppDecorations.defaultCell(),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      child: Column(
        children: [
          _buildLocationNameAndIcons(),
          _buildSeparator(),
          _buildCoordinatesAndCheckbox(context),
        ].separatedBy(
          const Space.vertical(8.0),
        ),
      ),
    );
  }

  Widget _buildLocationNameAndIcons() {
    return Row(
      children: [
        Text(
          widget.location.name,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (widget.onDeletePressed != null && widget.onEditPressed != null) ...[
          const Spacer(),
          ..._provideDeleteAndEditIcons(),
        ],
      ],
    );
  }

  List<Widget> _provideDeleteAndEditIcons() {
    return [
      GestureDetector(
        onTap: widget.onDeletePressed,
        child: const Icon(
          Icons.delete,
          size: 26.0,
        ),
      ),
      const Space.horizontal(16.0),
      GestureDetector(
        onTap: widget.onEditPressed,
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

  Widget _buildCoordinatesAndCheckbox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCoordinates(context),
        if (widget.onSelectPressed != null) _buildCheckbox(context),
      ],
    );
  }

  Widget _buildCoordinates(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.of(context).latitudeShortDisplay(widget.location.latitudeDisplay),
          style: AppTextStyles.text(),
        ),
        Text(
          S.of(context).longitudeShortDisplay(widget.location.longitudeDisplay),
          style: AppTextStyles.text(),
        ),
      ].separatedBy(
        const Space.vertical(6.0),
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context) {
    final void Function(bool)? onSelectPressed = widget.onSelectPressed;
    if (onSelectPressed == null) return const SizedBox.shrink();
    return Column(
      children: <Widget>[
        AppCheckbox(
          isSelected: widget.location.showOnHomeScreen,
          onChanged: onSelectPressed,
        ),
        Text(
          S.of(context).locationCellCheckbox,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ].separatedBy(
        const Space.vertical(4.0),
      ),
    );
  }
}
