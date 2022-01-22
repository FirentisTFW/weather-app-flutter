import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/networking/models/location_proposition.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:flutter/material.dart';

class LocationPropositionCell extends StatelessWidget {
  final LocationProposition locationProposition;
  final void Function(LocationProposition) onPressed;

  const LocationPropositionCell({
    required this.locationProposition,
    required this.onPressed,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      decoration: AppDecorations.defaultCell(),
      height: double.infinity,
      onPressed: () => onPressed(locationProposition),
      child: Container(
        width: double.infinity,
        padding: AppDimensions.defaultPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  locationProposition.name ?? '',
                  style: AppTextStyles.header().copyWith(fontSize: 16.0),
                ),
                Text(S.of(context).latitudeShortDisplay(locationProposition.latitudeDisplay)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    locationProposition.stateAndCountyDisplay,
                    style: AppTextStyles.text(),
                  ),
                ),
                Text(S.of(context).longitudeShortDisplay(locationProposition.longitudeDisplay)),
              ],
            ),
          ].separatedBy(
            const SizedBox(
              height: 6.0,
            ),
          ),
        ),
      ),
    );
  }
}
