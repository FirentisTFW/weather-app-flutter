import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/networking/models/location_proposition.dart';
import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:flutter/material.dart';

class LocationPropositionCell extends StatelessWidget {
  final LocationProposition locationProposition;

  const LocationPropositionCell({
    required this.locationProposition,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      decoration: AppDecorations.defaultCell(),
      height: double.infinity,
      onPressed: () {
        // TODO Implement - save location to storage
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TODO Remove mocks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name: ${locationProposition.name}',
                  style: AppTextStyles.text(),
                ),
                Text(S.of(context).latitudeShortDisplay(locationProposition.latitudeDisplay)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Country: ${locationProposition.country}',
                  style: AppTextStyles.text(),
                ),
                Text(S.of(context).latitudeShortDisplay(locationProposition.longitudeDisplay)),
              ],
            ),
            Text(
              'State: ${locationProposition.state}',
              style: AppTextStyles.text(),
            ),
          ].separatedBy(
            const SizedBox(
              height: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
