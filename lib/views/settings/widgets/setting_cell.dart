import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SettingCell<T> extends StatelessWidget {
  final T initialValue;
  final String label;
  final List<T> values;
  final void Function(T?) onChanged;

  const SettingCell({
    required this.initialValue,
    required this.label,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 4.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.information(),
          ),
          _buildDropdownButton(context),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    return DropdownButton<T>(
      value: initialValue,
      onChanged: onChanged,
      items: values
          .map(
            (value) => DropdownMenuItem(
              value: value,
              child: Text(
                // TODO Clean up this
                value is TemperatureUnit
                    ? value.getUnitDisplay(context)
                    : value is TimeFormat
                        ? value.getFormatDisplay(context)
                        : '',
                style: AppTextStyles.information(),
              ),
            ),
          )
          .toList(),
    );
  }
}
